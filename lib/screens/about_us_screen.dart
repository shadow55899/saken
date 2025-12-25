import 'package:flutter/material.dart';

class TeamMember {
  final String name;
  final String role;

  TeamMember({required this.name, required this.role});
}

class AboutUsScreen extends StatelessWidget {
  final List<TeamMember> team = [
    TeamMember(name: "Bahaa Borhom", role: "Flutter Developer"),
    TeamMember(name: "Ghazal Saeed", role: "Flutter Developer"),
    TeamMember(name: "Omar Yassin", role: "Laravel Developer"),
    TeamMember(name: "Mahmoud Saad", role: "Laravel Developer"),
    TeamMember(name: "Abdalrahman Khuraki", role: "Laravel Developer"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Us")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: team.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final member = team[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                child: Text(
                  member.name[0], // First letter
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              title: Text(
                member.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(member.role),
            ),
          );
        },
      ),
    );
  }
}
