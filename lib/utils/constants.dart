import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var getContext = Get.context!;
var maxWidth = MediaQuery.of(Get.context!).size.width;
var maxHeight = MediaQuery.of(Get.context!).size.height;
// firestore users instance
var userRef = FirebaseFirestore.instance.collection('users');
// pet collection instance
var petRef = FirebaseFirestore.instance.collection('pets');
// firebase storage instance
var storageRef = FirebaseStorage.instance;
const myDomain = '@boholvet.bh';
