class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final String emoji;
  final int stock;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.emoji,
    required this.stock,
  });
}

final List<Product> dummyProducts = [
  Product(
    id: '001',
    name: 'Wireless Headphones',
    category: 'Electronics',
    price: 299.99,
    emoji: '🎧',
    stock: 12,
  ),
  Product(
    id: '002',
    name: 'Mechanical Keyboard',
    category: 'Electronics',
    price: 189.00,
    emoji: '⌨️',
    stock: 7,
  ),
  Product(
    id: '003',
    name: 'Leather Sneakers',
    category: 'Fashion',
    price: 124.50,
    emoji: '👟',
    stock: 34,
  ),
  Product(
    id: '004',
    name: 'Smart Watch Pro',
    category: 'Electronics',
    price: 449.00,
    emoji: '⌚',
    stock: 5,
  ),
  Product(
    id: '005',
    name: 'Linen Tote Bag',
    category: 'Fashion',
    price: 59.99,
    emoji: '👜',
    stock: 20,
  ),
  Product(
    id: '006',
    name: 'Cold Brew Flask',
    category: 'Lifestyle',
    price: 45.00,
    emoji: '🫙',
    stock: 48,
  ),
  Product(
    id: '007',
    name: 'Yoga Mat Premium',
    category: 'Sport',
    price: 89.00,
    emoji: '🧘',
    stock: 15,
  ),
];

final List<Map<String, dynamic>> transactionHistory = [
  {
    'title': 'Netflix Subscription',
    'subtitle': '15 Apr 2025 · Entertainment',
    'amount': '-Rp 54.000',
    'isDebit': true,
    'icon': '📺',
  },
  {
    'title': 'Salary Deposit',
    'subtitle': '1 Apr 2025 · Income',
    'amount': '+Rp 8.500.000',
    'isDebit': false,
    'icon': '💰',
  },
  {
    'title': 'Grocery - Indomaret',
    'subtitle': '28 Mar 2025 · Shopping',
    'amount': '-Rp 127.500',
    'isDebit': true,
    'icon': '🛒',
  },
  {
    'title': 'Transfer from Budi',
    'subtitle': '25 Mar 2025 · Transfer',
    'amount': '+Rp 300.000',
    'isDebit': false,
    'icon': '📲',
  },
  {
    'title': 'Tokopedia Order',
    'subtitle': '20 Mar 2025 · Shopping',
    'amount': '-Rp 450.000',
    'isDebit': true,
    'icon': '📦',
  },
  {
    'title': 'Freelance Payment',
    'subtitle': '15 Mar 2025 · Income',
    'amount': '+Rp 2.000.000',
    'isDebit': false,
    'icon': '💻',
  },
];