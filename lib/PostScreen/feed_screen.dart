import 'package:flutter/material.dart';
import 'package:talent_bridge/Constants/static_data.dart';
import 'package:talent_bridge/Models/candidate.dart';
import 'package:talent_bridge/Models/posts.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Candidate> connectedCandidates = candidates.where((candidate) => candidate.isConnected).toList();
    final List<Feed> filteredFeeds = feeds.where((feed) => connectedCandidates.any((candidate) => candidate.id == feed.candidateId)).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: filteredFeeds.length,
        itemBuilder: (context, index) {
          final feed = filteredFeeds[index];
          final candidate = candidates.firstWhere((candidate) => candidate.id == feed.candidateId);
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(feed.title),
                  subtitle: Text(feed.description),
                ),
                Row(
                  children: [
                    Text('Posted by: ${candidate.name}'), // Show user name
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Like"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Share"),
                    ),

                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
