import 'package:get/instance_manager.dart';
import 'package:open_api_generator_flutter/data/repository/pet_repository.dart';
import 'package:open_api_generator_flutter/data/repository_impl/pet_repository_impl.dart';
import 'pet_controller.dart';

class PetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PetController>(() => PetController());
    Get.lazyPut<PetRepository>(() => PetRepositoryImpl());
  }
}
