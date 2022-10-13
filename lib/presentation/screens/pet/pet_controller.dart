import 'dart:math';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:open_api_generator_flutter/core/base/base_controller.dart';
import 'package:open_api_generator_flutter/domain/entity/category.dart';
import 'package:open_api_generator_flutter/domain/entity/pet.dart';
import 'package:open_api_generator_flutter/domain/entity/tag.dart';
import 'package:open_api_generator_flutter/domain/repository/pet_repository.dart';
import 'package:openapi/openapi.dart';

class PetController extends BaseController {
  var random = Random();
  final petRepository = Get.find<PetRepository>();
  var pets = <PetEntity>[].obs;

  void addPet() async {
    try {
      EasyLoading.show();
      var pet = await petRepository.addPet(PetEntity(
        name: getPetName(),
        photoUrls: [],
        status: PetStatusEnum.available,
        tags: [
          TagEntity(id: 1, name: "Sale"),
          TagEntity(id: 2, name: "Sale"),
        ],
        category: CategoryEntity(
          name: 'Dog',
          id: 2,
        ),
      ));
      EasyLoading.dismiss();
      if (pet != null) {
        pets.add(pet);
      }
    } catch (e) {
      handleException(e);
    }
  }

  void removePet() async {
    try {
      EasyLoading.show();
      var pet =
          await petRepository.addPet(PetEntity(name: getPetName(), photoUrls: [], status: PetStatusEnum.available));
      EasyLoading.dismiss();
      if (pet != null) {
        pets.add(pet);
      }
    } catch (e) {
      handleException(e);
    }
  }

  String getPetName() {
    String name = '';
    for (int i = 0; i < 3; i++) {
      name += getChar();
    }
    return name;
  }

  String getChar() {
    return String.fromCharCode(random.nextInt(26) + 97);
  }

  void deletePet(int petId) async {
    try {
      EasyLoading.show();
      await petRepository.removePet(petId);
      pets.removeWhere((pet) => pet.id == petId);
      Get.showSnackbar(const GetSnackBar(message: "Remove completely", duration: Duration(seconds: 1)));
      EasyLoading.dismiss();
    } catch (e) {
      handleException(e);
    }
  }
}
