// ignore_for_file: public_member_api_docs, sort_constructors_first
//this entity is for single data for a profile

class ProfileDataEntity {
  int? age;
  String? description;
  List<dynamic>? images;
  int? likeCount;
  String? location;
  String? name;
  List<dynamic>? tags;
  ProfileDataEntity({
    this.age,
    this.description,
    this.images,
    this.likeCount,
    this.location,
    this.name,
    this.tags,
  });
}
