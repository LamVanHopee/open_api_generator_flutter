import 'package:get/get.dart';
import 'package:open_api_generator_flutter/views/screens/pet/pet_binding.dart';
import 'package:open_api_generator_flutter/views/screens/pet/pet_screen.dart';

class DeliveryRoutes {
  static const String petList = '/petList';
}

class DeliveryPages {
  static final pages = [
    GetPage(
      name: DeliveryRoutes.petList,
      page: () => const PetScreen(),
      binding: PetBinding(),
    ),
  ];
}