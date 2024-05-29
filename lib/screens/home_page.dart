import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.cartShopping,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
          future: GetAllProductsService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> product = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 100),
                child: GridView.builder(
                  itemCount: product.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 80),
                  itemBuilder: (context, index) {
                    return CardWidget(
                      product: product[index],
                    );
                  },
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
            ;
          }),
    );
  }
}
