import 'package:docker_api_sample/provider.dart';
import 'package:flutter/material.dart';

import 'item.dart';

void main() => runApp(
  Provider(
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _titleController = new TextEditingController();
  final _bodyController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context).bloc;

    return Scaffold(
      appBar: AppBar(
        title: Text('투두리스트'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
            ),
            TextField(
              controller: _bodyController,
            ),
            RaisedButton(
              child: Text('등록'),
              onPressed: () {
                // TODO 클릭시 타이틀과 내용을 스트림으로 던저줍니다.
                // 타이틀과 내용을 서버로 저장
                final item = Item(
                  title: _titleController.text, 
                  content: _bodyController.text
                );

                // item
                //   ..title = ""
                //   ..content = "";

                bloc.add(item);
                
              },
            )
          ],
        ),
      ),
    );
  }
  
}