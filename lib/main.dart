import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject6_2/bindings/binding.dart';
import 'package:myproject6_2/routes/routes.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const ToDoList());
}

class ToDoList extends StatelessWidget{
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      getPages: Routes.pages,
      initialBinding: ToDoBinding(),
      initialRoute: '/homeScreen',
    );
  }

  static void changeColor (Color color, Brightness brightness){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: color, statusBarIconBrightness: brightness));
  }

}
