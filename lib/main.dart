import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todofreezed/controller/add_controller.dart';
import 'package:todofreezed/controller/home_controller.dart';
import 'package:todofreezed/controller/update_tudo.dart';
import 'package:todofreezed/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AddTodo()),
        ChangeNotifierProvider(create: (context) => Updatetudo()),
        ChangeNotifierProvider(create: (context) => Homedata())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ItemListWidget(),
      ),
    );
  }
}
