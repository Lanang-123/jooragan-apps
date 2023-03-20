import 'package:flutter/material.dart';
import 'package:joooragan/pages/email_konfirmasi.dart';
import 'package:joooragan/theme.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isEmailFilled = false;
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  void _onEmailChanged(String value) {
    setState(() {
      _isEmailFilled = value.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_circle_left_outlined,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 202, left: 49, right: 48),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Please enter your email to confirm verification',
                    style: regular.copyWith(
                        color: const Color.fromARGB(255, 216, 216, 216),
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  TextFormField(
                    validator: (value) {
                      final emailRegex =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                      if (value!.isEmpty) {
                        return "Email tidak boleh kosong";
                      } else if (!emailRegex.hasMatch(value)) {
                        return "Email tidak valid";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                    onChanged: _onEmailChanged,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      isDense: true,
                      isCollapsed: true,
                      prefixIcon: const Icon(Icons.mail, color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 25),
                      hintText: 'Enter your email',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 223, 223, 223),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 45,
                    child: FilledButton(
                        style: ButtonStyle(
                            backgroundColor: _isEmailFilled
                                ? MaterialStatePropertyAll(hitam2)
                                : const MaterialStatePropertyAll(
                                    Color.fromARGB(255, 167, 167, 167))),
                        onPressed: _isEmailFilled
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EmailConfirm(email: _email)));
                                }
                              }
                            : null,
                        child: Center(
                          child: Text(
                            'SEND INSTRUCTIONS',
                            style: semibold.copyWith(color: Colors.white),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
