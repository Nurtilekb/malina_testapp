import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.image = '',
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartService extends ChangeNotifier {
  late List<Product> _products;
  final List<Product> _favorites = [];
  final List<CartItem> _cart = [];

  // Список товаров (можно расширить)
  List<Product> get products => _products;

  // Избранное
  List<Product> get favorites => _favorites;

  // Корзина
  List<CartItem> get cart => _cart;

  CartService() {
    _initProducts();
  }

  void _initProducts() {
    _products = List.generate(
      10,
      (index) => Product(
        id: 'product_$index',
        name: 'Товар ${index + 1}',
        price: (index + 1) * 150.0,
        image: '',
      ),
    );
  }

  // Добавить/удалить из избранного
  void toggleFavorite(String productId) {
    final product = _products.firstWhere((p) => p.id == productId);
    final index = _favorites.indexWhere((p) => p.id == productId);

    if (index == -1) {
      _favorites.add(product);
    } else {
      _favorites.removeAt(index);
    }
    notifyListeners();
  }

  // Проверить, в избранном ли товар
  bool isFavorite(String productId) {
    return _favorites.any((p) => p.id == productId);
  }

  // Добавить в корзину
  void addToCart(String productId) {
    final product = _products.firstWhere((p) => p.id == productId);
    final index = _cart.indexWhere((item) => item.product.id == productId);

    if (index == -1) {
      _cart.add(CartItem(product: product, quantity: 1));
    } else {
      _cart[index].quantity++;
    }
    notifyListeners();
  }

  // Удалить из корзины
  void removeFromCart(String productId) {
    final index = _cart.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      _cart.removeAt(index);
      notifyListeners();
    }
  }

  // Изменить количество в корзине
  void updateQuantity(String productId, int quantity) {
    final index = _cart.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      if (quantity <= 0) {
        _cart.removeAt(index);
      } else {
        _cart[index].quantity = quantity;
      }
      notifyListeners();
    }
  }

  // Получить количество товаров в корзине
  int get cartItemCount {
    return _cart.fold(0, (sum, item) => sum + item.quantity);
  }

  // Получить общую сумму
  double get totalPrice {
    return _cart.fold(
      0,
      (sum, item) => sum + item.product.price * item.quantity,
    );
  }

  // Очистить корзину
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
