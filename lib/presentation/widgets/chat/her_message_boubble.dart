import 'package:flutter/material.dart';
import 'package:flutter_message/domin/entities/message.dart';

class herMessageBubble extends StatelessWidget {
  final Message messageher;

  const herMessageBubble({
    super.key,
    required this.messageher
    });

  @override
  Widget build(BuildContext context) {
     
    final colors=Theme.of(context).colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Container(
        decoration: BoxDecoration(
          color: colors.secondary ,
          borderRadius: BorderRadius.circular(20)
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Text(messageher.text,style: TextStyle(color: Colors.white),),
        ),
      ),
      const SizedBox( height: 5 ),
  
       _imaeBubble(messageher.imageUrl!),
      ],
    );
  }
}

class _imaeBubble extends StatelessWidget {
  final String imageUrl;
  const _imaeBubble(this.imageUrl);
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    BorderRadius: BorderRadius.circular(30);
    return ClipRect(
      child: Image.network(
        imageUrl,
    width: size.width*0.7,
    height: 150,
    fit: BoxFit.cover   ,
    ),);
  }
}