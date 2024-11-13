import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xff25D366),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff075E54),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.white, width: 3),
            ),
          ),
        ),
      ),
      home: WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Chats'),
            Tab(text: 'Status'),
            Tab(text: 'Calls'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChatsScreen(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xff25D366),
        child: Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}

final List<String> contactNames = [
  'klop',
  'ade',
  'arya',
  'ananta',
  'bayu',
  'miko',
  'dewa',
  'mahen',
  'ivan',
  'krisna',
  'fery',
  'rama',
  'qodri',
  'aldi',
  'desy',
  'aan',
  'mahendra',
  'ahyar',
  'surya',
  'tata'
];

Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

String getRandomTime() {
  Random random = Random();
  int hours = random.nextInt(24);
  int minutes = random.nextInt(60);
  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
}

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contactNames.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: index == 0
                ? AssetImage('Screenshot 2024-10-01 004855.png')
                : index == 1
                    ? AssetImage('Screenshot 2024-09-30 094220.png')
                    : index == 2
                        ? AssetImage(
                            'WhatsApp Image 2024-10-28 at 12.32.39.jpeg')
                        : index == 3
                            ? AssetImage(
                                'WhatsApp Image 2024-10-28 at 12.32.40 (1).jpeg')
                            : index == 4
                                ? AssetImage(
                                    'WhatsApp Image 2024-10-28 at 12.32.40.jpeg')
                                : index == 5
                                    ? AssetImage(
                                        'WhatsApp Image 2024-10-28 at 13.00.37 (1).jpeg')
                                    : index == 6
                                        ? AssetImage(
                                            'WhatsApp Image 2024-10-28 at 13.00.37.jpeg') // 7 contact image
                                        : null, // No image for others
            backgroundColor: index < 7 ? Colors.transparent : getRandomColor(),
            child: index >= 7
                ? Text(
                    contactNames[index][0].toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )
                : null,
          ),
          title: Text(
            contactNames[index],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            'Pesan Terakhir Dari ${contactNames[index]}',
            style: TextStyle(color: Colors.grey[600]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getRandomTime(),
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              if (index % 3 == 0)
                Container(
                  margin: EdgeInsets.only(top: 4),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Status Screen',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)));
  }
}

class CallsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Calls Screen',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 60, color: Colors.white70),
            ),
            SizedBox(height: 16),
            Text(
              'Your Name',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Status: Available',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
