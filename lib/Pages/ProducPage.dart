import 'package:flutter/material.dart';
import 'package:store/Services.dart';

class ProductPage extends StatefulWidget {
  ProductPage(
      {super.key,
      required this.index,
      required this.image,
      required this.title,
      required this.category,
      required this.id,
      required this.price});
  final int index;
  final String image;
  final String title;
  final String category;
  final int id;
  final dynamic price;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var uprice;

  String? udesc;

  String? utilte;

  String? uimage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "${widget.title.substring(0, 15)}",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ComwithHero(index: widget.index, image: widget.image),
              SizedBox(
                height: 20,
              ),
              PListTile(
                  id: widget.id,
                  title: widget.title,
                  category: widget.category,
                  price: widget.price),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (data) {
                  utilte = data;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  hintText: "utitle",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (data) {
                  uprice = data;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  hintText: "uprice",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (data) {
                  udesc = data;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  hintText: "udesc",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.inversePrimary,
                )),
                child: Text("UpData"),
                onPressed: () async {
                await UpdataProduct().UpdateProduct(
                    id: widget.id,
                    tilte: utilte!,
                    price: uprice,
                    desc: udesc!,
                    image: widget.image,
                    category: widget.category,
                  );
                  print("utilte${widget.title}utilte ${utilte}");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PListTile extends StatelessWidget {
  PListTile({
    super.key,
    required this.id,
    required this.title,
    required this.category,
    required this.price,
  });

  final int id;
  final String title;
  final String category;
  var price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: ListTile(
        style: ListTileStyle.drawer,
        tileColor: Theme.of(context).colorScheme.inversePrimary,
        leading: Text("id:$id"),
        subtitle: Text("title:$title"),
        title: Text("category:$category"),
        trailing: Text("price:$price"),
      ),
    );
  }
}

class ComwithHero extends StatelessWidget {
  const ComwithHero({
    super.key,
    required this.index,
    required this.image,
  });

  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "$index",
      child: Image.network(
        "$image",
        height: 200,
        width: MediaQuery.sizeOf(context).width,
      ),
    );
  }
}
