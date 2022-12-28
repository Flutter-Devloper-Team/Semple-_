import 'package:flutter/material.dart';

import 'Like_provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {




  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final photos = provider.photos;

    return Scaffold(
      appBar: AppBar(
        title: Text("Like Page"),
      ),
      body: GridView.builder(
        itemCount: photos.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          final photo = photos[index];
          return GridTile(
            child: Container(
              // color: Colors.black,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(photo), fit: BoxFit.cover),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {
                    provider.toggleFavorite(photo);
                  },
                  icon: provider.isExist(photo)
                      ? Icon(
                          Icons.favorite,
                          size: 30,
                          color: Colors.red,
                        )
                      : Icon(Icons.favorite_border, size: 30),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
