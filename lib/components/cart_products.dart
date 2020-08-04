import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
      "size": "M",
      "color": "red",
      "quantity": 1
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
      "size": "7",
      "color": "red",
      "quantity": 1
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Products_on_the_cart.length,
      itemBuilder: (context, index) {
        return Single_cart_product(
          cart_prod_name: Products_on_the_cart[index]["name"],
          cart_prod_color: Products_on_the_cart[index]["color"],
          cart_prod_qty: Products_on_the_cart[index]["quantity"],
          cart_prod_size: Products_on_the_cart[index]["size"],
          cart_prod_price: Products_on_the_cart[index]["price"],
          cart_prod_pricture: Products_on_the_cart[index]["picture"],
        );
      },
    );
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_pricture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_pricture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_color,
    this.cart_prod_qty,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
//        ===== LEADING SECTION =====
        leading: Image.asset(
          cart_prod_pricture,
          width: 80.0,
          height: 80.0,
        ),
        title: Text(cart_prod_name),
        subtitle: Column(
          children: <Widget>[
//            ROW INSIDE THE COLUMN
            Row(
              children: <Widget>[
//                this section is for the size of the product
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text("Size"),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    cart_prod_size,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
//            ===== This section for the product color =====
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0,),
              child: Text("Color:"),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                cart_prod_color,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
//            ===== THIS SECTION IS FOR THE PRODUCT PRICE =====
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                '\$${cart_prod_price.toString()}',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
        trailing: Column(
          children: <Widget>[
            Expanded(
              child: IconButton(
                icon: Icon(Icons.arrow_drop_up),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: Text(
                cart_prod_qty.toString(),
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
