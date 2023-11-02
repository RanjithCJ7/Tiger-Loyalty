import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:tiger_loyalty/src/pages/create_account.dart';
import 'styles.dart';

class PinSetup extends StatelessWidget {
  final _oldPinFormatter = CustomTextInputFormatter();
  final _newPinFormatter = CustomTextInputFormatter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 15.0),
                          child: Image.asset('assets/pin_setup.png'),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            'PIN setup',
                            style: label,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30.0),
                          child: Text(
                            'Protect your deals and rewards',
                            style: desc,
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(
                                      right: 100.0, bottom: 5.0),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFFF5F5F5)),
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Image.asset('assets/pin.png'),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(4),
                                            _oldPinFormatter,
                                          ],
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: '* * * *',
                                            hintStyle: TextStyle(
                                                color: Color(0xFF808080)),
                                            border: InputBorder.none,
                                          ),
                                          style: textFieldStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 5.0),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFFF5F5F5)),
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Image.asset('assets/pin.png'),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(4),
                                            _newPinFormatter,
                                          ],
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: '* * * *',
                                            hintStyle: TextStyle(
                                                color: Color(0xFF808080)),
                                            border: InputBorder.none,
                                          ),
                                          style: textFieldStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => CreateAccount(),
                                    ),
                                  );
                                },
                                style: btnGold,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 13, vertical: 8.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: Text(
                                          'Next',
                                          style: btnGoldText,
                                        ),
                                      ),
                                      Image.asset('assets/btn_arrow_right.png'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    String text = newValue.text.replaceAll(RegExp(r'\D'), '');

    final StringBuffer newText = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 3 == 0) {
        newText.write('-');
      }
      newText.write(text[i]);
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
