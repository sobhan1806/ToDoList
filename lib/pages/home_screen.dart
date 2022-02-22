import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject6_2/constant.dart';
import 'package:myproject6_2/controllers/task_controller.dart';
import 'package:myproject6_2/controllers/textfield_controller.dart';
import '../main.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToDoList.changeColor(tDarkColor, Brightness.dark);
    return Scaffold(
      backgroundColor: tDarkColor,
      floatingActionButton: buildFloatingActionButton(),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            topSectionWidget(),
            bottomSectionWidget(),
          ]),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      heroTag: appTexts('hero'),
      onPressed: (){
        Get.find<TaskController>().isEditing = false;
        Get.find<TextFieldController>().taskTitle!.text = '';
        Get.find<TextFieldController>().taskSubTitle!.text = '';
        Get.toNamed('/addTaskScreen')!.then((value) {
          ToDoList.changeColor(tDarkColor, Brightness.dark);
        }
        );
      },
      elevation: 0,
      backgroundColor: tDarkColor,
      child: const Icon(Icons.add),
    );
  }

  Container topSectionWidget() {
    return Container(
      width: Get.width,
      color: tDarkColor,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 40, top: 20),
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: tWhiteColor,
                child: Center(
                  child: Icon(Icons.event_note, color: tDarkColor),
                ),
              ),
            ),// CircleAvatar
            Container(
              margin: const EdgeInsets.only(left: 50, top: 20),
              child: Text(appTexts('all'), style: TextStyle(color: tWhiteColor, fontSize: fontSizeTitle, fontWeight: Bold)),
            ),// All(text)
            Container(
              margin: const EdgeInsets.only(left: 50, top: 20),
              child: Obx((){
                return Text('${Get.find<TaskController>().tasks.length} Tasks', style: TextStyle(color: tWhiteColor, fontSize: fontSizeSubtitle, fontWeight: Normal));
              }
              ),
            ),// Tasks(text)
          ]),
    );
  }

  Container bottomSectionWidget() {
    return Container(
      width: Get.width,
      height: Get.height * homeScreenHeight,
      decoration: BoxDecoration(
              color: tWhiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(homeScreenRadius),
                topRight: Radius.circular(homeScreenRadius),
              ),
            ),
      child: Container(
        margin: const EdgeInsets.only(right: 10, left: 50, top: 20),
        child: Obx((){
          return ListView.separated(
            itemCount: Get.find<TaskController>().tasks.length,
            separatorBuilder: (BuildContext context, int index){
              return Divider(color: tDividerColor, height: dividerHeight);
            },
            itemBuilder: (context, index){
              var task = Get.find<TaskController>().tasks[index];
              return ListTile(
                onLongPress: (){
                  Get.find<TaskController>().tasks.removeAt(index);
                },
                title: Text(task.taskTitle ?? ''),
                subtitle: Text(task.taskSubTitle ?? ''),
                onTap: (){
                  Get.find<TaskController>().isEditing = true;
                  Get.find<TaskController>().index = index;
                  Get.find<TextFieldController>().taskTitle!.text = task.taskTitle!;
                  Get.find<TextFieldController>().taskSubTitle!.text = task.taskSubTitle!;
                  Get.toNamed('/addTaskScreen');
                },
                trailing: Checkbox(
                  activeColor: tDarkColor,
                  onChanged: (value) {
                    task.status = !task.status!;
                    Get.find<TaskController>().tasks[index] = task;
                  },
                  value: task.status,
                  side: BorderSide(color: tBlack87Color, width: checkBoxWidth),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(checkBoxRadius),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }

}