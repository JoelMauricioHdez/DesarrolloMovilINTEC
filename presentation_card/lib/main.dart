import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const kBgColor = Color.fromRGBO(223, 228, 221, 1);
    const kPrimaryColor = Color.fromRGBO(116, 138, 108, 1);
    const kTextColor = Color.fromRGBO(48, 57, 45, 1);

    return MaterialApp(
      title: "presentation",
      home: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [kBgColor, Colors.white, kBgColor, Colors.white],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text("Presentation"),
              backgroundColor: kPrimaryColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    radius: 50,
                    backgroundImage: AssetImage("foto.jpg"),
                  ),
                  addSpace(),
                  customText(
                    kTextColor,
                    "Lato",
                    20,
                    "Joel David Mauricio Hernández",
                  ),
                  addSpace(),
                  customText(
                    kTextColor,
                    "Montserrat",
                    14,
                    "Soy un estudiante de Ingeniería de Software",
                  ),
                  addSpace(),
                  const Divider(
                    indent: 50,
                    endIndent: 50,
                  ),
                  addSpace(),
                  cardGenerator(Icons.phone, "1+ 829 753 0824"),
                  addSpace(),
                  cardGenerator(Icons.email, "joeldavidmauriciohdez@gmail.com"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox addSpace() {
    return const SizedBox(
      height: 10,
    );
  }

  Text customText(
      Color kTextColor, String fontFamily, double size, String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        color: kTextColor,
      ),
      textAlign: TextAlign.center,
    );
  }

  Card cardGenerator(IconData icon, String text) {
    const kPrimaryColor = Color.fromRGBO(116, 138, 108, 1);

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        child: Row(
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: const TextStyle(color: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
