class Reel {
  final String title;
  final String thumbCdnUrl;
  final int totalViews;
  final int totalLikes;
  final String? username;
  final String? userProfilePicture;

  Reel({
    required this.title,
    required this.thumbCdnUrl,
    required this.totalViews,
    required this.totalLikes,
    this.username,
    this.userProfilePicture,
  });

  factory Reel.fromJson(Map<String, dynamic> json) {
    return Reel(
      title: json['title'] ?? 'No Title',
      thumbCdnUrl: json['thumb_cdn_url'] ?? '',
      totalViews: json['total_views'] ?? 0,
      totalLikes: json['total_likes'] ?? 0,
      username: json['user']?['username'],
      userProfilePicture: json['user']?['profile_picture_cdn'],
    );
  }
}
