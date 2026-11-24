
import 'package:flutter/material.dart';

// PHASE 1:

void main() {
  runApp(const MyApp());
}

// STATIC: Main application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Study Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Study Planner'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      // STATIC: Page content
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Study Goals',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // STATIC: Study goal cards
            Card(
              child: ListTile(
                leading: const Icon(Icons.book, color: Colors.blue),
                title: const Text('Mathematics'),
                subtitle: const Text('3 study hours'),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.computer, color: Colors.blue),
                title: const Text('Programming'),
                subtitle: const Text('2 study hours'),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.wifi, color: Colors.blue),
                title: const Text('Networking'),
                subtitle: const Text('4 study hours'),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
