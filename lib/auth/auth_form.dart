import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  AuthFormState createState() => AuthFormState();
}

class AuthFormState extends State<AuthForm> {
  //variable declaration
  final _formKey = GlobalKey<FormState>();
  var _email = "";
  var _password = "";
  var _username = "";
  bool isLoginPage = false;
  bool passwordVisible = true;
  //function
  startauthentication() {
    final validity = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (validity) {
      _formKey.currentState!.save();
      submitform(_email, _password, _username);
    }
    else{
      Fluttertoast.showToast(
          msg: "Invalid Credentials",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue.shade600,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  togglePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  submitform(String email, String password, String username) async {
    final auth = FirebaseAuth.instance;
    UserCredential authResult;
    try {
      if (isLoginPage) {
        authResult = await auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String uid = authResult.user!.uid;
        await FirebaseFirestore.instance
            .collection("users")
            .doc(uid)
            .set({"username": username, "email": email});
      }
    } on FirebaseAuthException {
      Fluttertoast.showToast(
          msg: "Invalid Credentials",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue.shade600,
          textColor: Colors.white,
          fontSize: 16.0);
      rethrow;
    }
  }

  //widget build
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          // Container(
          //     height: 200,
          //     margin: const EdgeInsets.all(20),
          //     child: Image.asset("assets/images/todo.png")
          // ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!isLoginPage)
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          key: const ValueKey("Username"),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2)),
                            labelText: "Username",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter Username";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _username = value!;
                          }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        key: const ValueKey("email"),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2)),
                          labelText: "Email",
                        ),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains("@")) {
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.lightBlue),
                        obscureText: passwordVisible,
                        keyboardType: TextInputType.emailAddress,
                        key: const ValueKey("password"),
                        decoration: InputDecoration(

                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2)),
                          labelText: "Password",

                          labelStyle: TextStyle(color:Colors.white),

                          suffixIcon: IconButton(
                            onPressed: togglePasswordVisibility,
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter Password";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 80, right: 80),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {
                          startauthentication();
                        },
                        child: isLoginPage
                            ? const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "Times New Roman",
                                    color: Colors.white),
                              )
                            : const Text("Submit",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "Times New Roman",
                                    color: Colors.white)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      child: isLoginPage
                          ? const Text(
                              "Not a user?",
                              style: TextStyle(color: Colors.white),
                            )
                          : const Text(
                              "already a user?",
                              style: TextStyle(color: Colors.white),
                            ),
                      onPressed: () {
                        setState(() {
                          isLoginPage = !isLoginPage;
                        });
                      },
                    ),
                  ], //end of children
                )),
          ),
        ],
      ),
    );
  }
}
