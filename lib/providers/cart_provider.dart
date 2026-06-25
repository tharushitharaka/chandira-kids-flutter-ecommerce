import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

/// Cart Provider using ChangeNotifier for state management
/// Manages shopping cart operations including adding, removing, 
/// and updating quantities of products
class CartProvider with ChangeNotifier {
  // Private list to store cart items
  final List<CartItem> _items = [];

  /// Get all items in the cart
  List<CartItem> get items => List.unmodifiable(_items);

  /// Get total number of items in the cart
  int get totalItems {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  /// Get total price of all items in the cart
  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  /// Check if a product is already in the cart
  bool isProductInCart(String productId) {
    return _items.any((item) => item.product.id == productId);
  }

  /// Get the quantity of a specific product in the cart
  int getProductQuantity(String productId) {
    final item = _items.cast<CartItem?>().firstWhere(
      (item) => item?.product.id == productId,
      orElse: () => null,
    );
    return item?.quantity ?? 0;
  }

  /// Add a product to the cart
  /// If product already exists, increases quantity by 1
  /// [product] - The product to add
  /// [quantity] - Initial quantity (default: 1)
  /// [selectedSize] - Optional selected size for the product
  /// [selectedColor] - Optional selected color for the product
  void addToCart(
    Product product, {
    int quantity = 1,
    String? selectedSize,
    String? selectedColor,
  }) {
    final existingItemIndex = _items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex != -1) {
      // Product already exists, update quantity
      _items[existingItemIndex] = _items[existingItemIndex].copyWith(
        quantity: _items[existingItemIndex].quantity + quantity,
        selectedSize: selectedSize ?? _items[existingItemIndex].selectedSize,
        selectedColor: selectedColor ?? _items[existingItemIndex].selectedColor,
      );
    } else {
      // Add new item to cart
      _items.add(CartItem(
        product: product,
        quantity: quantity,
        selectedSize: selectedSize,
        selectedColor: selectedColor,
      ));
    }

    notifyListeners();
  }

  /// Remove a product from the cart
  /// [productId] - The ID of the product to remove
  void removeFromCart(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  /// Increase quantity of a product in the cart
  /// [productId] - The ID of the product
  void increaseQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + 1,
      );
      notifyListeners();
    }
  }

  /// Decrease quantity of a product in the cart
  /// If quantity reaches 0, removes the item from cart
  /// [productId] - The ID of the product
  void decreaseQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      if (_items[index].quantity > 1) {
        _items[index] = _items[index].copyWith(
          quantity: _items[index].quantity - 1,
        );
      } else {
        // Remove item if quantity would become 0
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  /// Update quantity of a product to a specific value
  /// [productId] - The ID of the product
  /// [quantity] - The new quantity (must be >= 1)
  void updateQuantity(String productId, int quantity) {
    if (quantity < 1) return;

    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      _items[index] = _items[index].copyWith(quantity: quantity);
      notifyListeners();
    }
  }

  /// Clear all items from the cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  /// Get cart item by product ID
  CartItem? getCartItem(String productId) {
    try {
      return _items.firstWhere((item) => item.product.id == productId);
    } catch (e) {
      return null;
    }
  }

  /// Update selected size for a cart item
  /// [productId] - The ID of the product
  /// [size] - The new selected size
  void updateSelectedSize(String productId, String size) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      _items[index] = _items[index].copyWith(selectedSize: size);
      notifyListeners();
    }
  }

  /// Update selected color for a cart item
  /// [productId] - The ID of the product
  /// [color] - The new selected color
  void updateSelectedColor(String productId, String color) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      _items[index] = _items[index].copyWith(selectedColor: color);
      notifyListeners();
    }
  }

  /// Get the number of unique products in cart
  int get uniqueItemsCount => _items.length;

  /// Check if cart is empty
  bool get isEmpty => _items.isEmpty;

  /// Check if cart has items
  bool get isNotEmpty => _items.isNotEmpty;
}
