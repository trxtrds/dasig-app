import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/firebase_auth/auth_util.dart';

int convertStringToInt(String? someString) {
  int tries;

  if (someString == null) {
    return 0;
  }

  try {
    tries = int.parse(someString);
  } catch (err) {
    return 0;
  }

  return tries;
}

int? totalScore(
  int? questionOne,
  int? questionTwo,
  int? questionThree,
  int? questionFour,
  int? questionFive,
) {
  // get the sum of values of questionOne to questionFive
  if (questionOne == null ||
      questionTwo == null ||
      questionThree == null ||
      questionFour == null ||
      questionFive == null) {
    return null;
  }

  return (questionOne +
      questionTwo +
      questionThree +
      questionFour +
      questionFive);
}

bool? admin(AdminRecord? isAdmin) {
  // if a isAdmin is admin return admin
  if (isAdmin == null) {
    return null;
  } else {
    return true;
  }
}

bool? isDoneEntry(
  DateTime? entryDate,
  int? actionNum,
) {
  // limit the action number to one and reset it to zero if date is changed
  if (entryDate == null || actionNum == null) {
    return null;
  }

  if (actionNum == 1) {
    return true;
  } else {
    return false;
  }
}

String? postiveResultReco(
  MoodTrackerRecord? totalScore,
  RecommendationRecord? positiveReco,
) {
  // if score is greater than or equal to 13 print positiveReco
  if (totalScore?.totalScore != null && totalScore!.totalScore! >= 13) {
    return positiveReco?.positive;
  } else {
    return null;
  }
}
