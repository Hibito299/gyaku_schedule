import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gyaku schedule',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => const LoginPage(),
        '/home': (BuildContext context) => const HomePage(),
        '/check': (BuildContext context) => const CheckTask(),
        '/add': (BuildContext context) => const AddTask(),
        '/manage': (BuildContext context) => const ManagePage(),
        '/user': (BuildContext context) => const UserPage(),
      },
    );
  }
}

//ログイン画面
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('逆算スケジュール'),
            ElevatedButton(
                onPressed: () async {
                  await Navigator.of(context).pushReplacementNamed('/home');
                },
                child: const Text('ログイン'))
          ],
        ),
      ),
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

//タスク確認画面
class CheckTask extends StatelessWidget {
  const CheckTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: Center(),
    );
  }
}

//タスク作成画面
class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク作成'),
      ),
      body: Center(),
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
        ListView.builder(itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('$index'),
            ),
          );
        }),
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

//ユーザー画面
class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザー画面'),
      ),
      body: Container(),
    );
  }
}
