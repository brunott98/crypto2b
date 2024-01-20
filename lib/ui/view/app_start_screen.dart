import 'dart:async';
import 'package:crypto2b/ui/constants/app_constants.dart';
import 'package:crypto2b/navigation/crypto2b_navigation.dart';
import 'package:crypto2b/ui/theme/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppStartScreen());
}

class AppStartScreen extends StatelessWidget {
  const AppStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppThemes.lightTheme(),
      home: const StartScreen(),
    );
  }
}

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  StartScreenState createState() => StartScreenState();
}

class StartScreenState extends State<StartScreen> {
  late Timer _timer;
  late List<Color> _gradientColors;

  @override
  void initState() {
    super.initState();
    _gradientColors = [
      AppColors.primaryColor,
      AppColors.accentColor1,
      AppColors.accentColor2,
      AppColors.primaryColor,
    ];

    _timer = Timer.periodic(const Duration(seconds: 1), _updateGradient);

    Future.delayed(const Duration(seconds: 6), () {
      Nav.toCoinSelectionScreen(context);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateGradient(Timer timer) {
    setState(() {
      _gradientColors = _gradientColors.sublist(1)..add(_gradientColors[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        width: double.infinity,
        height: double.infinity,
        duration: const Duration(seconds: 3),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: _gradientColors,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 280),
                child: Text(
                  AppConstants.appName,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                    decorationColor: Colors.black,
                    decorationThickness: 8.0,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Image.asset(
                AppConstants.coinIconPath,
                width: 100.0,
                height: 100.0,
              ),
              const SizedBox(height: 280),
              const Text(
                AppConstants.developedBy,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
