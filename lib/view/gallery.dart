import 'package:flutter/material.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

final List<String> imageUrls = [
  'https://images.pexels.com/photos/1808329/pexels-photo-1808329.jpeg?cs=srgb&dl=pexels-darwis-alwan-1808329.jpg&fm=jpg',
  'https://media.photographycourse.net/wp-content/uploads/2014/11/08164934/Landscape-Photography-steps.jpg',
];

class _GalleryViewState extends State<GalleryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        centerTitle: true,
        elevation: 0,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 1000,
        itemBuilder: (BuildContext context, int index) {
          final imageUrl = imageUrls[index % imageUrls.length];
          return Image.network(
            imageUrl,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
