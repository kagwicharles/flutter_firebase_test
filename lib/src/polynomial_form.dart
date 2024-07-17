import 'package:flutter/material.dart';
import 'package:fluttertest/src/data/model.dart';
import 'package:fluttertest/src/respository/firebase_repository.dart';
import 'package:fluttertest/src/utils/polynomial_util.dart';

class PolynomialForm extends StatefulWidget {
  const PolynomialForm({super.key});

  @override
  State<PolynomialForm> createState() => _PolynomialFormState();
}

class _PolynomialFormState extends State<PolynomialForm> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _polynomialController = TextEditingController();

  final _polynomialUtil = PolynomialUtil();
  final _firebaseRepository = FirebaseRepository();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: SafeArea(
            child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 44),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    children: [
                      Text(
                        "Flutter Test",
                        style: TextStyle(fontSize: 28, color: Colors.grey[800]),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: _loginController,
                        decoration: const InputDecoration(labelText: "Login"),
                        validator: (value) {
                          if (value == null || value == "") {
                            return "required*";
                          } else if (!isValidAlphanumeric(value)) {
                            return "Invalid alphanumeric value";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration:
                            const InputDecoration(labelText: "Password"),
                        validator: (value) {
                          if (value == null || value == "") {
                            return "required*";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _polynomialController,
                        decoration:
                            const InputDecoration(labelText: "Polynomial"),
                        validator: (value) {
                          if (value == null || value == "") {
                            return "required*";
                          } else if (!isValidPolynomial(value)) {
                            return "Invalid polynomial input";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 54,
                      ),
                      isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: submitForm,
                              child: const Text("Submit"))
                    ],
                  ),
                )
              ],
            )),
          ),
        )));
  }

  bool isValidAlphanumeric(String str) {
    final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
    return alphanumeric.hasMatch(str);
  }

  bool isValidPolynomial(String input) {
    final RegExp polynomialRegExp =
        RegExp(r'^([+-]?(\d+)?x?(\^(\d+))?)*([+-]?(\d+)?)?$');
    return polynomialRegExp.hasMatch(input);
  }

  submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      var polynomialResult =
          _polynomialUtil.derivePolynomial(_passwordController.text);
      Model model = Model(polynomialResult,
          login: _loginController.text,
          password: _passwordController.text,
          polynomial: _passwordController.text);
      _firebaseRepository.saveData(model).then((value) {
        setState(() {
          isLoading = false;
        });
      });
    }
  }
}
