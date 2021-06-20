import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";

  Widget btn(var textt) {
    return new Expanded(
      child: new ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24.0), primary: Colors.blueGrey),
        child: new Text(
          textt,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          setState(() {
            result = result + textt;
          });
        },
      ),
    );
  }

  Widget funBtn(var textt) {
    return new Expanded(
      child: new ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24.0), primary: Colors.lightBlueAccent),
        child: new Text(
          textt,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          setState(() {
            result = result + textt;
          });
        },
      ),
    );
  }

  Widget clr(var textt) {
    return new Expanded(
      child: new ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24.0), primary: Colors.redAccent),
        child: new Text(
          textt,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          setState(() {
            result = "";
          });
        },
      ),
    );
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  Widget sol(var textt) {
    return new Expanded(
      child: new ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24.0), primary: Colors.amber),
        child: new Text(
          textt,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: output,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          new Container(
              alignment: Alignment.centerRight,
              padding:
                  new EdgeInsets.symmetric(vertical: 14.0, horizontal: 4.0),
              child: new Text(result,
                  style: new TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ))),
          new Container(
              alignment: Alignment.centerRight,
              padding:
                  new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: new Text(result,
                  style: new TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ))),
          new Expanded(
            child: new Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [clr("Clear"), funBtn("("), funBtn(")"), funBtn("/")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [btn("7"), btn("8"), btn("9"), funBtn("*")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [btn("4"), btn("5"), btn("6"), funBtn("-")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [btn("1"), btn("2"), btn("3"), funBtn("+")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [btn("."), btn("0"), btn("00"), sol("=")],
          ),
        ],
      ),
    );
  }
}
