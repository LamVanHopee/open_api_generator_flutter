import 'package:open_api_generator_flutter/core/base/base_mapper.dart';
import 'package:open_api_generator_flutter/domain/entity/tag.dart';
import 'package:openapi/openapi.dart';

class TagMapper extends BaseMapper<Tag, TagEntity> {
  @override
  Tag mapToDTO(TagEntity entity) {
    var builder = TagBuilder()
      ..name = entity.name
      ..id = entity.id;
    return builder.build();
  }

  @override
  TagEntity mapToEntity(Tag dto) {
    return TagEntity(id: dto.id, name: dto.name);
  }
}
