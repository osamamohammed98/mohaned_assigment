import 'package:flutter/material.dart';

class SwitchBtn extends StatefulWidget {
  const SwitchBtn({Key? key}) : super(key: key);

  @override
  _SwitchBtnState createState() => _SwitchBtnState();
}

class _SwitchBtnState extends State<SwitchBtn> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return  Switch(value: value, onChanged: (val){
      setState(() {
        value = val;
      });
    });
  }
}
