import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

final _textController = TextEditingController();

List<String> listButtons = [
  "C",
  "*",
  "/",
  "<-",
  "1",
  "2",
  "3",
  "+",
  "4",
  "5",
  "6",
  "-",
  "7",
  "8",
  "9",
  "*",
  "%",
  "0",
  ".",
  "="
];

class _CalculatorViewState extends State<CalculatorView> {
  final _numController = TextEditingController();
  int? first = 0, second = 0;
  int result = 0;
  String operator = '';

  void calculate() {
    switch (operator) {
      case '+':
        setState(() {
          result = first! + second!;
        });
        break;
      case '-':
        setState(() {
          result = first! - second!;
        });
        break;
      case '*':
        setState(() {
          result = first! * second!;
        });
        break;
      case '/':
        setState(() {
          result = first! | second!;
        });
        break;
    }
    _numController.text = result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _textController,
            textAlign: TextAlign.end,
            decoration: const InputDecoration(
              hintText: '0',
            ),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // Expanded(
          //   child: GridView.builder(
          //     //for many buttons builder is used and for less buttoons count is used
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 3,
          //     ),
          //     itemCount: 300,
          //     itemBuilder: (BuildContext context, int index) {
          //       return const Card(
          //         color: Colors.amber,
          //       );
          //     },
          //     padding: const EdgeInsets.all(8),
          //     crossAxisSpacing: 5,
          //     mainAxisSpacing: 5,
          //     crossAxisCount: 4,
          //     children: [
          //       for (int i = 0; i < listButtons.length; i++) ...{
          //         ElevatedButton(
          //           onPressed: () {
          //             if (checkIsNumber(listButtons[i])) {
          //               _textController.text =
          //                   '${_textController.text}${listButtons[i]}';
          //             } else if (checkOperation(listButtons[i])) {
          //               first = int.parse(_textController.text);
          //               operator = listButtons[i];
          //               _textController.text = "";
          //             } else if (listButtons[i] == "=") {
          //               second = int.parse(_textController.text);
          //               calculate();
          //             } else if (listButtons[i] == "c") {
          //               //reset
          //               first = 0;
          //               second = 0;
          //               _textController.text = "";
          //             } else if (listButtons[i] == "<-") {
          //               _textController.text = _textController.text
          //                   .substring(0, _textController.text.length - 1);
          //             }
          //           },
          //           child: Text(
          //             listButtons[i],
          //             style: const TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         )
          //       }
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  bool checkIsNumber(String value) {
    return int.tryParse(value) != null;
  }

  bool checkOperation(String value) {
    List<String> lstOperator = ["+", "-", "*", "/"];
    return lstOperator.contains(value);
  }
}
