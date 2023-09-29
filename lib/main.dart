import 'package:flutter/material.dart';

void main() {
  runApp(livetest8App());
}

class livetest8App extends StatelessWidget {
  const livetest8App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Feed',
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  List<String> imageUrls = List.generate(10, (index) => 'https://via.placeholder.com/150?text=${"150 x 150"}');

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: isLandscape
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return ImageCard(imageUrl: imageUrls[index]);
              },
            )
          : ListView.builder(
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return ImageCard(imageUrl: imageUrls[index]);
              },
            ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String imageUrl;

  ImageCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image.network(
            imageUrl,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
          ),
        ],
      ),
    );
  }
}
