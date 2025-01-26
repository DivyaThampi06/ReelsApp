import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/reels_bloc.dart';
import '../widgets/reels_view.dart';

class ReelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ReelsBloc, ReelsState>(
        builder: (context, state) {
          if (state is ReelsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ReelsLoadedState) {
            return ReelsView(reels: state.reels);
          } else if (state is ReelsErrorState) {
            return Center(child: Text(state.errorMessage));
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
