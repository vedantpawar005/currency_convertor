import 'package:flutter/material.dart';

class CurrencyConvertorAppMaterial extends StatefulWidget {
  const CurrencyConvertorAppMaterial({super.key});

  @override
  State<CurrencyConvertorAppMaterial> createState() {
    return _CurrencyConvertorAppMaterialState();
  }
}

class _CurrencyConvertorAppMaterialState
    extends State<CurrencyConvertorAppMaterial> {
  final TextEditingController textEditingController = TextEditingController();
  double result = 0;
  String errorText = '';

  void convert() {
    setState(() {
      try {
        final input = textEditingController.text;
        if (input.isEmpty) {
          result = 0;
          errorText = 'Please enter a valid amount.';
        } else {
          final value = double.parse(input);
          result = value * 80;
          errorText = '';
        }
      } catch (e) {
        result = 0;
        errorText = 'Invalid input. Please enter a number.';
      }
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(
        width: 2,
        style: BorderStyle.solid,
        color: Colors.black,
      ),
    );

    const edgeInsets = EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0);

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        centerTitle: true,
        title: const Text('Currency Converter',
            style: TextStyle(color: Color.fromARGB(255, 249, 249, 249))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              errorText.isEmpty
                  ? 'INR ${result.toStringAsFixed(2)}'
                  : errorText,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 54,
                  color: errorText.isEmpty
                      ? const Color.fromRGBO(237, 232, 232, 1)
                      : Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: textEditingController,
                style: const TextStyle(color: Color.fromARGB(236, 4, 4, 4)),
                decoration: InputDecoration(
                  hintText: 'Please enter the amount in USD',
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(235, 4, 4, 4)),
                  suffixIcon: const Icon(Icons.monetization_on_outlined),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: edgeInsets,
                  focusedBorder: borderStyle,
                  enabledBorder: borderStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextButton(
                onPressed: convert,
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Convert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
