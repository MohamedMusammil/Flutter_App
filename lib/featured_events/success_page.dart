import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final String eventName;
  const SuccessPage({super.key, required this.eventName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 20),
            const Text("Booking Confirmed!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey[300]!)),
              child: Column(
                children: [
                  const Icon(Icons.qr_code_2, size: 150),
                  const SizedBox(height: 10),
                  Text(eventName, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const Text("Show this QR at entrance", style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(onPressed: () => Navigator.popUntil(context, (route) => route.isFirst), child: const Text("Go to My Tickets")),
          ],
        ),
      ),
    );
  }
}