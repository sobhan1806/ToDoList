import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myproject6_2/constant.dart';
import 'package:myproject6_2/controllers/task_controller.dart';
import 'package:myproject6_2/controllers/textfield_controller.dart';
import 'package:myproject6_2/models/task_model.dart';
import '../main.dart';

class AddTaskScreen extends StatelessWidget{
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToDoList.changeColor(tDarkColor, Brightness.dark);
    return Scaffold(
      backgroundColor: tWhiteColor,
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBarWidget(),
              titleWidget(),
              titleTextFieldWidget(),
              subTitleTextFieldWidget(),
              addButton(),
            ]),
      ),
    );
  }

  Container addButton() {
    return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: Get.width,
              height: buttonHeight,
              child: ElevatedButton(
                style: TextButton.styleFrom(elevation: 0, backgroundColor: tDarkColor),
                onPressed: (){
                  if(Get.find<TaskController>().isEditing){
                    //Edit Task
                    var task = Get.find<TaskController>().tasks[Get.find<TaskController>().index];
                    task.taskTitle = Get.find<TextFieldController>().taskTitle!.text;
                    task.taskSubTitle = Get.find<TextFieldController>().taskSubTitle!.text;
                    Get.find<TaskController>().tasks[Get.find<TaskController>().index] = task;
                  }
                  else{
                    //Add Task
                    Get.find<TaskController>().tasks.add(
                      TaskModel(
                        taskTitle: Get.find<TextFieldController>().taskTitle!.text,
                        taskSubTitle: Get.find<TextFieldController>().taskSubTitle!.text,
                        status: true,
                      ),
                    );
                  }
                  Get.back();
                },
                child: Text(Get.find<TaskController>().isEditing ? appTexts('edit') : appTexts('add')),
              ),
            );
  }

  Container titleTextFieldWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: Get.find<TextFieldController>().taskTitle,
        maxLines: maxLine,
        cursorColor: tDarkColor,
        cursorHeight: cursorHeight,
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: tGreyColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: tGreyColor),
          ),
        ),
      ),
    );
  }

  Container subTitleTextFieldWidget() {
    return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: TextField(
                controller: Get.find<TextFieldController>().taskSubTitle,
                maxLength: maxLength,
                cursorColor: tDarkColor,
                decoration: InputDecoration(
                  prefix: Icon(Icons.add_circle_outline_rounded, size: iconSize, color: tGreyColor),
                  border: InputBorder.none,
                  counter: Container(),
                  hintText: appTexts('addnote'),
                ),
              ),
            );
  }

  Container appBarWidget() {
    return Container(
      width: Get.width,
      color: tWhiteColor,
      child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: Text(
                      Get.find<TaskController>().isEditing ? appTexts('edittask') : appTexts('newtask'),
                      textAlign: TextAlign.center, style: TextStyle(fontSize: fontSizeTitle),
                    ),
                  ),
                ),
                Hero(
                  tag: appTexts('hero'),
                  child: Material(
                    child: IconButton(
                        onPressed: (){
                          Get.back();
                        },
                        icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ]),
          ]),
    );
  }

  Container titleWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10),
      child: Text(appTexts('what...'), style: TextStyle(color: tGreyColor, fontSize: fontSizeText),),
    );
  }

}