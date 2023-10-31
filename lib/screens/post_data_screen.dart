import 'package:flutter/material.dart';
import 'package:flutter_layout/provider/provider.dart';
import 'package:provider/provider.dart';

class ApiLoginScreen extends StatefulWidget {
  const ApiLoginScreen({super.key});

  @override
  State<ApiLoginScreen> createState() => _ApiLoginScreenState();
}

class _ApiLoginScreenState extends State<ApiLoginScreen> {
  late UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final userIdController = TextEditingController();

  final counter = ValueNotifier(0);

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    bodyController.dispose();
    userIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              onChanged: (value) {
                userProvider.setTitle = value;
              },
              decoration: const InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: bodyController,
              onChanged: (value) {
                userProvider.setbody = value;
              },
              decoration: const InputDecoration(
                hintText: 'Body',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: userIdController,
              onChanged: (value) => userProvider.setId = value,
              decoration: const InputDecoration(
                hintText: 'UserId',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                userProvider.createPost(
                  title: titleController.text,
                  body: bodyController.text,
                  userId: userIdController.text,
                );
              },
              child: const Text('Create new post'),
            ),
          ],
        ),
      ),
    );
  }
}
