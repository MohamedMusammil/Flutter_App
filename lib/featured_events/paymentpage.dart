import 'package:flutter/material.dart';
import 'success_page.dart';

class PaymentPage extends StatefulWidget {
  final String eventName;
  final String pricePerTicket;

  const PaymentPage({
    super.key,
    required this.eventName,
    required this.pricePerTicket,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int ticketCount = 1;
  String selectedMethod = "Card";

  int get priceValue {
    return int.parse(widget.pricePerTicket.replaceAll(RegExp(r'[^0-9]'), ''));
  }

  @override
  Widget build(BuildContext context) {
    int totalAmount = priceValue * ticketCount;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.eventName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "Price per ticket: ${widget.pricePerTicket}",
              style: const TextStyle(color: Colors.grey),
            ),
            const Divider(height: 40),

            const Text(
              "Select Quantity",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                _counterButton(Icons.remove, () {
                  if (ticketCount > 1) setState(() => ticketCount--);
                }),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "$ticketCount",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _counterButton(Icons.add, () {
                  setState(() => ticketCount++);
                }),
              ],
            ),
            const SizedBox(height: 30),

            const Text(
              "Payment Method",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _paymentOption("Visa / Master Card", "Card", Icons.credit_card),
            _paymentOption("Genie by Dialog", "Genie", Icons.flash_on),
            _paymentOption("HNB SOLO", "SOLO", Icons.account_balance),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Amount:", style: TextStyle(fontSize: 16)),
                Text(
                  "LKR ${totalAmount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SuccessPage(eventName: widget.eventName),
                  ),
                );
              },
              child: Text(
                "Pay Now with $selectedMethod",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _counterButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.blue),
      ),
    );
  }

  Widget _paymentOption(String title, String value, IconData icon) {
    bool isMe = selectedMethod == value;
    return GestureDetector(
      onTap: () => setState(() => selectedMethod = value),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isMe ? Colors.blue : Colors.grey[200]!),
          color: isMe ? Colors.blue.withOpacity(0.05) : Colors.white,
        ),
        child: Row(
          children: [
            Icon(icon, color: isMe ? Colors.blue : Colors.grey),
            const SizedBox(width: 15),
            Text(
              title,
              style: TextStyle(
                fontWeight: isMe ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const Spacer(),
            if (isMe) const Icon(Icons.check_circle, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
