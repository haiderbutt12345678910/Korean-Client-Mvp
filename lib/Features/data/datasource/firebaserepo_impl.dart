import 'dart:convert';

import 'package:flutter_application_assignmnet/Features/data/datasource/firebaserepo.dart';
import 'package:flutter_application_assignmnet/Features/data/models/profiledata_model.dart';
import 'package:flutter_application_assignmnet/Features/domain/entities/profiledata_entity.dart';
import 'package:http/http.dart' as http;

class FirebaserepoImpl extends Firebaserepo {
  @override
  Future<List<ProfileDataEntity>> readProfileData() async {
    const String firebaseEndpoint =
        "https://assinmentluvit-default-rtdb.asia-southeast1.firebasedatabase.app/data.json";

    try {
      final response = await http.get(Uri.parse(firebaseEndpoint));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<ProfileDataEntity> profiles = [];

        // Loop through the data map to convert each subkey to a ProfileDataEntity
        data.forEach((key, value) {
          final profileData = ProfileDataModel.fromJson(value);
          profiles.add(profileData);
        });

        return profiles;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Future<void> updateProfileData(
      String key, ProfileDataEntity profileDataEntity) async {
    const apiUrl = 'https://frontassignment.hyperhire.in/change/';

    // Define the data to update the "likeCount" to 180
    final data = {
      "data": {
        key: ProfileDataModel(
                age: profileDataEntity.age,
                description: profileDataEntity.description,
                images: profileDataEntity.images,
                likeCount: profileDataEntity.likeCount,
                location: profileDataEntity.location,
                name: profileDataEntity.name,
                tags: profileDataEntity.tags)
            .toJson()
      }
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(data), // Encode the data as a JSON string
      );
    } catch (e) {
      Exception(e);
    }
  }
}
