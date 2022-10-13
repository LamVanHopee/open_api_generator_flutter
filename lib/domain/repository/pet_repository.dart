import '../entity/pet.dart';

abstract class PetRepository {
  Future<PetEntity?> addPet(PetEntity petEntity);
  Future<void> removePet(int petId);
}