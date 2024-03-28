import 'package:flutter/material.dart';

import '../constant/color_constants.dart';

class RSCheckBox1 extends StatefulWidget {
  const RSCheckBox1(
      {Key? key,
      required this.checkBoxValue,
      required this.displayName,
      required this.onChangeEvent})
      : super(key: key);
  final bool checkBoxValue;
  final String displayName;
  final Function onChangeEvent;

  @override
  State<RSCheckBox1> createState() => _RSCheckBoxState1();
}

class _RSCheckBoxState1 extends State<RSCheckBox1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if (mounted) {
                setState(() {
                  widget.onChangeEvent(!widget.checkBoxValue);
                });
              }
            },
            child: Icon(
              widget.checkBoxValue
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              size: 20,
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(widget.displayName),
          ),
        ],
      ),
    );
  }
}

class RSCheckBox2 extends StatefulWidget {
  const RSCheckBox2(
      {Key? key,
      required this.checkBoxValue,
      required this.displayName,
      required this.onChangeEvent})
      : super(key: key);
  final bool checkBoxValue;
  final String displayName;
  final Function onChangeEvent;

  @override
  State<RSCheckBox2> createState() => _RSCheckBoxState2();
}

class _RSCheckBoxState2 extends State<RSCheckBox2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Container(
            width: 160,
            padding: const EdgeInsets.only(right: 5.0),
            child: Text(widget.displayName),
          ),
          InkWell(
            onTap: () {
              if (mounted) {
                setState(() {
                  widget.onChangeEvent(!widget.checkBoxValue);
                });
              }
            },
            child: Icon(
              widget.checkBoxValue
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              size: 20,
              color: mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
