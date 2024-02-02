import 'package:flutter/material.dart';

class ToggleVisibility{
  Widget visibility(bool isNotVisible){
    if(isNotVisible){
      return const Icon(Icons.visibility);
    }
    else{
      return const Icon(Icons.visibility_off);
    }
  }
}