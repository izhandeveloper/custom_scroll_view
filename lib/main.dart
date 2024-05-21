import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Scroll View',
      home: CustomScrollViewWidget(),
    );
  }
}

class CustomScrollViewWidget extends StatefulWidget {
  const CustomScrollViewWidget({Key? key}) : super(key: key);

  @override
  _CustomScrollViewWidgetState createState() =>
      _CustomScrollViewWidgetState();
}

class _CustomScrollViewWidgetState extends State<CustomScrollViewWidget> {
  double _scrollPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Scroll View'),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          setState(() {
            _scrollPercentage =
                (scrollInfo.metrics.pixels / scrollInfo.metrics.maxScrollExtent)
                    .clamp(0.0, 1.0);
          });
          return true;
        },
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      value: _scrollPercentage,
                      strokeWidth: 3,
                    ),
                  ),
                  Text(
                    "${(_scrollPercentage * 100).toInt()}%",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
