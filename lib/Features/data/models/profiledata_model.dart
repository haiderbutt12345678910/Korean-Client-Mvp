import 'package:flutter_application_assignmnet/Features/domain/entities/profiledata_entity.dart';

class ProfileDataModel extends ProfileDataEntity {
  ProfileDataModel(
      {int? age,
      String? description,
      List<dynamic>? images,
      int? likeCount,
      String? location,
      String? name,
      List<dynamic>? tags})
      : super(
          age: age,
          description: description,
          images: images,
          likeCount: likeCount,
          location: location,
          name: name,
          tags: tags,
        );

  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'description': description,
      'images': images,
      'likeCount': likeCount,
      'location': location,
      'name': name,
      'tags': tags,
    };
  }

  // Create a ProfileDataEntity from a JSON Map
  factory ProfileDataModel.fromJson(Map<String, dynamic> json) {
    return ProfileDataModel(
      age: json['age'] as int?,
      description: json['description'] as String?,
      images: json['images'] as List<dynamic>?,
      likeCount: json['likeCount'] as int?,
      location: json['location'] as String?,
      name: json['name'] as String?,
      tags: json['tags'] as List<dynamic>?,
    );
  }
}
