import 'package:dio/dio.dart';
import 'package:flutter_message/domin/entities/message.dart';
import 'package:flutter_message/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer{

  final _dio =Dio();
 
  Future<Message> getAnswer()async{
    
    final response =await _dio.get('https://yesno.wtf/api');
    final yesnomodel=YesNoModel.fromJsonMap(response.data);
    
    
   return Message(
    text: yesnomodel.answer, 
    fromwho: FromWho.hers,
    imageUrl: yesnomodel.image
    );
  }

}