import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Favorite/Like_provider.dart';
import 'Home_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteProvider>(
            create: (_) => FavoriteProvider()),
        // ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
