import 'package:get/get.dart';
import 'package:openapi/openapi.dart';
import '../repository/pet_repository.dart';

class PetRepositoryImpl implements PetRepository {
  var petAPI = Get.find<Openapi>().getPetApi();

  @override
  Future<Pet?> addPet(Pet pet) async {
    Pet? petResponse;
    var response = await petAPI.addPet(pet: pet);
    if (response.data != null) {
      petResponse = response.data;
    }
    return petResponse;
  }

  @override
  Future<void> removePet(int petId) {
    return petAPI.deletePet(petId: petId);
  }
}
