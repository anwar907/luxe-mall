class Cart {
  int id;
  int userId;
  String date;
  List<Products> products;
  int iV;

  Cart({this.id, this.userId, this.date, this.products, this.iV});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    date = json['date'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['date'] = this.date;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Products {
  int productId;
  int quantity;

  Products({this.productId, this.quantity});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    return data;
  }
}

class ListCart {
  List<Cart> cartList;
  ListCart({this.cartList});

  factory ListCart.fromJson(List<dynamic> json) {
    return ListCart(
        cartList: json
            ?.map((e) =>
                e == null ? null : Cart.fromJson(e as Map<String, dynamic>))
            ?.toList());
  }
}
