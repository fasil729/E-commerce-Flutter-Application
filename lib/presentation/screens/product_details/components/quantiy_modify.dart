import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final int initialValue;
  final Function(int) onValueChanged;

  QuantitySelector({
    required this.initialValue,
    required this.onValueChanged,
  });

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late TextEditingController _controller;
  int _value = 0;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
    _controller = TextEditingController(text: _value.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _increment() {
    setState(() {
      _value++;
      _controller.text = _value.toString();
      widget.onValueChanged(_value);
    });
  }

  void _decrement() {
    setState(() {
      if (_value > 0) {
        _value--;
        _controller.text = _value.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: _decrement,
        ),
        SizedBox(
          width: 64,
          child: TextField(
            controller: _controller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _value = int.parse(value);
                widget.onValueChanged(_value);
              });
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _increment,
        ),
      ],
    );
  }
}