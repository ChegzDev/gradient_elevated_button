import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Preferred: Use ThemeExtension for gradient button theming
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gradient Elevated Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: const ColorScheme.light(
            primary: Color(0xED1313F1),
            secondary: Color.fromARGB(255, 0, 175, 173)),
        extensions: <ThemeExtension<dynamic>>[
          GradientButtonThemeExtension(
            style: GradientElevatedButton.styleFrom(
              backgroundGradient: const LinearGradient(
                colors: [Colors.red, Colors.yellow],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              foregroundColor: Colors.black,
            ),
          ),
        ],
      ),
      home: const MyHomePage(),
    );
    // Deprecated: Old way using GradientButtonThemeData (will be removed in future)
    // return GradientButtonThemeData(
    //   data: GradientElevatedButton.styleFrom(
    //     backgroundGradient: const LinearGradient(
    //       colors: [Colors.blue, Colors.green],
    //       begin: Alignment.centerLeft,
    //       end: Alignment.centerRight,
    //     ),
    //     foregroundColor: Colors.black,
    //   ),
    //   child: MaterialApp(
    //     ...
    //   ),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gradient Elevated Button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Sample(
              title: "USE from `GradientButtonThemeData`",
              child: GradientElevatedButton(
                onPressed: () {},
                child:
                    const Text("This is Gradient Elevated Button From Theme"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Sample(
              title: "USE `GradientElevatedButton.styleFrom`",
              child: GradientElevatedButton(
                iconAlignment: IconAlignment.start,
                onPressed: () {},
                style: GradientElevatedButton.styleFrom(
                  backgroundGradient: const LinearGradient(
                    colors: [
                      Color(0xFFF84040),
                      Color(0xFF73A331),
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                  iconColor: Colors.white,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                    "This is GradientElevatedButton using styleFrom"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Sample(
              title: "USE `GradientElevatedButton.icon`",
              child: GradientElevatedButton.icon(
                iconAlignment: IconAlignment.start,
                onPressed: () {},
                style: GradientElevatedButton.styleFrom(
                  shadowColor: Colors.blue,
                  backgroundGradient: const LinearGradient(
                    colors: [
                      Color(0xFFF84040),
                      Color(0xFF73A331),
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                  iconColor: Colors.white,
                  foregroundColor: Colors.white,
                ),
                icon: Icon(Icons.add),
                label: Text("Add"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Sample(
              title: "USE disabled `GradientElevatedButton`",
              child: GradientElevatedButton(
                onPressed: null,
                style: GradientElevatedButton.styleFrom(
                  shadowColor: Colors.red,
                  disabledBackgroundGradient: LinearGradient(
                    colors: [
                      Colors.grey.withAlpha(200),
                      Colors.grey,
                      Colors.grey.withAlpha(200),
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                  iconColor: Colors.white,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                    "This is GradientElevatedButton using styleFrom"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sample extends StatelessWidget {
  final String title;
  final Widget child;

  const Sample({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextTheme.of(context).titleMedium,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          child,
        ],
      ),
    );
  }
}
