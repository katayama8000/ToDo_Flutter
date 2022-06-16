import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

enum RadioValue { FIRST, SECOND, THIRD }

class _DashboardState extends State<Dashboard> {
  RadioValue _gValue = RadioValue.FIRST;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 216, 225),
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: const Color.fromARGB(255, 251, 70, 130),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            RadioListTile(
              title: Text('選択肢 1'),
              value: RadioValue.FIRST,
              groupValue: _gValue,
              onChanged: (value) => _onRadioSelected(value),
            ),
            RadioListTile(
              title: Text('選択肢 2'),
              value: RadioValue.SECOND,
              groupValue: _gValue,
              onChanged: (value) => _onRadioSelected(value),
            ),
            RadioListTile(
              title: Text('選択肢 3'),
              value: RadioValue.THIRD,
              groupValue: _gValue,
              onChanged: (value) => _onRadioSelected(value),
            ),
          ],
        ),
      ),
    );
  }

  _onRadioSelected(value) {
    setState(() {
      _gValue = value;
    });
  }
}
