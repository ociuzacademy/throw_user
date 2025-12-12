import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_user/core/constants/app_colors.dart';
import 'package:throw_user/modules/splash_screen_module/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Throw',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        cardColor: Colors.white,
        scaffoldBackgroundColor: AppColors.backgroundLight,
        textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
          titleLarge: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          bodyLarge: GoogleFonts.plusJakartaSans(color: Colors.black87),
          bodyMedium: GoogleFonts.plusJakartaSans(color: Colors.grey[700]),
          bodySmall: GoogleFonts.plusJakartaSans(color: Colors.grey[600]),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundLight.withValues(alpha: 0.8),
          elevation: 0,
          titleTextStyle: GoogleFonts.plusJakartaSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: AppColors.primary,
        cardColor: AppColors.cardDark,
        scaffoldBackgroundColor: AppColors.backgroundDark,
        textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
          titleLarge: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyLarge: GoogleFonts.plusJakartaSans(color: Colors.white),
          bodyMedium: GoogleFonts.plusJakartaSans(color: Colors.grey[300]),
          bodySmall: GoogleFonts.plusJakartaSans(color: Colors.grey[400]),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundDark.withValues(alpha: 0.8),
          elevation: 0,
          titleTextStyle: GoogleFonts.plusJakartaSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
