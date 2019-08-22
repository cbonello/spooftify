import 'package:flutter/material.dart';
import 'package:spotify/widgets/round_button.dart';
import 'package:spotify/widgets/text_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController ctrlUser =
        TextEditingController(text: 'adam.primo@hotguy.com');
    final TextEditingController ctrlPwd =
        TextEditingController(text: 'iamadamprimo');
    final double height = MediaQuery.of(context).size.height;

    double computeHeight(double padding) {
      return height * padding / 683;
    }

    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: <double>[0.0, 0.25, 0.6, 1.0],
                colors: <Color>[
                  Color(0XFF2303a2),
                  Color(0xFF4A0CC5),
                  Color(0xFFA423F1),
                  Color(0xFFFF40B4)
                ],
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Padding(
              padding: EdgeInsets.only(
                left: computeHeight(20),
                right: computeHeight(20),
              ),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: computeHeight(15),
                      bottom: computeHeight(80),
                    ),
                    child: Center(
                      child: Text(
                        'Log in',
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Email or username',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    controller: ctrlUser,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: computeHeight(20), bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Password',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon:
                          Icon(Icons.visibility_off, color: Colors.grey),
                    ),
                    controller: ctrlPwd,
                    obscureText: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: computeHeight(95),
                      top: computeHeight(90),
                      right: computeHeight(95),
                    ),
                    child: RoundButton(
                      title: 'LOG IN',
                      width: 50,
                      style: const TextStyle(fontSize: 20),
                      onPressed: () => Navigator.pushReplacementNamed(
                            context,
                            '/spooftify_songs',
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: computeHeight(30),
                      top: computeHeight(40),
                      right: computeHeight(30),
                    ),
                    child: const TextButton(
                      text: 'Having trouble logging in? Get help here.',
                      errorMessage: 'Sorry, you\'re on your own!',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
