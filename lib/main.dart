import 'package:flutter/material.dart';
import 'package:gyaku_schedule/TaskPage/checktask.dart';
import 'package:gyaku_schedule/TaskPage/addtask.dart';
import 'package:gyaku_schedule/UserPage/user.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gyaku schedule',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const HomePage(),
        '/check': (BuildContext context) => const CheckTask(),
        '/add': (BuildContext context) => const AddTask(),
        '/manage': (BuildContext context) => const ManagePage(),
        '/user': (BuildContext context) => const UserPage(),
      },
    );
  }
}

//ホーム画面
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;

  var _pages = <Widget>[
    CheckTask(),
    ManagePage(),
    UserPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'タスク一覧',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'ユーザー',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

//タスク管理画面
class ManagePage extends StatelessWidget {
  const ManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク一覧'),
      ),
      body: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
              onPressed: () async {
                await Navigator.of(context).pushNamed('/add');
              },
              child: const Text('スケジュール追加')),
        )
      ]),
    );
  }
}
