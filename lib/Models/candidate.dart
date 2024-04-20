class Candidate {
  Candidate({
    required this.id,
    required this.name,
    required this.image,
    required this.position,
    required this.experience,
    required this.description,
    this.isConnected = false,
  });
  final String id;
  final String name;
  final String image;
  final String position;
  final String experience;
  final String description;
  bool isConnected;
}
