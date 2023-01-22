import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "SolaimanLipi"),
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        body: SafeArea(child: MyStatefulWidget()),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Paper Less',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'আপনার অ্যাকাউন্টে প্রবেশ করুন',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: mobileController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '১১ সংখ্যার মোবাইল নাম্বার লিখুন',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: pinController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '৮ সংখ্যা পিন লিখুন',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'পাসওয়ার্ড ভুলে গেছেন?',
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('লগইন'),
                  onPressed: () {
                    print(mobileController.text);
                    print(pinController.text);
                  },
                )),
          ],
        ));
  }
}
