import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var h= MediaQuery.of(context).size.height;
    var w= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Display'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? buildPortraitLayout()
              : buildLandscapeLayout();
        },
      ),
    );
  }

  Widget buildPortraitLayout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Top: Circular Avatar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/photob.jpeg'), // Replace with your image path
            ),
          ),

          // Middle: Text
          Text(
            'Md Nayem Hossain',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'These are short, famous texts in English from classic sources like the Bible or Shakespeare. Some texts have word definitions and explanations to help you.',
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),

          // Bottom: Scrollable GridView
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 50,
              itemBuilder: (context, index) {
                return Card(
                  child: Center(
                    child: Image.asset('assets/photoa.jpeg'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLandscapeLayout() {
    return Row(
      children: <Widget>[
        // Left: Circular Avatar
        Container(
          padding: EdgeInsets.all(16.0),
          child: CircleAvatar(
            radius:100,
            backgroundImage: AssetImage('assets/photob.jpeg',), // Replace with your image path
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      'Md Nayem Hossain',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'These are short, famous texts in English from classic sources like the Bible or Shakespeare. Some texts have word definitions and explanations to help you.',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                )
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Center(
                        child: Image.asset('assets/photoa.jpeg'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
