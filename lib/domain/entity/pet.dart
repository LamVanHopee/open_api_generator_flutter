import 'package:open_api_generator_flutter/domain/entity/tag.dart';
import 'package:openapi/openapi.dart';

import 'category.dart';

class PetEntity {
  PetEntity({this.id, this.category, required this.name, required this.photoUrls, this.tags, required this.status});

  final int? id;
  final CategoryEntity? category;
  final String name;
  final List<String> photoUrls;
  final List<TagEntity>? tags;
  final PetStatusEnum? status;
}
