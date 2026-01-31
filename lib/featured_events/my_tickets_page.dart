import 'package:flutter/material.dart';

class MyTicketsPage extends StatelessWidget {
  const MyTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7FF), 
      appBar: AppBar(
        title: const Text("My Tickets", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildColorfulTicket(
            title: "FutureTech 2026",
            date: "May 20, 2026",
            time: "10:00 AM",
            location: "Convention Center, Colombo",
            color: const Color(0xFF3B82F6), 
            icon: Icons.biotech,
          ),
          const SizedBox(height: 20),
          _buildColorfulTicket(
            title: "LPL T20 Finals",
            date: "Aug 15, 2026",
            time: "07:30 PM",
            location: "Premadasa Stadium",
            color: const Color(0xFF10B981), 
            icon: Icons.sports_cricket,
          ),
          const SizedBox(height: 20),
          _buildColorfulTicket(
            title: "Music Fest",
            date: "June 10, 2026",
            time: "06:00 PM",
            location: "Galle Face, Colombo",
            color: const Color(0xFF8B5CF6), 
            icon: Icons.music_note,
          ),
        ],
      ),
    );
  }

  Widget _buildColorfulTicket({
    required String title,
    required String date,
    required String time,
    required String location,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: IntrinsicHeight(
            child: Row(
              children: [
              
                Container(
                  width: 60,
                  color: color,
                  child: Center(
                    child: Icon(icon, color: Colors.white, size: 30),
                  ),
                ),
                
            
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
                            const SizedBox(width: 5),
                            Text("$date • $time", style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: 14, color: Colors.grey[600]),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                location,
                                style: TextStyle(color: Colors.grey[600]),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border(left: BorderSide(color: Colors.grey[200]!, width: 1, style: BorderStyle.solid)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.qr_code_2, size: 40),
                      const SizedBox(height: 5),
                      Text(
                        "ACTIVE",
                        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}