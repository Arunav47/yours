import 'package:flutter/material.dart';

class ToggleVisibility{
  Widget visibility(bool isNotVisible){
    if(isNotVisible){
      return const Icon(Icons.visibility, color: Colors.white70,);
    }
    else{
      return const Icon(Icons.visibility_off, color: Colors.white70,);
    }
  }
}