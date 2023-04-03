// ignore_for_file: avoid_unnecessary_containers

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../utils/style_constants.dart';
//import 'package:weee/utils/style_constants.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final databaseReference = FirebaseDatabase.instance.ref('details');
  bool val = false;
  bool selectedScreen = true;
  @override
  Widget build(BuildContext context) {
    TextEditingController company = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController address = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },

      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child:Image.asset('assets/image/img.png',
                  height: 100,
                  width: 100,
                 // fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Material(
                        shape: const Border(
                          bottom: BorderSide(color: Colors.teal, width: 3.0),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'LogIn',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Material(
                        shape: const Border(
                          bottom: BorderSide(color: Colors.green, width: 3.0),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              selectedScreen = false;
                            });
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 20,
                                color: selectedScreen
                                    ? Colors.green
                                    : Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextField(
                            controller: company,
                            decoration: InputDecoration(
                              hintStyle: kHintStyle,
                              hintText: 'Enter name of business/company',
                              labelText: 'Company/Business Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height:27,
                          ),
                          TextField(
                            controller: email,
                            decoration: InputDecoration(
                              hintStyle: kHintStyle,
                              hintText: 'Enter your email address',
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 27,
                          ),
                          TextField(
                            controller: phone,
                            decoration: InputDecoration(
                              hintStyle: kHintStyle,
                              hintText: 'Enter your phone number',
                              labelText: 'Phone',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 27,
                          ),
                          TextField(
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              hintStyle: kHintStyle,
                              hintText: 'Enter your password',
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 27,
                          ),
                          TextField(
                            controller: address,
                            decoration: InputDecoration(
                              hintStyle: kHintStyle,
                              hintText: 'Enter your adress',
                              labelText: 'Address',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 10, right: 0, bottom: 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: val,
                      onChanged: (value) {
                        setState(() {
                          val = value!;
                        });
                      },
                    ),
                    const Text(
                      'I agree with the ',
                      style: TextStyle(fontSize: 15),
                    ),
                    const Text(
                      'T&C ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 24, 121, 37)),
                    ),
                    const Text(
                      'and ',
                      style: TextStyle(fontSize: 15),
                    ),
                    const Text(
                      'Privacy Policy',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 24, 121, 37)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 13.5),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          databaseReference.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                            'company' : company.text.toString(),
                            'phone': phone.text.toString(),
                            'email' : email.text.toString(),
                            'address' : address.text.toString(),
                          }).then((value) =>
                          Navigator.pushNamed(context, '/home')
                          );
                          // Navigator.pushNamed(context, '/map_screen');
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 22.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
