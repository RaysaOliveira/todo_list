import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('TODO List '),
              Icon(
                Icons.task,
                size: 30,
              )
            ],
          )),
      body: Container(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          //resolve o problema do RenderFlex Overflowed By # Pixels on The Bottom
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
              ),
              Container(
                  height: 400,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.check_box, color: Colors.lightGreenAccent,),
                        title: Text(tasks[index]),
                        textColor: Colors.black,
                        onLongPress: (){
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.lightGreen,
            child: Icon(Icons.add),
            onPressed: () {
              if (_textEditingController.text.length > 0) {
                setState(() {
                  tasks.add(_textEditingController.text);
                });
                _textEditingController.clear();
              }
            },
          ),
          FloatingActionButton(
            backgroundColor: Colors.redAccent,
            child: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                tasks = [];
              });
              _textEditingController.clear();
            },
          ),
        ],
      ),
    );
  }
}
