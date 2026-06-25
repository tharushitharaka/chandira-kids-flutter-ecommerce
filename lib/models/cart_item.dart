import 'product.dart';

/// Model representing an item in the shopping cart
/// Contains product reference and quantity information
class CartItem {
  final Product product;
  int quantity;
  String? selectedSize;
  String? selectedColor;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.selectedSize,
    this.selectedColor,
  });

  /// Calculate total price for this cart item
  double get totalPrice => product.price * quantity;

  /// Create a copy of this cart item with updated properties
  CartItem copyWith({
    Product? product,
    int? quantity,
    String? selectedSize,
    String? selectedColor,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }

  /// Convert CartItem to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
      'selectedSize': selectedSize,
      'selectedColor': selectedColor,
    };
  }

  /// Create CartItem from JSON
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      selectedSize: json['selectedSize'] as String?,
      selectedColor: json['selectedColor'] as String?,
    );
  }
}
