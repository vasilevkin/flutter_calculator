import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(title: 'Flutter Demo Home Page'),
    );
  }
}

class Calculator extends StatefulWidget {
  Calculator({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _textColors {
  static const Color light = Color(0xFFFFFFFF);
  static const Color dark = Color(0x55000000);
}

class _backgroundColors {
  static const Color lightGrey = Color(0xFFDBDBDB);
  static const Color darkGrey = Color(0xFF606060);
  static const Color orange = Color(0xFFFFA100);
}

class _CalculatorState extends State<Calculator> {
  String text = '0';
  String result = '';

  void _calculate(buttonText) {
    if (buttonText == 'C' || buttonText == '=') {
      result = '0';
    } else {
      result = text + buttonText;
    }

    setState(() {
      text = result;
    });
  }

  Widget roundButton(buttonText, Color textColor, Color backgroundColor) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: RaisedButton(
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30,
            color: textColor,
          ),
        ),
        color: backgroundColor,
        onPressed: () {
          _calculate(buttonText);
        },
        padding: EdgeInsets.all(22.0),
        shape: CircleBorder(),
      ),
    );
  }

  Widget roundButtonDoubleWidth(
      buttonText, Color textColor, Color backgroundColor) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: RaisedButton(
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30,
            color: textColor,
          ),
        ),
        color: backgroundColor,
        onPressed: () {
          _calculate(buttonText);
        },
        padding: EdgeInsets.only(left: 81, top: 22, right: 81, bottom: 22),
        shape: StadiumBorder(),
      ),
    );
  }

  Widget spaceEvenlyRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                    ),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            spaceEvenlyRow(
              <Widget>[
                roundButton('C', _textColors.dark, _backgroundColors.lightGrey),
                roundButton('+/-', _textColors.dark, _backgroundColors.lightGrey),
                roundButton('%', _textColors.dark, _backgroundColors.lightGrey),
                roundButton('/', _textColors.light, _backgroundColors.orange),
              ],
            ),
            spaceEvenlyRow(
              <Widget>[
                roundButton('7', _textColors.light, _backgroundColors.darkGrey),
                roundButton('8', _textColors.light, _backgroundColors.darkGrey),
                roundButton('9', _textColors.light, _backgroundColors.darkGrey),
                roundButton('x', _textColors.light, _backgroundColors.orange),
              ],
            ),
            spaceEvenlyRow(
              <Widget>[
                roundButton('4', _textColors.light, _backgroundColors.darkGrey),
                roundButton('5', _textColors.light, _backgroundColors.darkGrey),
                roundButton('6', _textColors.light, _backgroundColors.darkGrey),
                roundButton('-', _textColors.light, _backgroundColors.orange),
              ],
            ),
            spaceEvenlyRow(
              <Widget>[
                roundButton('1', _textColors.light, _backgroundColors.darkGrey),
                roundButton('2', _textColors.light, _backgroundColors.darkGrey),
                roundButton('3', _textColors.light, _backgroundColors.darkGrey),
                roundButton('+', _textColors.light, _backgroundColors.orange),
              ],
            ),
            spaceEvenlyRow(
              <Widget>[
                roundButtonDoubleWidth(
                    '0', _textColors.light, _backgroundColors.darkGrey),
                roundButton(',', _textColors.light, _backgroundColors.darkGrey),
                roundButton('=', _textColors.light, _backgroundColors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
