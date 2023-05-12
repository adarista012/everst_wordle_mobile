class HeroDetails {
  int? id;
  String? title;
  String? url;

  HeroDetails(this.id, this.title, this.url);

  HeroDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
  }
}
