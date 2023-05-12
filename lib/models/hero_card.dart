class HeroCard {
  int? id;
  String? name;
  String? thumbnailUrl;

  HeroCard({
    this.id,
    this.name,
    this.thumbnailUrl,
  });

  HeroCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnailUrl =
        json['thumbnail']['path'] + '.' + json['thumbnail']['extension'];
  }
}
