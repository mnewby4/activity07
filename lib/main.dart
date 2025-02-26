import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FadingTextAnimation(),
    );
  }
}

class FadingTextAnimation extends StatefulWidget {
  @override
  _FadingTextAnimationState createState() => _FadingTextAnimationState();
}

class _FadingTextAnimationState extends State<FadingTextAnimation> {
  bool _isVisible = true;
  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  



  Widget createItem(String text, Color color) {
    return Scaffold(
      backgroundColor: color,
      body: Column(
          children: <Widget>[
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: const Text(
                'Hello, Flutter!',
                style: TextStyle(fontSize: 24),
              ),
            ),
            AnimatedCrossFade(
              duration: const Duration(seconds: 3),
              firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
              secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
              crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            )],
          ),
        );
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fading Text Animation'),
      ),
      body: 
      PageView(
        children: <Widget>[
          createItem('First Page', Colors.red),
          createItem('Second Page', Colors.blue),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility,
        child: Icon(Icons.play_arrow),
      ),      
    );
  }
}
