import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/reel.dart';

// BLoC Events
abstract class ReelsEvent {}

class FetchReelsEvent extends ReelsEvent {}

// BLoC States
abstract class ReelsState {}

class ReelsLoadingState extends ReelsState {}

class ReelsLoadedState extends ReelsState {
  final List<Reel> reels;
  ReelsLoadedState({required this.reels});
}

class ReelsErrorState extends ReelsState {
  final String errorMessage;
  ReelsErrorState(this.errorMessage);
}


class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {
  static const String apiUrl = 'https://api.ulearna.com/bytes/all';
  int page = 1;
  final int limit = 10;
  final List<Reel> _reels = [];

  ReelsBloc() : super(ReelsLoadingState()) {
    on<FetchReelsEvent>((event, emit) async {
      emit(ReelsLoadingState());
      try {
        final url = '$apiUrl?page=$page&limit=$limit&country=United+States';


        final response = await http.get(Uri.parse(url));


        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonResponse = jsonDecode(response.body);


          final List<dynamic> data = jsonResponse['data']['data'];


          final List<Reel> fetchedReels =
          data.map((item) => Reel.fromJson(item)).toList();

          if (fetchedReels.isNotEmpty) {
            _reels.addAll(fetchedReels);
            page++;
          }

          emit(ReelsLoadedState(reels: List.unmodifiable(_reels)));
        } else {
          emit(ReelsErrorState('Error fetching data: ${response.statusCode}'));
        }
      } catch (e) {
        print('Error: $e');
        emit(ReelsErrorState('An error occurred: $e'));
      }
    });
  }
}
