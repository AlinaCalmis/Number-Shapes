import 'package:flutter/material.dart';
import 'package:powers/powers.dart';

void main() {
  runApp(
      MaterialApp(
        home: NumberShapes(),
      )
  );
}

class NumberShapes extends StatefulWidget {
  const NumberShapes({Key key}) : super(key: key);

  @override
  _NumberShapesState createState() => _NumberShapesState();
}

class _NumberShapesState extends State<NumberShapes> {
  TextEditingController _controller = new TextEditingController();
  int _readNumber = 0;

  // generates Dialog Alert pop up window
  void getAlert(BuildContext context, String text) {
    if (_controller.text.isNotEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text("$_readNumber"),
                content: Text("Number $_readNumber $text"),
              );
          }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center (
        child: Text("Number Shapes"),
        )
      ),
      body: Column(
        children: <Widget>[
          new Text("Please input a number to see if it is square or triangular",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20), textAlign: TextAlign.center),
          new Padding (
            padding: EdgeInsets.all(10),
              child: TextField(
              controller: _controller,
              keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {

              _readNumber = int.tryParse(_controller.text);

              if (_readNumber != null) {
                if (_readNumber.isSquare) {
                  getAlert(context, " is SQUARE");
                } else if (_readNumber.isCube) {
                  getAlert(context, " is TRIANGULAR");
                } else {
                  getAlert(context, " is neither TRIANGULAR nor SQUARE");
                }
              }
            });
          },
          child: const Icon(Icons.check)
      ),
    );
  }
}
