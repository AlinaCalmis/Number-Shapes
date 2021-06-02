import 'package:flutter/material.dart';
import 'package:powers/powers.dart';

void main() {
  runApp(const MaterialApp(
    home: NumberShapes(),
  ));
}

class NumberShapes extends StatefulWidget {
  const NumberShapes({Key? key}) : super(key: key);

  @override
  _NumberShapesState createState() => _NumberShapesState();
}

class _NumberShapesState extends State<NumberShapes> {
  final TextEditingController _controller = TextEditingController();
  final TextInputType _textInputType = TextInputType.number;
  int _readNumber = 0;

  // generates Dialog Alert pop up window
  void getAlert(BuildContext context, String text) {
    if (_controller.text.isNotEmpty) {
      showDialog<Widget>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('$_readNumber'),
              content: Text('Number $_readNumber $text'),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('Number Shapes'),
      )),
      body: Column(
        children: <Widget>[
          const Text('Please input a number to see if it is square or triangular',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20), textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _controller,
              keyboardType: _textInputType,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _readNumber = int.tryParse(_controller.text)!;

              if (_readNumber != null) {
                if (_readNumber.isSquare) {
                  getAlert(context, ' is SQUARE');
                } else if (_readNumber.isCube) {
                  getAlert(context, ' is TRIANGULAR');
                } else {
                  getAlert(context, ' is neither TRIANGULAR nor SQUARE');
                }
              }
            });
          },
          child: const Icon(Icons.check)),
    );
  }
}
