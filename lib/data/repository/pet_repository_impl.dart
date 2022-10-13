import 'package:get/get.dart';
import 'package:open_api_generator_flutter/data/mapper/pet_mapper.dart';
import 'package:open_api_generator_flutter/domain/entity/pet.dart';
import 'package:open_api_generator_flutter/domain/repository/pet_repository.dart';
import 'package:openapi/openapi.dart';

class PetRepositoryImpl implements PetRepository {
  var petAPI = Get.find<Openapi>().getPetApi();

  @override
  Future<PetEntity?> addPet(PetEntity petEntity) async {
    PetEntity? petResponse;
    var response = await petAPI.addPet(pet: PetMapper().mapToDTO(petEntity));
    if (response.data != null) {
      petResponse = PetMapper().mapToEntity(response.data!);
    }
    return petResponse;
  }

  @override
  Future<void> removePet(int petId) {
    return petAPI.deletePet(petId: petId);
  }
}
