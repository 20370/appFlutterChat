import 'package:flutter/material.dart';
import 'package:flutter_message/domin/entities/message.dart';

class myMessageBubble extends StatelessWidget {
  //aca mando a llamar mi clase entidad 
  final Message message;

 //constructor 
  const myMessageBubble({
    super.key,
    required this.message});
  

  @override
  Widget build(BuildContext context) {
     
    final colors=Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [Container(
        decoration: BoxDecoration(
          color: colors.primary ,
          borderRadius: BorderRadius.circular(20)
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Text(
            message.text,
            style: const TextStyle(color: Colors.white),),
        ),
      ),
      const SizedBox( height: 10)
      ],
    );
  }
}