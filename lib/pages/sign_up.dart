import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:joooragan/pages/login.dart';
import 'package:joooragan/theme.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  String _username = '', _email = '', _password = '';
  bool _showPassword = false;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 100,
            padding:
                const EdgeInsets.only(top: 75, bottom: 5, left: 20, right: 41),
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(children: [
              Text('Sign Up', style: bold.copyWith(color: Colors.black))
            ]),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(39, 61, 41, 61),
            width: width,
            height: height - 110,
            decoration: BoxDecoration(
                color: hitam2,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Harap masukkan username';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _username = value!;
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        isDense: true,
                        isCollapsed: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 25),
                        hintText: 'Enter your Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Color.fromARGB(255, 223, 223, 223),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        )),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    validator: (value) {
                      final emailRegex =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (value!.isEmpty) {
                        return 'Email tidak boleh kosong';
                      } else if (!emailRegex.hasMatch(value)) {
                        return 'Email tidal valid';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        isDense: true,
                        isCollapsed: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 25),
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Color.fromARGB(255, 223, 223, 223),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.grey,
                        )),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_showPassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password tidak boleh kosong';
                      } else if (value.length < 6) {
                        return 'Password minimal 6 Karakter';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: toggleShowPassword,
                            icon: Icon(_showPassword
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        isDense: true,
                        isCollapsed: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 25),
                        hintText: 'Enter your Password',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 223, 223, 223),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.grey,
                        )),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          fillColor:
                              const MaterialStatePropertyAll(Colors.grey),
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                              print(isChecked);
                            });
                          }),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        child: RichText(
                            text: TextSpan(
                                style: semibold.copyWith(
                                    color: Colors.grey, fontSize: 14),
                                children: [
                              const TextSpan(text: 'I Agree with '),
                              TextSpan(
                                  text: 'Term & Condition ',
                                  style: TextStyle(color: gold)),
                              const TextSpan(
                                text: 'and ',
                              ),
                              TextSpan(
                                  text: 'Privacy and Policy',
                                  style: TextStyle(color: gold))
                            ])),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  FilledButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(gold),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(vertical: 15))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                      child: Center(
                        child: Text(
                          'SIGN UP',
                          style: semibold.copyWith(color: abu),
                        ),
                      )),
                  const SizedBox(
                    height: 28,
                  ),
                  RichText(
                    text: TextSpan(
                        style: semibold.copyWith(color: Colors.white),
                        children: [
                          const TextSpan(
                            text: 'Already have account ? ',
                          ),
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(color: gold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Login();
                                  }));
                                })
                        ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
