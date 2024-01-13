import 'package:flutter/material.dart';
import 'package:mobile_project/models/product.dart';
import 'package:mobile_project/views/CartScreen.dart';
import 'package:mobile_project/views/OrderPage.dart';

class DetailProduct extends StatefulWidget {
  DetailProduct({super.key, required this.pro});
  Product pro;
  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: MaterialButton(
              color: Colors.blueGrey,
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                height: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.chat),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text('Chat'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                height: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_basket),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text('Thêm giỏ hàng'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: MaterialButton(
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderPage(product: widget.pro),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 70,
                child: const Text('Mua ngay'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                      'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lmip5nw70l3ze5',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        top: 8.0,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.blueAccent,
                            size: 24.0,
                          ),
                        )),
                  ],
                ),
                const SizedBox(height: 16.0),
                Text(
                  "${widget.pro.TenSP}",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "${widget.pro.GiaSP}",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          '5',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [Text('Đã bán 2,5k')],
                    )
                  ],
                ),
                //   Text(widget.pro.)
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                    decoration: BoxDecoration(color: Colors.grey),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mô tả sản phẩm',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0)),
                          Text(
                              """Áo hoodie thỏ in kín Not Rabbit form rộng tay bồng mẫu hot 2023 HARIQUEEN\nChất liệu: Nỉ cotto\nKích cỡ: Sản phẩm nam nữ Unisex Freesize từ 40-65kg\nCó thể giăt tay hoặc giặt máy theo ý muốn mà không lo ảnh hưởng đến chất lượng sản phẩm.""")
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                const Text('Đánh giá sản phẩm:',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                Container(
                  height: 300,
                  width: 500,
                  decoration: BoxDecoration(color: Colors.grey),
                  child: const SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 2.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://cdn.sforum.vn/sforum/wp-content/uploads/2023/11/avatar-dep-85.jpg'),
                                        radius: 24.0,
                                      ),
                                      SizedBox(
                                        width: 3.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'NguyenDinhAnh',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(Icons.star,
                                                  color: Colors.amber),
                                              SizedBox(width: 4.0),
                                              Text(
                                                '5',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Áo đẹp rộng vừa phù hợp mọi lứa tuổi',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('05-01-2024')
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 2.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://cdn.sforum.vn/sforum/wp-content/uploads/2023/11/avatar-dep-85.jpg'),
                                        radius: 24.0,
                                      ),
                                      SizedBox(
                                        width: 3.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'VinhLe',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(Icons.star,
                                                  color: Colors.amber),
                                              SizedBox(width: 4.0),
                                              Text(
                                                '2',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Áo đẹp không đẹp như quảng cáo',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('02-01-2024')
                                ],
                              ),
                            ),
                          ),
                          Card()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
