import 'package:get/get.dart';
import 'package:myproject6_2/controllers/task_controller.dart';
import 'package:myproject6_2/controllers/textfield_controller.dart';

class ToDoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
    Get.put(TextFieldController());
  }
}