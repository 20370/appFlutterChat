import 'package:flutter/material.dart';
import 'package:flutter_message/presentation/provider/chat_provider.dart';
import 'package:flutter_message/presentation/screens/chat/chat_screen.dart';
import 'package:flutter_message/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //es util porque nos llama al provider que especificamos si en dado caso tenemos mas de un provider 
    return MultiProvider(
        providers:[
        ChangeNotifierProvider (create: (_) => ChatProvider(),)
      ],
      child: MaterialApp(
        title: 'Yes no app ',
        debugShowCheckedModeBanner: false,  
        theme:AppTheme( selectedcolor: 2).theme() ,
        home: chatScreen()
      ),
    );
  }
}