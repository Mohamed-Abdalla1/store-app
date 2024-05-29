import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product.dart';

class CardWidget extends StatelessWidget {
  CardWidget({super.key, required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 25,
                  spreadRadius: 0,
                  offset: Offset(10, 10)),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, UpdatePage.id ,arguments: product);
            },
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 7),
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${product.price}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(
                          Icons.favorite,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 40,
          top: -50,
          child: Image.network(
            product.image,
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }
}
