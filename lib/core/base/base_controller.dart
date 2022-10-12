import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    init();
    fetchData();
  }

  /// Initialize the values of variables
  void init() {}

  /// fetch initialization data
  /// Maybe call functions to get data in API, Database,...
  void fetchData() {}

  /// Display error dialog based on each [e]
  /// [e] dynamic object
  /// Only handle [e] if it is an Exception
  void handleException(dynamic e, {VoidCallback? onTap}) {
    String title = "Error";
    String message = "Message";

    EasyLoading.dismiss();

    if (e is Error) {
      e.printError();
    }

    if (e is Exception) {
      if (e is DioError) {
        if (e.response?.statusMessage != null) {
          message = e.response!.statusMessage!;
        }
      }
    }

    if (Get.isDialogOpen == true) {
      return;
    }
    Get.dialog(
      CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: Text('ok'.tr),
            onPressed: () {
              Get.back();
              onTap?.call();
            },
          ),
        ],
      ),
    );
  }
}
