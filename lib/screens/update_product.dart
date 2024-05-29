import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({
    super.key,
  });
  static String id = 'updatePage';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? title, price, image, desc;
  bool? isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading!,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              CustomTextfield(
                hintText: 'Product Name ',
                onChanged: (p0) {
                  title = p0;
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextfield(
                hintText: 'price',
                textInputType: TextInputType.number,
                onChanged: (p0) {
                  price = p0;
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextfield(
                hintText: 'desc',
                onChanged: (p0) {
                  desc = p0;
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextfield(
                hintText: 'image  ',
                onChanged: (p0) {
                  image = p0;
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Update',
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  try {
                    await updateProduct(product);
                  } catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProduct().updateProduct(
        title: title == null ? product.title : title!,
        price: price == null ? product.price : price!,
        desc: desc == null ? product.descreption : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
