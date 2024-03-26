import 'package:flutter/material.dart';
import 'package:flutter_message/domin/entities/message.dart';
import 'package:flutter_message/presentation/provider/chat_provider.dart';
import 'package:flutter_message/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter_message/presentation/widgets/chat/her_message_boubble.dart';
import 'package:flutter_message/presentation/widgets/chat/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class chatScreen extends StatelessWidget {
  const chatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://fotografias.larazon.es/clipping/cmsimages01/2021/05/24/C0DB319D-E183-4769-813F-4C22537BEC6B/97.jpg?crop=5472,3078,x0,y285&width=1600&height=900&optimize=low&format=webply'),
            ),
          ),
          title: Text('mi amor'),
          centerTitle: true,
        ),
        body: _chatView(),
    );
  } 
}

class _chatView extends StatelessWidget {
  const _chatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final chatProvider=context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                //
                final messaget=chatProvider.messageList[index];
              

                return(messaget.fromwho == FromWho.hers)
                  ? herMessageBubble(messageher: messaget)
                  : myMessageBubble(message: messaget);
             
            })),
            MessageFieldBox(
              onValue:(value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}


  