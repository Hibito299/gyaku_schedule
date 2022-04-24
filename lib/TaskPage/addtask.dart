import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

//タスク作成画面
class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('タスク作成'),
        ),
        body: Stack(children: <Widget>[
          TextField(
            style: const TextStyle(
              fontSize: 30,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(50),
              hintText: '大目標を決めよう',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: const Text('目標を設定する'),
                onPressed: () {},
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(250, 50)),
              ),
            ),
          )
        ]));
  }
}
