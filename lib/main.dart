
import 'package:flutter/material.dart';

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

// STATIC: Home screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // LOGIC: Store study goals
  List<Map<String, dynamic>> goals = [
    {
      'subject': 'Mathematics',
      'hours': 3,
      'done': false,
    },
    {
      'subject': 'Programming',
      'hours': 2,
      'done': false,
    },
    {
      'subject': 'Networking',
      'hours': 4,
      'done': false,
    },
  ];

  // LOGIC: Toggle goal completion
  void toggleGoal(int index) {
    setState(() {
      goals[index]['done'] = !goals[index]['done'];
    });
  }

  // LOGIC: Delete a goal
  void deleteGoal(int index) {
    setState(() {
      goals.removeAt(index);
    });
  }

  // LOGIC: Add a sample goal
  void addGoal() {
    setState(() {
      goals.add({
        'subject': 'Database Systems',
        'hours': 2,
        'done': false,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Study Planner'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // STATIC: Heading
            const Text(
              'My Study Goals',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // CONNECTION: Connect data to the screen
            Expanded(
              child: ListView.builder(
                itemCount: goals.length,
                itemBuilder: (context, index) {

                  final goal = goals[index];

                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: goal['done'],
                        onChanged: (value) {
                          // CONNECTION: Connect checkbox to logic
                          toggleGoal(index);
                        },
                      ),

                      title: Text(
                        goal['subject'],
                        style: TextStyle(
                          decoration: goal['done']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),

                      subtitle: Text(
                        '${goal['hours']} study hours',
                      ),

                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          deleteGoal(index);
                        },
                      ),

                      onTap: () {
                        toggleGoal(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // STATIC: Floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: addGoal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
