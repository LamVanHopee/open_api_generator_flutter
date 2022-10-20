import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openapi/openapi.dart';

class PetItem extends StatelessWidget {
  const PetItem({Key? key, required this.pet, this.onDelete}) : super(key: key);

  final Pet pet;
  final void Function(int petId)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey.withOpacity(0.1),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pet.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Text('Status:'),
                    Text('${pet.status?.name}',
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              if (pet.id != null) {
                onDelete?.call(pet.id!);
              } else {
                Get.showSnackbar(const GetSnackBar(message: "Can't remove this pet!", duration: Duration(seconds: 1)));
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.delete_forever, color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
