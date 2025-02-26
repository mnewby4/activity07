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
  bool _showFrame = true;
  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Widget createItem(String text, Color color) {
    return Scaffold(
      backgroundColor: color,
      body: Container(child:    
  
          Builder(
            builder: (context) {
              if (text == "First Page") 
                return AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Text(
                    _isVisible ? 'Hello, Flutter!' : 'Oh, Goodbye!',
                    style: TextStyle(fontSize: 24),
                  ),
                );

              return AnimatedCrossFade(
                //Different animation duration
                duration: const Duration(seconds: 5),
                firstChild: ClipRRect(
                  borderRadius: BorderRadius.circular(_showFrame ? 20.0 : 0.0),
                  child: Container(
                    color: Colors.purple, // Background color to visualize rounded corners
                    padding: EdgeInsets.all(8.0),
                    child: FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
                  ),
                ),
                secondChild: ClipRRect(
                  borderRadius: BorderRadius.circular(_showFrame ? 20.0 : 0.0),
                  child: Container(
                    color: Colors.pink, // Background color to visualize rounded corners
                    padding: EdgeInsets.all(8.0),
                    child: FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
                  ),
                ),
                firstCurve: Curves.bounceIn,
                secondCurve: Curves.bounceInOut,
                crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              );
            },
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity 7'),  
        actions: [
           Switch(
              value: _showFrame,
              activeColor: Colors.red,
              onChanged: (bool value) {
                setState(() {
                _showFrame = value;
                });
              },
            ),
        ], 
      ),
      body: 
        PageView(
          children: <Widget>[
            createItem('First Page', Colors.red),
            createItem('Second Page', Colors.blue),
                    
          ]),
        floatingActionButton: FloatingActionButton(
          onPressed: toggleVisibility,
          child: Icon(Icons.play_arrow),
        ),      
    );
  }
}