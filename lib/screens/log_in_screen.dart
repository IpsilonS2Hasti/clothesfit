import 'package:camera/camera.dart';
import 'package:clothesfit/screens/camera_screen.dart';
import 'package:clothesfit/screens/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:clothesfit/widgets/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentNode = FocusScope.of(context);
          if (currentNode.focusedChild != null &&
              !currentNode.hasPrimaryFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/CircularDetail.svg",
              height: 150,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 80),
                child: Center(
                    child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/LogInScreenArt.svg",
                      height: 260,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Form(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "E-mail",
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 3, bottom: 12),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13.0),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Forgot Password?',
                                            style: TextStyle(
                                                color: Color(0xFF63F3FF)),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {}),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            CustomButton(
                              onPressed: () async {
                                var avCams = await availableCameras();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => CameraScreen(
                                      cameras: avCams,
                                    ),
                                  ),
                                );
                              },
                              text: "Get Started",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Or",
                              style: TextStyle(
                                color: Color(0xFF000000).withOpacity(0.65),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "connect using",
                              style: TextStyle(
                                color: Color(0xFF000000).withOpacity(0.65),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  iconSize: 60,
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      "assets/FacebookLogo.svg"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  iconSize: 60,
                                  onPressed: () {},
                                  icon:
                                      SvgPicture.asset("assets/GoogleLogo.svg"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  iconSize: 60,
                                  onPressed: () {},
                                  icon:
                                      SvgPicture.asset("assets/AppleLogo.svg"),
                                ),
                              ],
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16.0),
                                children: <TextSpan>[
                                  TextSpan(text: "Don't have an account? "),
                                  TextSpan(
                                      text: 'Sign up',
                                      style:
                                          TextStyle(color: Color(0xFF63F3FF)),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) => SignUpScreen(),
                                            ),
                                          );
                                        }),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
