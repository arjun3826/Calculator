import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;

  final DisplayOneController = TextEditingController();
  final DisplayTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    DisplayOneController.text = x.toString();
    DisplayTwoController.text = y.toString();
  }

  void _onShow() => print("OnShow Called");
  void _onHide() => print("OnHide Called");
  void _onResume() => print("OnResume Called");
  void _onDetach() => print("OnDetach Called");
  void _onInactive() => print("OnInactive Called");
  void _onPause() => print("OnPause Called");
  void _onRestart() => print("OnRestart Called");
  void _onStateChange(AppLifecycleState state) => print("OnStatechange Called");

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          //calculator
          DisplayOne(
            hint: "Enter First Number",
            controller: DisplayOneController,
          ),
          SizedBox(
            height: 30,
          ),
          DisplayOne(
            hint: "Enter First Number",
            controller: DisplayTwoController,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            z.toString(),
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ),
          Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! +
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! -
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! *
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! /
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                DisplayOneController.clear();
                DisplayTwoController.clear();
              });
            },
            label: Text("Clear"),
          ),
        ],
      ),
    );
  }
}

class DisplayOne extends StatelessWidget {
  const DisplayOne(
      {super.key, this.hint = "Enter a Number", required this.controller});
  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3.0),
            borderRadius: BorderRadius.circular(10)),
        labelText: "0",
        hintText: hint,
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
