import 'package:flutter/material.dart';
import 'package:novel_reader/screens/discover_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NovelReaderHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NovelReaderHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NovelReaderHomePageState();
  }
}

class _NovelReaderHomePageState extends State<NovelReaderHomePage> {

  var selectedIndex = 0;

   List<Widget> pages = [
    DiscoverScreen(),
    Text("Thể loại"),
    Text("Tìm kiếm"),
    Text("Lịch sử"),
    Text("Cá nhân")
  ];

  _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: const Text("Truyện Full", style: TextStyle(color: Colors.black),),
      // ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add),label: "Khám phá"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Thể loại",),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Tìm kiếm"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Lịch sử"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Cá nhân")
        ],
      ),
    );
  }

}