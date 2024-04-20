import 'package:flutter/material.dart';
import '../Models/candidate.dart';

class CandidateDetailScreen extends StatefulWidget {
  const CandidateDetailScreen({super.key, required this.candidate});
  final Candidate candidate;

  @override
  State<CandidateDetailScreen> createState() => _CandidateDetailScreenState();
}

class _CandidateDetailScreenState extends State<CandidateDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidate Deatil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: widget.candidate.image,
              child: Center(
                child: Container(
                  height: 400,
                  width: 300,
                  child: Image.asset(widget.candidate.image, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.candidate.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.candidate.position,
              style: const TextStyle(fontSize: 18, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.candidate.experience,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.candidate.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Center(
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    widget.candidate.isConnected = !widget.candidate.isConnected;
                  });
                },
                color: Colors.cyan,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  child: Text(
                    widget.candidate.isConnected ? 'Disconnect' : 'Connect',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
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