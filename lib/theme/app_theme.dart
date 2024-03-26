import 'package:flutter/material.dart';

  const   Color _customColor=Color.fromARGB(255, 93, 23, 205);

  //lista de colores 
  const List<Color>_colorThemes=[
    _customColor,
    Colors.blue,
    Colors.black,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.teal
  ]; 

class AppTheme{
  final int selectedcolor;

  AppTheme({
     this.selectedcolor=0
    }):assert(selectedcolor>=0 && selectedcolor<_colorThemes.length-1 ,
    'colors must be between 0 and >${_colorThemes.length}');

   
  
  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      /**para colocar el tema   */
      colorSchemeSeed: _colorThemes[1],
      //brightness: Brightness.dark
    );
    
  }
}