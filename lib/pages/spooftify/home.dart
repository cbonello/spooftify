import 'package:flutter/material.dart';
import 'package:spotify/pages/spooftify/login.dart';
import 'package:spotify/widgets/round_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle style1 =
        Theme.of(context).textTheme.body1.copyWith(color: Colors.white);
    final double height = MediaQuery.of(context).size.height;

    double computeHeight(double padding) {
      return height * padding / 683;
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
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
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: computeHeight(60),
                  bottom: computeHeight(110),
                ),
                child: SizedBox(
                  width: 240,
                  child: Image.asset('assets/images/Spooftify_Logo.png'),
                ),
              ),
              Center(
                child: Text(
                  'Millions of songs.',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
              Center(
                child: Text(
                  'Free on Spooftify.',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: computeHeight(90)),
                child: RoundButton(
                  title: 'SIGN UP FREE',
                  color: const Color(0xFF06C24A),
                  style: style1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: computeHeight(20)),
                child: RoundButton(
                  title: 'CONTINUE WITH FACEBOOK',
                  color: const Color(0xFF1659C1),
                  style: style1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: computeHeight(20)),
                child: RoundButton(
                  title: 'LOG IN',
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => LoginPage(),
                        ),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
