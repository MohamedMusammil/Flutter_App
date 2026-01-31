import 'package:flutter/material.dart';
import 'package:flutter_application_1/featured_events/paymentpage.dart';
// Make sure this filename matches your actual payment page file

class EventDetailsPage extends StatelessWidget {
  final Map<String, String> event;
  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- IMPROVED IMAGE SECTION WITH BACK BUTTON ---
                  Stack(
                    children: [
                      Image.asset(
                        event['image'] ?? 'assets/placeholder.jpg', 
                        height: 280, 
                        width: double.infinity, 
                        fit: BoxFit.cover
                      ),
                      // Custom Back Button
                      Positioned(
                        top: 40,
                        left: 20,
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.9),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.black),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event['name'] ?? event['title'] ?? 'Event Name', 
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                        ),
                        const SizedBox(height: 10),
                        Text(
                          event['date'] ?? 'Date TBD', 
                          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600)
                        ),
                        const SizedBox(height: 15),
                        const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(
                          event['description'] ?? 'No description available for this event.', 
                          style: const TextStyle(color: Colors.blueGrey, height: 1.5)
                        ),
                        const SizedBox(height: 20),
                        const Text("Venue Map", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        // Mock Map View
                        Container(
                          height: 150, 
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15), 
                            color: Colors.blue[50],
                            border: Border.all(color: Colors.blue[100]!)
                          ), 
                          child: const Center(child: Icon(Icons.map_outlined, size: 50, color: Colors.blue))
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildBookNowButton(context),
        ],
      ),
    );
  }

  Widget _buildBookNowButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))]
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, 
          minimumSize: const Size(double.infinity, 55), 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
        ),
        onPressed: () { // 1. Added "on" here
  Navigator.push(
    context, 
    MaterialPageRoute(
      builder: (context) => PaymentPage(
        // Ensure these keys match your event Map
        eventName: event['name'] ?? event['title'] ?? 'Event', 
        pricePerTicket: event['price'] ?? 'LKR 0',
      ),
    ),
  );
},
        child: const Text("Book Now", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}