import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String>  onValue;
  
  const MessageFieldBox({
    super.key,
    required this.onValue
    });

  @override
  Widget build(BuildContext context) { 
    final colors=Theme.of(context).colorScheme;
    //para obtener el valor del controlador 
    final textcontoller=TextEditingController();
    final FocusNode focusnode=FocusNode();

    //guarda el valor del diseño    
    final outlineInputBorder=UnderlineInputBorder(
      borderSide: BorderSide(color:Colors.transparent),
      borderRadius: BorderRadius.circular(40)
     );

    final inputDecoration =InputDecoration(
      hintText: "enter your message?",
        enabledBorder:outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(onPressed: (){
            final textvalue=textcontoller.value.text;
            onValue(textvalue);
        }, icon: Icon(Icons.send_outlined))
      );
    //caja de texto 
    return TextFormField(
      onTapOutside: (Event){
        focusnode.unfocus();
      },
      focusNode: focusnode,
      controller: textcontoller,
      decoration: inputDecoration,
      onFieldSubmitted:(value) {
        
        onValue(value);
      
        textcontoller.clear(); 
        // el foco se mantendra activo en este elemeno 
        focusnode.requestFocus();

      },
      
    );
  }
}