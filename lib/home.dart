import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

List<String>Images = [
'https://www.pngkit.com/png/full/25-258694_cool-avatar-transparent-image-cool-boy-avatar.png',
'https://i.pinimg.com/originals/60/4c/d9/604cd9dd17c850cbd2687618dbccb5d4.jpg'
'https://i.pinimg.com/736x/88/45/41/8845413435a514d89ed2cc27b5aa7439.jpg',
 'https://tse1.mm.bing.net/th?id=OIP.ySarCc3gydXPoUVHyLODCgAAAA&pid=Api&P=0&h=220',
 'https://i.pinimg.com/originals/eb/c0/f5/ebc0f5f4650ebb49d22c8bcdf6fbed38.jpg',  
];

List<String> Names = [
'John',
'wick',
'jack',
'rose',
'jasmine',
];


    return Scaffold(
   appBar: AppBar(
    leading: CircleAvatar(
    backgroundColor: Colors.transparent,
    maxRadius: 21,
    child: Center(child: Image.network('https://static.vecteezy.com/system/resources/previews/006/487/917/original/man-avatar-icon-free-vector.jpg'),),
   ),
   title: Text('Freinds',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
   ),
     body: Column(
        children: [
          Text('Hshah')
        ],
      )

        
   );
      
    
  }
}



// CachedNetworkImage(
//        imageUrl: "http://via.placeholder.com/350x150",
//        progressIndicatorBuilder: (context, url, downloadProgress) => 
//                CircularProgressIndicator(value: downloadProgress.progress),
//        errorWidget: (context, url, error) => Icon(Icons.error),
//     ),