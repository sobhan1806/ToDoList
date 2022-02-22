import 'package:flutter/material.dart';

const tBlack87Color = Colors.black87;
const tDividerColor = Colors.grey;
const tGreyColor = Colors.grey;
const tDarkColor = Color(0xFF323232);
const tWhiteColor = Colors.white;

double fontSizeTitle = 25;
double fontSizeSubtitle = 18;
double fontSizeText = 16;
double iconSize = 20;
double homeScreenHeight = 0.6;
double homeScreenRadius = 25;
double checkBoxRadius = 4;
double checkBoxWidth = 0.1;
double dividerHeight = 1;
double newTaskLeftSpace = 30;
int maxLine = 6;
int maxLength = 30;
double cursorHeight = 40;
double buttonHeight = 40;

FontWeight Normal = FontWeight.normal;
FontWeight Bold = FontWeight.bold;

appTexts(text){
  switch(text){
    case 'all':
      return 'All';

    case 'tasks':
      return 'Tasks';

    case 'hero':
      return 'hero';

    case 'add':
      return 'Add';

    case 'edit':
      return 'Edit';

    case 'title':
      return 'Title';

    case 'subtitle':
      return 'Subtitle';

    case 'newtask':
      return 'New Task';

    case 'addnote':
      return 'Add Note';

    case 'edittask':
      return 'Edit Task';

    case 'what...':
      return 'What are you planning?';
  }
}