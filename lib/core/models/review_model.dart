import 'package:fruits_store/core/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String imgae;
  final String reviewDescription;
  final String date;
  final num rating;

  ReviewModel({
    required this.name,
    required this.imgae,
    required this.reviewDescription,
    required this.date,
    required this.rating,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      imgae: entity.imgae,
      reviewDescription: entity.reviewDescription,
      date: entity.date,
      rating: entity.rating,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      imgae: json['image'],
      reviewDescription: json['reviewDescription'],
      date: json['date'],
      rating: json['rating'],
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      imgae: imgae,
      reviewDescription: reviewDescription,
      date: date,
      rating: rating,
    );
  }

  toJson() {
    return {
      'name': name,
      'image': imgae,
      'reviewDescription': reviewDescription,
      'date': date,
      'rating': rating,
    };
  }
}
