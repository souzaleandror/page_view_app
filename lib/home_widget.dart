import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      print("mudeou a pagina ${controller.page.round()}");
    });

    List<Widget> pages = [
      Center(
        child: Text("Page 1"),
      ),
      Center(
        child: Text("Page 2"),
      ),
      Center(
        child: Text("Page 3"),
      ),
    ];

    List<String> papos = [
      "batata",
      "cenoira",
      "manjericacao",
      "batata",
      "cenoira",
      "manjericacao",
      "batata",
      "cenoira",
      "manjericacao",
      "batata",
      "cenoira",
      "manjericacao",
      "batata",
      "cenoira",
      "manjericacao",
      "batata",
      "cenoira",
      "manjericacao",
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("PageView"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              controller.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOutBack);
            },
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              controller.jumpToPage(0);
            },
          ),
          IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            onPressed: () {
              controller.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOutBack);
            },
          ),
        ],
      ),
      body: PageView.builder(
          controller: controller,
          itemCount: papos.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(child: Text(papos[index]));
          }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {
            print(index);

            controller.animateToPage(index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOutBack);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                title: Text("Teste 1"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text("Teste 2"), icon: Icon(Icons.keyboard_arrow_down)),
            BottomNavigationBarItem(
                title: Text("Teste 3"), icon: Icon(Icons.keyboard_arrow_right)),
          ]),
    );
  }
}

//class _HomeWidgetState extends State<HomeWidget> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        centerTitle: true,
//        title: Text("PageView"),
//      ),
//      body: PageView(
//        onPageChanged: (pageInt) {
//          print(pageInt);
//        },
//        scrollDirection: Axis.vertical,
//        physics: ClampingScrollPhysics(),
//        children: <Widget>[
//          Center(
//            child: Text("Page 1"),
//          ),
//          Center(
//            child: Text("Page 2"),
//          ),
//          Center(
//            child: Text("Page 3"),
//          )
//        ],
//      ),
//    );
//  }
//}
