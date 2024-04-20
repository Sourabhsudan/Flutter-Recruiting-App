
import 'package:flutter/material.dart';

import '../Models/jobs.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({super.key, required this.job});
  final Job job;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.title.toUpperCase()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              job.logo,
            ),
            const SizedBox(height: 10),
            Text(
              'Company: ${job.company}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Location: ${job.location}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Description: ${job.description}',
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.cyan,// Text color of the button
                  elevation: 4,  // Shadow elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),  // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),  // Padding inside the button
                ),
                child: const Text(
                  'Apply',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
