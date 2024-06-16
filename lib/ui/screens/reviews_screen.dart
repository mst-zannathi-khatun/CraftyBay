import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          height: 120,
          width: double.infinity,
          child: Card(
            color: Colors.white60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.person),
                      Text("First Name"),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      "Text fields allow users to type text into an app. They are used to build forms, send messages, create search experiences, and more. In this recipe, explore how  "),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
