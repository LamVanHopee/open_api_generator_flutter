import 'package:get/instance_manager.dart';
import 'package:openapi/openapi.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Openapi>(() => Openapi());
  }

}