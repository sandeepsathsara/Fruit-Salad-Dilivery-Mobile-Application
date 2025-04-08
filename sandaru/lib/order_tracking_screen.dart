import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                color: const Color(0xFFFFA726),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Delivery Status",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
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
                    subtitle: "Your delivery agent is on the way",
                    isInProgress: true,
                  ),
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/map_sample.png',
                      height: 200,
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
      trailing = const Icon(Icons.check_circle, color: Colors.green, size: 24);
    } else if (isInProgress) {
      borderColor = Colors.orange;
      trailing = const Icon(
        Icons.phone_in_talk_rounded,
        color: Colors.orange,
        size: 24,
      );
    } else {
      borderColor = Colors.grey;
      trailing = const Icon(
        Icons.radio_button_unchecked,
        color: Colors.grey,
        size: 24,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: borderColor.withOpacity(0.4),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Image.asset(
              imagePath,
              height: 36,
              width: 36,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
