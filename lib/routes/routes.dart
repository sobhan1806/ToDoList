import 'package:get/get.dart';
import 'package:myproject6_2/pages/add_task_screen.dart';
import 'package:myproject6_2/pages/home_screen.dart';

class Routes{
  static List<GetPage> get pages => [
    GetPage(name: '/homeScreen', page: ()=> const HomeScreen()),
    GetPage(name: '/addTaskScreen', page: ()=> const AddTaskScreen()),
  ];
}