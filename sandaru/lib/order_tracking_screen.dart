import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xFFFFA726),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Delivery Status",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  _buildStatusItem(
                    imagePath: 'assets/order.png',
                    title: "Order Taken",
                    isCompleted: true,
                  ),
                  _buildStatusItem(
                    imagePath: 'assets/prepared.png',
                    title: "Order Is Being Prepared",
                    isCompleted: true,
                  ),
                  _buildStatusItem(
                    imagePath: 'assets/diliver.png',
                    title: "Order Is Being Delivered",
                    subtitle: "Your delivery agent is coming",
                    isInProgress: true,
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/map_sample.png',
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildStatusItem(
                    imagePath: 'assets/order_received.png',
                    title: "Order Received",
                    isCompleted: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem({
    required String imagePath,
    required String title,
    String? subtitle,
    bool isCompleted = false,
    bool isInProgress = false,
  }) {
    Color borderColor;
    Widget trailing;

    if (isCompleted) {
      borderColor = Colors.green;
      trailing = const Icon(Icons.check_circle, color: Colors.green);
    } else if (isInProgress) {
      borderColor = Colors.orange;
      trailing = const Icon(Icons.phone_in_talk_rounded, color: Colors.orange);
    } else {
      borderColor = Colors.grey;
      trailing = const Icon(Icons.radio_button_unchecked, color: Colors.grey);
    }

    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: borderColor.withOpacity(0.5),
                  width: 1.5,
                ),
              ),
              child: Image.asset(
                imagePath,
                height: 32,
                width: 32,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                ],
              ),
            ),
            trailing,
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
