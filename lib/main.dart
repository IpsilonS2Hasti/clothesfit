import 'package:clothesfit/screens/log_in_screen.dart';
import 'package:clothesfit/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF63f3ff),
        canvasColor: const Color(0xFFF5FFF8),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 20,
              color: Color(0xFF050505),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          hintStyle: TextStyle(color: Colors.black45),
        ),
      ),
      home: const MyHomePage(title: 'Welcome'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            Padding(
              padding: EdgeInsets.only(top: 150),
              child: Center(
                  child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/StartScreenArt.svg",
                    height: 250,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "CLOTHESFIT",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "An easy way to choose clothes online",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: CustomButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => LogInScreen(),
                          ),
                        );
                      },
                      text: "Get Started",
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
