import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  List _Photos = [];
  List get photos => _Photos;

  void toggleFavorite(photos) {
    final isExist = _Photos.contains(photos);
    if (isExist) {
      _Photos.remove(photos);
    } else {
      _Photos.add(photos);
    }
    notifyListeners();
  }

  bool isExist(photos) {
    final isExist = _Photos.contains(photos);
    return isExist;
  }

  void clearFavorite() {
    _Photos = [];
    notifyListeners();
  }

  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of(
      context,
      listen: listen,
    );
  }
}
// class CartProvider extends ChangeNotifier {
//   List _Photos = [];
//   List get photos => _Photos;
//
//   void toggleCart(photos) {
//     final isExists = _Photos.contains(photos);
//     if (isExists) {
//       _Photos.remove(photos);
//     } else {
//       _Photos.add(photos);
//     }
//     notifyListeners();
//   }
//
//   bool isExists(photos) {
//     final isExists = _Photos.contains(photos);
//     return isExists;
//   }
//
//   void clearFavorite() {
//     _Photos = [];
//     notifyListeners();
//   }
//
//   static CartProvider of(
//       BuildContext context, {
//         bool listen = true,
//       }) {
//     return Provider.of(
//       context,
//       listen: listen,
//     );
//   }
// }
