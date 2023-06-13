import 'dart:io';

import 'package:flutter/material.dart';

class chatModel {
  List<String> fullName;
  List<String> phoneNumber;
  List<String> chatConversation;
  List<String> image;

  File? img;
  DateTime? tempDate;
  DateTime? pickDate;
  TimeOfDay? tempTime;
  TimeOfDay? pickTime;

  List<String> date;
  List<String> time;

  chatModel({
    required this.image,
    required this.fullName,
    required this.phoneNumber,
    required this.chatConversation,

    this.img,
    this.tempDate,
    this.pickDate,
    this.tempTime,
    this.pickTime,

    required this.date,
    required this.time,
  });
}
