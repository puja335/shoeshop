import 'package:flutter/material.dart';
import 'package:myshoesapp/widgets/custom_bottom_appbar.dart';
import 'package:myshoesapp/widgets/custom_floating_action_button.dart';
import 'package:myshoesapp/widgets/upper_container.dart';
import 'package:myshoesapp/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:myshoesapp/providers/counter_provider.dart';
import '../widgets/middle_list_view.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
// import '../widgets/grid_view_shoes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color myOrange = Color.fromRGBO(242, 102, 62, 1);
  Color myBrown = Color.fromARGB(255, 240, 239, 239);
  int _currentIndex = 0;

  // get FloatingActionButton => myCustomFloatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBrown,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 5.0),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                    ),
                    iconSize: 30,
                    onPressed: () {}),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: myOrange,
                      maxRadius: 10,
                    ),
                    Text("${context.watch<Counter>().cartCounter}"),
                  ],
                ),
              ],
            ),
          )
        ],
        title: Text("Shoes Shop", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageSlideshow(
                  indicatorColor: Colors.transparent,

                  // indicatorBackgroundColor: Colors.white,
                  height: 200,
                  width: 380,
                  autoPlayInterval: 4000,
                  indicatorBackgroundColor: Colors.transparent,
                  // indicatorRadius: 4,

                  isLoop: true,
                  children: [
                    Container(
                        // flex: 1,
                        child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, int index) {
                        // index++;
                        return UpperContainer(giveIndex: _currentIndex);
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 20,
                        );
                      },
                    )),
                  ]),

              // UpperContainer(),
              const MiddleListView(),
              // GridViewShoes(),
            ],
          ),
        ),
      ),
      floatingActionButton: myCustomFloatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      bottomNavigationBar: myCustomBottomAppBar(context),
      drawer: MyDrawer(),
    );
  }
}

