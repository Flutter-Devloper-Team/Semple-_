import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like/Favorite/Like_Page.dart';
import 'package:like/save.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

import 'Favorite/Like_provider.dart';

List Photos = [
  "https://avatars.mds.yandex.net/i?id=84dbd50839c3d640ebfc0de20994c30d-4473719-images-taas-consumers&n=27&h=480&w=480",
  "https://cdn.searchenginejournal.com/wp-content/uploads/2022/06/image-search-1600-x-840-px-62c6dc4ff1eee-sej-1520x800.png",
  "https://hotpot.ai/images/site/ai/art_maker/teaser.jpg",
  "https://www.howtogeek.com/wp-content/uploads/2022/09/Lexica.jpg?height=200p&trim=2,2,2,2&crop=16:9",
  "https://learnopencv.com/wp-content/uploads/2021/04/image-15.png",
  "https://www.w3schools.com/howto/img_forest.jpg",
  "https://images.ctfassets.net/23aumh6u8s0i/4JKsesGb6RuQLsjVnUmB0j/0bcbb36344547e9ab698b9077f80170a/16_brightness",
  "https://www.ionos.ca/digitalguide/fileadmin/DigitalGuide/Teaser/picture-gallery-t.jpg",
  "https://thumbs.dreamstime.com/b/conceptual-image-family-love-togetherness-safety-top-view-four-placing-hands-one-other-178302995.jpg",
  "https://i0.wp.com/www.flutterbeads.com/wp-content/uploads/2021/11/set-background-image-flutter-hero.jpeg?fit=720%2C480&ssl=1",
  "https://content.jdmagicbox.com/comp/def_content/home-theatre-system-dealers/home-theatre-system-dealers2-home-theatre-system-dealers-2-k7kxm.jpg?clr=662c00",
  "https://jssors8.azureedge.net/demos/image-slider/img/faded-monaco-scenery-evening-dark-picjumbo-com-image.jpg",
  "https://gratisography.com/wp-content/uploads/2022/03/gratisography-10-free-stock-photo-800x525.jpg",
  "https://pbs.twimg.com/media/FPsXAFAVcAIJWf4?format=jpg&name=900x900",
  "https://devskiller.com/wp-content/uploads/2020/07/History-of-programming-languages.jpg",
  "https://i.pinimg.com/originals/e1/2d/9c/e12d9cb78b275fc5ec9ab6ef4c9b3379.jpg",
  "https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://stimg.cardekho.com/images/carexteriorimages/630x420/Mercedes-Benz/G-Class/7194/1638504451130/front-left-side-47.jpg?imwidth=420&impolicy=resize",
  "https://media.istockphoto.com/id/1337232523/photo/high-angle-view-of-a-lake-and-forest.jpg?b=1&s=170667a&w=0&k=20&c=MMQAIpDombUQd_8FV9os3jLzza26-oqaOhO3AgUSt9k=",
  "https://images.pexels.com/photos/1314550/pexels-photo-1314550.jpeg?cs=srgb&dl=pexels-katarzyna-modrzejewska-1314550.jpg&fm=jpg   ",
  "https://images.pexels.com/photos/10767905/pexels-photo-10767905.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
  "https://images.pexels.com/photos/7250029/pexels-photo-7250029.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
  "https://images.pexels.com/photos/9634287/pexels-photo-9634287.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
  "https://images.pexels.com/photos/5624397/pexels-photo-5624397.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
  "https://images.pexels.com/photos/13463984/pexels-photo-13463984.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
  "https://images.pexels.com/photos/7296696/pexels-photo-7296696.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
  "https://images.pexels.com/photos/14494421/pexels-photo-14494421.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TodoList list = TodoList();
  final LocalStorage storage = LocalStorage('todo_app');
  TextEditingController controller = TextEditingController();

  _addItem(String title) {
    setState(() {
      final item = TodoItem(title: title, done: false);
      list.items.add(item);
      _saveToStorage();
    });
  }

  _saveToStorage() {
    storage.setItem('todos', list.toJSONEncodable());
  }

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    // final providerCart = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: Photos.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            final photos = Photos[index];
            return GridTile(
              child: Container(
                // color: Colors.black,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(photos), fit: BoxFit.cover),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Consumer(
                    builder: (BuildContext context, value, Widget? child) {
                      return IconButton(
                        onPressed: () {
                          controller;
                          provider.toggleFavorite(photos);
                        },
                        icon: provider.isExist(photos)
                            ? Icon(
                                Icons.favorite,
                                size: 30,
                                color: Colors.red,
                              )
                            : Icon(
                              Icons.favorite_border,
                              size: 30,
                              color: Colors.red,
                            ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            child: Icon(Icons.screen_share_outlined),
            onPressed: () {
              final route = MaterialPageRoute(
                builder: (context) => StoragePage(),
              );
              Navigator.push(context, route);
            },
            tooltip: "Favorite",
          ),
          FloatingActionButton(
            heroTag: "btn1",
            child: Icon(Icons.favorite_border),
            onPressed: () {
              final route = MaterialPageRoute(
                builder: (context) => FavoritePage(),
              );
              Navigator.push(context, route);
            },
            tooltip: "Favorite",
          ),
        ],
      ),
    );
  }

  void _save() {
    _addItem(controller.value.text);
    // controller.clear();
  }
}

// class MyModel with ChangeNotifier {
//   int someValue = 0;
//   void doSomething() {
//     someValue++; //1
//     notifyListeners();
//     print(someValue);
//   }
// }
