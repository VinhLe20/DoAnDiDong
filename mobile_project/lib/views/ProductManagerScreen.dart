import 'package:flutter/material.dart';
import 'package:mobile_project/models/product.dart';
import 'package:mobile_project/views/AddProductsPage.dart';
import 'package:mobile_project/views/ProductEditPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductMangerScreen extends StatefulWidget {
  ProductMangerScreen({super.key, required this.nameShop});
  String nameShop;
  @override
  State<ProductMangerScreen> createState() => _ProductMangerScreenState();
}

class _ProductMangerScreenState extends State<ProductMangerScreen> {
  List<String> ten = List.empty(growable: true);
  List<String> soluong = List.empty(growable: true);
  List<String> gia = List.empty(growable: true);
  List<Product> products = List.filled(
      0,
      Product(
          TenSP: "",
          GiaSP: "",
          Tenshop: "",
          MoTa: "",
          SoLuong: "",
          Giamgia: "",
          Sdt: "",
          Trangthai: true,
          Image: "",
          loai: ""),
      growable: true);
  List<Product> productslocal = List.filled(
      0,
      Product(
          TenSP: "",
          GiaSP: "",
          Tenshop: "",
          MoTa: "",
          SoLuong: "",
          Giamgia: "",
          Sdt: "",
          Trangthai: true,
          Image: "",
          loai: ""),
      growable: true);
  @override
  void initState() {
    super.initState();
    Product.products.clear();
    _loadData(widget.nameShop);
    loadUser();
  }

  void _loadData(String shop) {
    Product.getData(shop).then((value) {
      setState(() {
        products = Product.products;
      });
    });
    saveUser();
  }

  void loadUser() {
    local();
  }

  void local() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    ten = prefs.getStringList("NameProduct") ?? List.empty(growable: true);
    gia = prefs.getStringList("GiaProduct") ?? List.empty(growable: true);
    soluong =
        prefs.getStringList("SoLuongProduct") ?? List.empty(growable: true);
    for (int i = 0; i < ten.length; i++) {
      productslocal[i].TenSP = ten[i];
      productslocal[i].SoLuong = soluong[i];
      productslocal[i].GiaSP = gia[i];
    }
  }

  void saveUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tensp = List.empty(growable: true);
    List<String> soluongsp = List.empty(growable: true);
    List<String> giasp = List.empty(growable: true);
    for (int i = 0; i < products.length; i++) {
      tensp.add(products[i].TenSP);
      giasp.add(products[i].GiaSP);
      soluongsp.add(products[i].SoLuong);
    }
    prefs.setStringList("NameProduct", tensp);
    prefs.setStringList("GiaProduct", giasp);
    prefs.setStringList("SoLuongProduct", soluongsp);
  }

  Item(Product pro) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.network(pro.Image, fit: BoxFit.cover),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tên sản phẩm: ${pro.TenSP}"),
                const SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 140,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Số lượng: ${pro.SoLuong}"),
                      // Text("da ban"),
                      IconButton(
                        onPressed: () async {
                          final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductEditPage(
                                      product: pro, nameShop: widget.nameShop)));
                          if (result) {
                            setState(() {
                              Product.products.clear();
                              _loadData(widget.nameShop);
                            });
                          }
                        },
                        icon: const Icon(Icons.edit),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (productslocal.isNotEmpty) {
      setState(() {
        products = productslocal;
        print("${productslocal[0]}");
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: const Text("Quản lý sản phẩm"),
      ),
      floatingActionButton: IconButton(
        icon: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 226, 13, 13),
        ),
        onPressed: () async {
          final result = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddProductsPage(nameShop: widget.nameShop)));
          if (result) {
            setState(() {
              Product.products.clear();
              _loadData(widget.nameShop);
            });
          }
        },
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Item(products[index]);
        },
      ),
    );
  }
}
