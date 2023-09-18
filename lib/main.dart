import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  static const List<String> imageLink = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZYDmYNyRzoZheVVmDPUWynWSVrjmftv8wfg&usqp=CAU',
    'https://images.statusfacebook.com/profile_pictures/cute_cats/cute_cats_profile_pictures_04.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNVQwRMBEt8NiIHofi0isZlVVzWSE8RAF6wD5Zrq_gTFTMhDrSWUUN_01O0uRfFrnSg_Q&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9JDygJC-OXTkYnzajOcKXn7uokSftC7dxh15twxS8jeOvk9iZypfnU7W2DeS9HXBGnPA&usqp=CAU',
    'https://clipart-library.com/2023/cute-doe-eyes-cat-profile-picture-sd8x26toa0mruwvc.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLuyc3n7pRSDiD3RP4TuS5zHBDAlNtReh13A6Sn_FvUZYRngiY5cDryoKLuUwJGoC6T4Y&usqp=CAU'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for photos',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: imageLink.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 30,
                  ),
                  itemBuilder: (context, index) {
                    return GridTile(
                      footer: Container(color: Colors.white,child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(child: Text("Photo $index",style: const TextStyle(fontSize: 20),)),
                      ),),
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Photo $index clicked!'),
                            ),
                          );
                        },
                        child: Container(
                          height: 150,
                          color: Colors.grey,
                          child: Image.network(
                            imageLink[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder:  (context, iindex) =>  ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage(imageLink[iindex]),),
                  title: Text('Photo ${iindex+1}'),
                  subtitle: Text('Description of photo ${iindex+1}'),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Photos Uploaded Successfully!'),
                  ),
                );
              },
              child: const Icon(Icons.upload),
            ),
          ],
        ),
      ),
    );
  }
}

