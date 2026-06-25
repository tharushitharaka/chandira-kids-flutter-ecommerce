import '../models/product.dart';

/// Mock product data for Chandira Kids girls clothing store
/// Contains 8 products across 4 categories: Party Wear, Casual, Birthday, Summer
class ProductsData {
  static List<Product> getMockProducts() {
    return [
      // Party Wear
      Product(
        id: 'p1',
        name: 'Pink Princess Gown',
        description: 'Elegant pink princess gown with sequin details and tulle skirt. Perfect for special occasions and parties.',
        price: 45.99,
        imageUrl: 'assets/images/pink_princess_gown.jpg',
        category: 'Party Wear',
        sizes: ['4T', '5T', '6', '7', '8'],
        colors: ['Pink', 'White', 'Lavender'],
        rating: 4.8,
        reviewCount: 124,
        inStock: true,
      ),
      Product(
        id: 'p2',
        name: 'Glitter Party Dress',
        description: 'Stunning glitter party dress with sleeveless design and comfortable lining. Your little princess will shine!',
        price: 38.50,
        imageUrl: 'assets/images/glitter_party_dress.jpg',
        category: 'Party Wear',
        sizes: ['4T', '5T', '6', '7'],
        colors: ['Gold', 'Silver', 'Rose Gold'],
        rating: 4.6,
        reviewCount: 89,
        inStock: true,
      ),
      
      // Casual
      Product(
        id: 'p3',
        name: 'Floral Summer Dress',
        description: 'Lightweight floral print dress perfect for everyday wear. Soft cotton blend for maximum comfort.',
        price: 24.99,
        imageUrl: 'assets/images/floral_summer_dress.jpg',
        category: 'Casual',
        sizes: ['4T', '5T', '6', '7', '8', '10'],
        colors: ['Multi', 'Blue', 'Yellow'],
        rating: 4.5,
        reviewCount: 156,
        inStock: true,
      ),
      Product(
        id: 'p4',
        name: 'Denim Overall Dress',
        description: 'Classic denim overall dress with adjustable straps. Versatile piece that can be styled in multiple ways.',
        price: 32.00,
        imageUrl: 'assets/images/denim_overall_dress.jpg',
        category: 'Casual',
        sizes: ['4T', '5T', '6', '7', '8'],
        colors: ['Blue Denim', 'Light Wash'],
        rating: 4.7,
        reviewCount: 203,
        inStock: true,
      ),
      
      // Birthday
      Product(
        id: 'p5',
        name: 'Birthday Tutu Dress',
        description: 'Adorable tutu dress with "Birthday Girl" embellishment. Layers of tulle create a magical look.',
        price: 42.99,
        imageUrl: 'assets/images/birthday_tutu_dress.jpg',
        category: 'Birthday',
        sizes: ['4T', '5T', '6', '7'],
        colors: ['Pink', 'Purple', 'Rainbow'],
        rating: 4.9,
        reviewCount: 178,
        inStock: true,
      ),
      Product(
        id: 'p6',
        name: 'Crown Princess Dress',
        description: 'Royal-inspired birthday dress with crown accent and shimmering fabric. Make her feel like royalty!',
        price: 55.00,
        imageUrl: 'assets/images/crown_princess_dress.jpg',
        category: 'Birthday',
        sizes: ['5T', '6', '7', '8'],
        colors: ['Royal Blue', 'Pink', 'White'],
        rating: 4.8,
        reviewCount: 95,
        inStock: true,
      ),
      
      // Summer
      Product(
        id: 'p7',
        name: 'Sundress with Hat',
        description: 'Complete summer outfit with matching sun hat. Lightweight fabric keeps her cool and protected.',
        price: 35.99,
        imageUrl: 'assets/images/sundress_with_hat.jpg',
        category: 'Summer',
        sizes: ['4T', '5T', '6', '7', '8'],
        colors: ['Yellow', 'Orange', 'Mint'],
        rating: 4.4,
        reviewCount: 112,
        inStock: true,
      ),
      Product(
        id: 'p8',
        name: 'Beach Cover-Up Dress',
        description: 'Quick-dry beach cover-up dress with playful patterns. Perfect for pool days and beach trips.',
        price: 28.50,
        imageUrl: 'assets/images/beach_coverup_dress.jpg',
        category: 'Summer',
        sizes: ['4T', '5T', '6', '7'],
        colors: ['Tropical', 'Stripes', 'Solid'],
        rating: 4.3,
        reviewCount: 67,
        inStock: true,
      ),
    ];
  }

  /// Get all available categories
  static List<String> getCategories() {
    return ['Party Wear', 'Casual', 'Birthday', 'Summer'];
  }

  /// Get products by category
  static List<Product> getProductsByCategory(String category) {
    return getMockProducts()
        .where((product) => product.category == category)
        .toList();
  }

  /// Search products by name
  static List<Product> searchProducts(String query) {
    final lowerQuery = query.toLowerCase();
    return getMockProducts()
        .where((product) =>
            product.name.toLowerCase().contains(lowerQuery) ||
            product.description.toLowerCase().contains(lowerQuery))
        .toList();
  }

  /// Get product by ID
  static Product? getProductById(String id) {
    try {
      return getMockProducts().firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }
}
