import 'package:flutter/material.dart';
import 'package:talent_bridge/Screens/job_detail_screen.dart';

import '../Constants/static_data.dart';

class JobListingScreen extends StatelessWidget {
  const JobListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        final job = jobs[index];
        return InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => JobDetailScreen(job: job))),
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: job.logo,
                    child: Image.network(
                      job.logo,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(job.company),
                      Text(job.location),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
