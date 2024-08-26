class Product {
  final String name;
  final String imagePath;
  final String price;

  Product({
    required this.name,
    required this.imagePath,
    required this.price,
  });
}

class Invoice {
  final String invoiceNumber;
  final String amount;
  final List<Product> products;

  Invoice({
    required this.invoiceNumber,
    required this.amount,
    required this.products,
  });
}
