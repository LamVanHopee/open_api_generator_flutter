import 'dart:math';
import 'package:built_collection/src/list.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:open_api_generator_flutter/core/base/base_controller.dart';
import 'package:open_api_generator_flutter/data/repository/pet_repository.dart';
import 'package:openapi/openapi.dart';

class PetController extends BaseController {
  var random = Random();
  final petRepository = Get.find<PetRepository>();
  var pets = <Pet>[].obs;

  void addPet() async {
    try {
      EasyLoading.show();
      var pet = await petRepository.addPet(Pet((builder) {
        builder.name = getPetName();
        builder.photoUrls = ListBuilder([]);
        builder.status = PetStatusEnum.available;
        builder.tags = ListBuilder([
          Tag((builderTag) {
            builderTag.id = 1;
            builderTag.name = "Sale";
          }),
          Tag((builderTag) {
            builderTag.id = 2;
            builderTag.name = "Sale";
          }),
        ]);
        builder.category = CategoryBuilder()
          ..name = 'Dog'
          ..id = 2;
      }));
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
      var pet = await petRepository.addPet(Pet((b) {
        b.name = getPetName();
        b.photoUrls = ListBuilder([]);
        b.status = PetStatusEnum.available;
      }));
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
