import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
 


  final List<String> FoodImage = [
    'https://images.pexels.com/photos/708587/pexels-photo-708587.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/4923106/pexels-photo-4923106.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/6501227/pexels-photo-6501227.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg',
    'https://images.pexels.com/photos/2467287/pexels-photo-2467287.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/541216/pexels-photo-541216.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  ];

  final List<String> Names = [
    'Itz_Meow...', 'Panagiotis', 'صنان احمد', 'REZA...', 'Fur', 'Dawson', 'Gorge'
  ];


  final List<String> Imags = [
'https://tse1.mm.bing.net/th?id=OIP.RHkw4pHXAwYaEKoUZLTwNAAAAA&pid=Api&P=0&h=220',
'https://images.gutefrage.net/media/fragen/bilder/wie-findet-ihr-mein-snap-avatar/0_full.jpg?v=1705882640000',
'https://i.pinimg.com/originals/5c/8e/67/5c8e6791cd678ea84417366f0c5c5d67.jpg',
'https://www.kindpng.com/picc/m/364-3640737_avatar-snapchat-hd-png-download.png',
'https://i.pinimg.com/736x/88/45/41/8845413435a514d89ed2cc27b5aa7439.jpg',
'https://preview.redd.it/snap-avatar-v0-v2ky461f9yva1.jpg?width=640&crop=smart&auto=webp&s=0756989e8e2d4697f456d4ea7b724358ec883257',
'https://static.vecteezy.com/system/resources/previews/024/183/502/original/male-avatar-portrait-of-a-young-man-with-a-beard-illustration-of-male-character-in-modern-color-style-vector.jpg'
  ] ;

  final List<MessageItem> messages = [
    MessageItem('John', 'New Snap • 3m' , '39',Container(height: 11,width: 11,decoration: const BoxDecoration(color: Colors.purple),)),
    MessageItem('Wick', 'New Chat • 9m', '32',Container(height: 11,width: 11,decoration: const BoxDecoration(color: Colors.blue),)),
    MessageItem('Gorge', 'New Snap • 3h', '8',Container(height: 11,width: 11,decoration: const BoxDecoration(color: Colors.red),)),
    MessageItem('Jack', 'New Snap • 5h', '536',Container(height: 11,width: 11,decoration: const BoxDecoration(color: Colors.red),)),
    MessageItem('David', 'New Snap • 19h', '3',Container(height: 11,width: 11,decoration: const BoxDecoration(color: Colors.purple),)),
    MessageItem('Rodger', 'New Snap • 1d', '553',Container(height: 11,width: 11,decoration: const BoxDecoration(color: Colors.red),)),
    MessageItem('Dawson', 'New Snap• 3w', '43',Container(height: 11,width: 11,decoration: const BoxDecoration(color: Colors.red),)),
    
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: SizedBox(
            height: 31,
            child: CachedNetworkImage(
              imageUrl: "https://www.pngkit.com/png/full/25-258694_cool-avatar-transparent-image-cool-boy-avatar.png",
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        title: const Text('Friends', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(icon: const Icon(Icons.person_add, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.chat, color: Colors.blue), onPressed: () {}),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "All"),
            Tab(text: "Unread"),
            Tab(text: "Group"),
            Tab(text: "Unreplied"),
            Tab(text: "Best Friends"),
            Tab(text: "Streaks"),
          ],
          dividerColor: Colors.transparent,
        ),
      ),
    
      body: TabBarView(
        controller: _tabController,
        children: List.generate(6, (index) => _buildTabContent()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: 'Camera'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Stories'),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return Column(
      children: [
        const SizedBox(height: 11,),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: FoodImage.length,
            itemBuilder: (context, index) => _buildFriendItem(index),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) => _buildMessageItem(messages[index],index),
          ),
        ),
      ],
    );
  }

  Widget _buildFriendItem(int index) {
    return Container(
      width: 70,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.purple, width: 3),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: CachedNetworkImageProvider(FoodImage[index]),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            Names[index],
            style: const TextStyle(color: Colors.white, fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

 Widget _buildMessageItem(MessageItem message, int indx) {
  return ListTile(
    leading: CircleAvatar(
      radius: 31,
      backgroundColor: Colors.grey[800],
      backgroundImage: NetworkImage(Imags[indx]),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(message.name, style: const TextStyle(color: Colors.white)),
       
        Row(
          children: [
            message.container,
            const SizedBox(width: 4),
            Text(message.status, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(width: 5,),
            Text(' ${message.count}', style: const TextStyle(color: Colors.white, fontSize: 12)),
          IconButton(onPressed: (){

          }, icon:   const FaIcon(
          FontAwesomeIcons.fire,
          size: 19,
         color: Colors.orange
        ),)
          ],
        ),
      
        
      ],
    ),
    trailing: const Icon(Icons.chat_bubble, color: Colors.grey),
  );
}}

class MessageItem {
  final String name;
  final String status;
  final String count;
  Container container ;
  MessageItem(this.name, this.status, this.count, this.container);
}