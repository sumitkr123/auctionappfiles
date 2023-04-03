import 'package:get/get.dart';
import 'package:auctiondemo/src/repository/authentication_repository/authentication_repository.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationRepository(), permanent: true);
  }
}
