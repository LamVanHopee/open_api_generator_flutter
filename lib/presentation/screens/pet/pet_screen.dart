import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:open_api_generator_flutter/presentation/screens/pet/components/pet_item.dart';
import 'package:open_api_generator_flutter/presentation/screens/pet/pet_controller.dart';

class PetScreen extends GetView<PetController> {
  const PetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.addPet,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // Thi
      body: SafeArea(child: Obx(() => getPetList())),
    );
  }

  Widget getPetList() {
    var pets = controller.pets;
    if (pets.isEmpty) {
      return const Center(child: Text('Not pet here'));
    }
    return ListView.separated(
      itemBuilder: (context, index) {
        return PetItem(pet: pets[index], onDelete: controller.deletePet);
      },
      itemCount: pets.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 4.0);
      },
    );
  }
}
