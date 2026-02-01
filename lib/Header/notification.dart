import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
            },
            child: const Text("Clear All", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Today", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 15),
          _notificationItem(
            icon: Icons.local_offer,
            color: Colors.orange,
            title: "60% Off on Early Bird Tickets!",
            desc: "Grab your tickets for FutureTech 2026 before they run out.",
            time: "2 mins ago",
            isUnread: true,
          ),
          _notificationItem(
            icon: Icons.calendar_month,
            color: Colors.blue,
            title: "Event Reminder",
            desc: "Music Fest starts in 2 hours at Galle Face, Colombo.",
            time: "1 hour ago",
            isUnread: true,
          ),
          const SizedBox(height: 25),
          const Text("Yesterday", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 15),
          _notificationItem(
            icon: Icons.check_circle,
            color: Colors.green,
            title: "Payment Successful",
            desc: "Your booking for Tech Summit 2026 is confirmed.",
            time: "Yesterday",
            isUnread: false,
          ),
          _notificationItem(
            icon: Icons.favorite,
            color: Colors.red,
            title: "New Event in your Area",
            desc: "EcoLife Expo just posted new details about workshops.",
            time: "Yesterday",
            isUnread: false,
          ),
        ],
      ),
    );
  }

  Widget _notificationItem({
    required IconData icon,
    required Color color,
    required String title,
    required String desc,
    required String time,
    required bool isUnread,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isUnread ? Colors.blue.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: isUnread ? Border.all(color: Colors.blue.withOpacity(0.2)) : null,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 5))
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 5),
                Text(desc, style: TextStyle(color: Colors.grey[600], fontSize: 13, height: 1.4)),
                const SizedBox(height: 8),
                Text(time, style: const TextStyle(color: Colors.grey, fontSize: 11)),
              ],
            ),
          ),
          if (isUnread)
            const CircleAvatar(radius: 4, backgroundColor: Colors.blue),
        ],
      ),
    );
  }
}