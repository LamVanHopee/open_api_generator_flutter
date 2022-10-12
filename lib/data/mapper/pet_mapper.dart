import 'package:built_collection/src/list.dart';
import 'package:open_api_generator_flutter/core/base/base_mapper.dart';
import 'package:open_api_generator_flutter/data/mapper/category_mapper.dart';
import 'package:open_api_generator_flutter/data/mapper/tag_mapper.dart';
import 'package:open_api_generator_flutter/domain/entity/pet.dart';
import 'package:openapi/openapi.dart';

class PetMapper extends BaseMapper<Pet, PetEntity> {
  @override
  Pet mapToDTO(PetEntity entity) {
    return Pet((builder) {
      builder.name = entity.name;
      builder.tags =
          (entity.tags == null ? null : TagMapper().mapToDTOs(entity.tags).toBuiltList()) as ListBuilder<Tag>?;
      if (entity.category != null) {
        builder.category.replace(CategoryMapper().mapToDTO(entity.category!));
      }
      builder.status = entity.status;
    });
  }

  @override
  PetEntity mapToEntity(Pet dto) {
    return PetEntity(
      name: dto.name,
      photoUrls: List.of(dto.photoUrls.map((p0) => p0)),
      status: dto.status,
      id: dto.id,
      category: dto.category == null ? null : CategoryMapper().mapToEntity(dto.category!),
      tags: dto.tags == null ? null : TagMapper().mapToEntities(dto.tags!.asList()),
    );
  }
}
