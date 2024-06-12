import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProductSteper extends StatefulWidget {
  const ProductSteper({super.key});

  @override
  State<ProductSteper> createState() => _ProductSteperState();
}

class _ProductSteperState extends State<ProductSteper> {
  @override
  Widget build(BuildContext context) {
    late TextEditingController _stepperETController =
        TextEditingController(text: '1');
    int _currentValue = 1;

    return Wrap(
      children: [
        SizedBox(
          height: 20,
          width: 30,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () {
              if (_currentValue > 1) {
                _currentValue--;
                _stepperETController.text = _currentValue.toString();
              }
            },
            child: const Icon(
              Icons.remove,
              size: 15,
            ),
          ),
        ),
        SizedBox(
          width: 30,
          height: 20,
          child: TextField(
            controller: _stepperETController,
            enabled: false,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                )),
          ),
        ),
        SizedBox(
          height: 20,
          width: 30,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () {
              if (_currentValue < 20) {
                _currentValue++;
                _stepperETController.text = _currentValue.toString();
              }
            },
            child: const Icon(
              Icons.add,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}
