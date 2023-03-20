import 'package:flutter/material.dart';
import 'package:joooragan/pages/login.dart';
import 'package:joooragan/theme.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _isPassword = false;
  bool _isConfirmPassword = false;
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  String _password = '', _confirmPassword = '';
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  String _passwordErrorText = '';

  void isPasswordFilled(String value) {
    setState(() {
      _isPassword = value.isNotEmpty;
    });
  }

  void isConfirmPasswordFilled(String value) {
    setState(() {
      _isConfirmPassword = value.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void toggleShowConfirmPassword() {
    setState(() {
      _showConfirmPassword = !_showConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
            )),
      ),
      body: Container(
          color: Colors.white,
          width: width,
          height: height,
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.25, left: 40, right: 40),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Enter your new password',
                    style: regular.copyWith(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password tidak boleh kosong";
                      } else if (value.length < 6) {
                        return "Password minimal 6 Karakter";
                      }
                      return null;
                    },
                    obscureText: !_showPassword,
                    onSaved: (value) {
                      _password = value!;
                    },
                    onChanged: isPasswordFilled,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: toggleShowPassword,
                          icon: Icon(_showPassword
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      isDense: true,
                      isCollapsed: true,
                      prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 25),
                      hintText: 'Enter your password',
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
                  TextFormField(
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password tidak boleh kosong";
                      } else if (value.length < 6) {
                        return "Password minimal 6 Karakter";
                      }
                      return null;
                    },
                    obscureText: !_showConfirmPassword,
                    onSaved: (value) {
                      _confirmPassword = value!;
                    },
                    onChanged: isConfirmPasswordFilled,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      errorText: _passwordErrorText,
                      suffixIcon: IconButton(
                          onPressed: toggleShowConfirmPassword,
                          icon: Icon(_showConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      isDense: true,
                      isCollapsed: true,
                      prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 25),
                      hintText: 'Confirm password',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 223, 223, 223),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 45,
                    child: FilledButton(
                        style: ButtonStyle(
                            backgroundColor: _isPassword && _isConfirmPassword
                                ? MaterialStatePropertyAll(hitam2)
                                : const MaterialStatePropertyAll(
                                    Color.fromARGB(255, 167, 167, 167))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            if (_confirmPassword != _password) {
                              setState(() {
                                _passwordErrorText = "Password tidak sama";
                              });
                              return;
                            }
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          }
                        },
                        child: Center(
                          child: Text(
                            'RESET PASSWORD',
                            style: semibold.copyWith(color: Colors.white),
                          ),
                        )),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
