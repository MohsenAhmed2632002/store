import 'package:flutter/material.dart';

import 'Models.dart';
import 'Pages/ProducPage.dart';

class AllProductPage extends StatelessWidget {
  const AllProductPage({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      clipBehavior: Clip.none,
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 100,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProductPage(
                    index: index,
                    image: products[index].image,
                    title: products[index].title,
                    category: products[index].category,
                    id: products[index].id,
                    price: products[index].price,
                  );
                },
              ),
            );
          },
          child: ComponntCard(products: products,index: index,),
        );
      },
    );
  }
}

class ComponntCard extends StatelessWidget {
  const ComponntCard({
    super.key,
    required this.products,
    required this.index,
  });

  final List<ProductModel> products;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 0,
                offset: Offset(
                  50,
                  20,
                ),
              ),
            ],
          ),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${products[index].title}",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${products[index].description.substring(0, 5)}",
                      ),
                      Text(
                        r"$" "${products[index].price}",
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 120,
          child: Hero(
            tag: "$index",
            child: Image.network(
              "${products[index].image}",
              height: 140,
              width: 140,
            ),
          ),
        ),
      ],
    );
  }
}
