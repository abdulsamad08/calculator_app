import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String sum = "0", result = "0", value1 = "";
  double fontsizesum = 36, fontsizeres = 45;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Calculator'),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              sum,
              style: TextStyle(color: Colors.white, fontSize: fontsizesum),
            ),
            const SizedBox(height: 8),
            Text(
              result,
              style: TextStyle(color: Colors.white, fontSize: fontsizeres),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                roundBtn(
                  "AC",
                  const Color(0xffb1b1b1),
                ),
                roundBtn(
                  "+/-",
                  const Color(0xffb1b1b1),
                ),
                roundBtn(
                  "%",
                  const Color(0xffb1b1b1),
                ),
                roundBtn(
                  "÷",
                  const Color(0xffFF9500),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                roundBtn(
                  "7",
                  const Color(0xff505050),
                ),
                roundBtn(
                  "8",
                  const Color(0xff505050),
                ),
                roundBtn(
                  "9",
                  const Color(0xff505050),
                ),
                roundBtn(
                  "×",
                  const Color(0xffFF9500),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                roundBtn(
                  "4",
                  const Color(0xff505050),
                ),
                roundBtn(
                  "5",
                  const Color(0xff505050),
                ),
                roundBtn(
                  "6",
                  const Color(0xff505050),
                ),
                roundBtn(
                  "-",
                  const Color(0xffFF9500),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                roundBtn(
                  "1",
                  const Color(0xff505050),
                ),
                roundBtn(
                  "2",
                  const Color(0xff505050),
                ),
                roundBtn(
                  "3",
                  const Color(0xff505050),
                ),
                roundBtn(
                  "+",
                  const Color(0xffFF9500),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: roundBtn("0", const Color(0xff505050)),
                  ),
                  const SizedBox(width: 12),
                  roundBtn(
                    ".",
                    const Color(0xff505050),
                  ),
                  const SizedBox(width: 12),
                  roundBtn(
                    "=",
                    const Color(0xffFF9500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// Widget with operations
  roundBtn(
    String text,
    Color color,
  ) {
    return InkWell(
      onTap: () {
        if (text == "=") {
          try {
            value1 = sum;
            value1 = value1.replaceAll("×", "*");
            value1 = value1.replaceAll("÷", "/");
            Parser P = Parser();
            Expression value2 = P.parse(value1);
            ContextModel con = ContextModel();
            result = "${value2.evaluate(EvaluationType.REAL, con)}";
            fontsizeres = 45;
            fontsizesum = 35;
            setState(() {});
          } catch (error) {
            fontsizeres = 45;
            fontsizesum = 35;
            result = "Syntax Error";
            setState(() {});
          }
        } else if (text == "AC") {
          fontsizeres = 45;
          fontsizesum = 35;
          sum = "0";
          result = "0";
          setState(() {});
        } else if (text == "C") {
          fontsizeres = 35;
          fontsizesum = 45;
          if (sum.length == 1) {
            sum = "0";
            setState(() {});
          } else {
            sum = sum.substring(0, sum.length - 1);
            setState(() {});
          }
        } else {
          fontsizeres = 35;
          fontsizesum = 45;
          if (sum == "0") {
            sum = text;
            setState(() {});
          } else {
            sum += text;
            setState(() {});
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        alignment: Alignment.center,
        height: 40 * 2,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          color: color,
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 32),
        ),
      ),
    );
  }
}
