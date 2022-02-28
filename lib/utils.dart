import 'package:aciste/constants.dart';
import 'package:flutter/material.dart';

Color getRankColor(int rank) {
  switch (rank) {
    case 1:
      return AppColor.gold;
    case 2:
      return AppColor.silver;
    case 3:
      return AppColor.blond;
  }
  return Colors.transparent;
}

String numWithSuffix(int number) {
  if (11 <= number && number <= 13) {
    return '${number}th';
  }

  switch (number % 10) {
    case 1: return '${number}st';
    case 2: return '${number}nd';
    case 3: return '${number}rd';
    default: return '${number}th';
  }
}