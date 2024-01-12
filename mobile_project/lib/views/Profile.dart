import 'package:flutter/material.dart';
import 'package:mobile_project/views/HomeScreen.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _ten = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: BottomNavigator(),
      appBar: AppBar(
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tài khoản"),
            ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Hồ sơ của tôi",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                SizedBox(
                  width: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assect/h3.jpg"),
                    radius: 40,
                  ),
                ]),
                Text("Chỉnh sửa hình ảnh"),
              ]),
              SizedBox(
                height: 10,
              ),
              Divider(
                // thickness: 2,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _ten,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    filled: true,
                    labelText: "Tên Người dùng",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 0,
                            color: Colors.white,
                            style: BorderStyle.none)),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _ten,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    filled: true,
                    labelText: "Điện thoại",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 0,
                            color: Colors.white,
                            style: BorderStyle.none)),
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _ten,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    filled: true,
                    labelText: "Địa chỉ",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 0,
                            color: Colors.white,
                            style: BorderStyle.none)),
                    prefixIcon: const Icon(
                      Icons.home,
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              Divider(
                // thickness: 2,
                color: Colors.black,
              ),
              SizedBox(
                height: 170,
              ),
              Row(children: [
                SizedBox(
                  width: 280,
                ),
                ElevatedButton(
                  child: Text(
                    "Lưu",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            0.0), // Đặt độ cong của góc thành 0 để tạo nút vuông
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(90, 50)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                ),
              ])
            ]),
          ],
        ),
      ),
    );
  }
}
