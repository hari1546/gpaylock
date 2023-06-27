import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Google Pay",
      home: GooglePayLockScreen(),
    );
  }
}

class GooglePayLockScreen extends StatefulWidget {
  const GooglePayLockScreen({Key? key}) : super(key: key);

  @override
  State<GooglePayLockScreen> createState() => _GooglePayLockScreenState();
}

class _GooglePayLockScreenState extends State<GooglePayLockScreen> {
  String logo = "images/gpay.png";
  String title = "Enter your PIN";
  String email = "harishmakaliyaperumal@gmail.com";

  List<int> firstRow = [1, 2, 3], secRow = [4, 5, 6], thirdRow = [7, 8, 9];
  int pinLength = 4;
  String PinEntered = "";
  String workingPin = "2424";

  numberClicked(int item) {
    PinEntered = PinEntered + item.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: kToolbarHeight + 100,
          ),
          Image.asset(
            logo,
            height: 70,
            width: 70,
          ),
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          Text(email),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon((PinEntered.length >= 1)
                      ? Icons.circle
                      : Icons.circle_outlined),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon((PinEntered.length >= 2)
                      ? Icons.circle
                      : Icons.circle_outlined),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon((PinEntered.length >= 3)
                      ? Icons.circle
                      : Icons.circle_outlined),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon((PinEntered.length >= 4)
                      ? Icons.circle
                      : Icons.circle_outlined),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: firstRow.map((e) => numberButton(e)).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: secRow.map((e) => numberButton(e)).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: thirdRow.map((e) => numberButton(e)).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(18.0),
              //   child: Container(),
              // ),
              Opacity(opacity: 0, child: numberButton(0)),
              numberButton(0),
              IconButton(onPressed: () {}, icon: Icon(Icons.backspace_outlined))
            ],
          )
        ],
      ),
    );
  }

  Widget numberButton(int item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: InkWell(
        onTap: () => numberClicked(item),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            item.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
