import 'package:open_api_generator_flutter/core/base/base_mapper.dart';
import 'package:open_api_generator_flutter/domain/entity/category.dart';
import 'package:openapi/openapi.dart';

class CategoryMapper extends BaseMapper<Category, CategoryEntity> {
  @override
  Category mapToDTO(CategoryEntity entity) {
    var builder = CategoryBuilder()
      ..name = entity.name
      ..id = entity.id;
    return builder.build();
  }

  @override
  CategoryEntity mapToEntity(Category dto) {
    return CategoryEntity(id: dto.id, name: dto.name);
  }
}
