import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:joooragan/api/auth.dart';
import 'package:joooragan/pages/forgot_password.dart';
import 'package:joooragan/pages/main/index.dart';
import 'package:joooragan/pages/sign_up.dart';
import 'package:joooragan/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  String _email = '', _password = '';
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _showPassword = false;

  final List<Map<String, dynamic>> data = [
    {"logo": "assets/images/sign/google.png", "desc": "Sign in with Google"},
    {"logo": "assets/images/sign/apple.png", "desc": "Sign in with Apple"},
    {"logo": "assets/images/sign/google.png", "desc": "Sign in with Google"},
    {"logo": "assets/images/sign/fb.png", "desc": "Sign in with Facebook"},
  ];

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

  void togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(22, height * 0.25 - 130, 22, 10),
                width: double.infinity,
                height: height * 0.5 + 20,
                decoration: BoxDecoration(
                    color: hitam,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'LOGIN',
                            style: bold.copyWith(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 31,
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          final emailRegex =
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (value!.isEmpty) {
                            return 'Email tidak boleh kosong';
                          } else if (!emailRegex.hasMatch(value)) {
                            return 'Email tidak valid';
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
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 25),
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
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_showPassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password tidak boleh kosong';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: togglePasswordVisibility,
                                icon: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                )),
                            isDense: true,
                            isCollapsed: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 25),
                            hintText: 'Enter your password',
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
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPassword()));
                              },
                              child: Text(
                                'Forgot Password ?',
                                style: regular.copyWith(color: gold),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      Container(
                        height: 40,
                        width: width,
                        child: FilledButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(gold)),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                String email = _emailController.text;
                                String password = _passwordController.text;

                                await _authController
                                    .login(email, password)
                                    .then((value) async {
                                  if (value != null) {
                                    if (value['success'] == true) {
                                      final SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString(
                                          'token',
                                          value[
                                              'token']); // Simpan token ke dalam SharedPreferences
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return MainPage();
                                      }));

                                      // Registrasi berhasil
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text('Login berhasil!'),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
        
                                      // Navigasi ke halaman login setelah notifikasi ditampilkan
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return MainPage(); // Gantilah LoginPage dengan nama kelas halaman login Anda
                                      }));
                                    } else {
                                      // Menangani kondisi lain jika diperlukan
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Login gagal: ${value['message']}'),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    }
                                  } else {
                                    // Menangani jika value null
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Registrasi gagal: Username & email sudah terdaftar'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                });
                              }
                            },
                            child: Text(
                              'Login',
                              style: semibold.copyWith(color: Colors.white),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: regular.copyWith(color: Colors.white),
                            children: [
                              const TextSpan(
                                  text: 'Dont you have any account ? '),
                              TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(color: gold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return SignUp();
                                      }));
                                    }),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 31,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                            child: Divider(
                          indent: 2.0,
                          color: abu,
                        )),
                        Text("OR",
                            style: regular.copyWith(
                              color: abu2,
                            )),
                        Flexible(child: Divider(color: abu)),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: width,
                          height: 50,
                          child: OutlinedButton(
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)))),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/sign/google.png',
                                    width: 35,
                                    height: 35,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Sign in with Google',
                                    style: semibold.copyWith(
                                        color: Colors.black, fontSize: 14),
                                  )
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          height: 50,
                          child: OutlinedButton(
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)))),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/sign/apple.png',
                                    width: 35,
                                    height: 35,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Sign in with Apple',
                                    style: semibold.copyWith(
                                        color: Colors.black, fontSize: 14),
                                  )
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          height: 50,
                          child: OutlinedButton(
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)))),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/sign/fb.png',
                                    width: 35,
                                    height: 35,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Sign in with Facebook',
                                    style: semibold.copyWith(
                                        color: Colors.black, fontSize: 14),
                                  )
                                ],
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
