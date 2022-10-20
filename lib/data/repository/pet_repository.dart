
import 'package:openapi/openapi.dart';

abstract class PetRepository {
  Future<Pet?> addPet(Pet petEntity);
  Future<void> removePet(int petId);
}