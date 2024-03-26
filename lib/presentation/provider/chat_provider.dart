import 'package:flutter/material.dart';
import 'package:flutter_message/config/helpers/yes_no_answer.dart';
import 'package:flutter_message/domin/entities/message.dart';


class ChatProvider extends  ChangeNotifier{

  final GetYesNoAnswer getyesnoAnswer=GetYesNoAnswer();
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList=[
    Message(text:"hola amor! ", fromwho: FromWho.mine),
    Message(text:"ya regresaste del trabajo ? ", fromwho: FromWho.mine),
  ];
  Future<void> sendMessage(String text ) async{
    if(text.isEmpty)return;
  final newMessage = Message(text: text, fromwho: FromWho.mine);
  messageList.add(newMessage);  

  if(text.endsWith('?')){
    herReply();
  }

  notifyListeners();
  moveScrollBottm();
  }
  Future<void> herReply() async{
    final herMessage=await getyesnoAnswer.getAnswer();
    messageList.add(herMessage);
    
    notifyListeners();
    moveScrollBottm();
  }
  
  void moveScrollBottm(){
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
      );
  }
}