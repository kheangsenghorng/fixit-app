import 'package:flutter/material.dart';
import 'package:fixit/widgets/main_bottom_nav.dart'; // 1. Added Import
import 'widgets/filter_sheet.dart';
import 'widgets/provider_card.dart';

class SearchResultScreen extends StatelessWidget {
  // Added these parameters to keep the navigation state synced
  final int currentIndex;
  final Function(int)? onNavTap;

  const SearchResultScreen({
    super.key,
    this.currentIndex = 0, // Default to Home index
    this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;


    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Electrician",
              hintStyle: const TextStyle(fontSize: 14),
              prefixIcon: const Icon(Icons.search, size: 20),
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.tune, size: 20),
                onPressed: () => _showFilterSheet(context),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "35 results",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 15),
            _buildFeaturedServiceCard(context),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Electrician Providers",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("View all", style: TextStyle(color: Color(0xFF0056D2))),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 245,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return const ProviderCard(
                  name: "Jackson",
                  job: "Electrician",
                  rating: "4.9",
                );
              },
            ),
          ],
        ),
      ),

      // 2. Added the MainBottomNav here
      bottomNavigationBar: MainBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          if (onNavTap != null) {
            onNavTap!(index);
          }
        },
      ),
    );
  }

  // --- UI Helper Methods ---

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterSheet(),
    );
  }

  Widget _buildFeaturedServiceCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Electrician service",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Icon(Icons.electrical_services, size: 50, color: Colors.blue[800]),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.blue, size: 18),
              const Text(" 4.8 (76)", style: TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              const Text(
                "\$20/hour",
                style: TextStyle(
                  color: Color(0xFF0056D2),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(Icons.alarm, color: Colors.grey, size: 18),
              const SizedBox(width: 8),
              _buildTimeChip("7:00AM"),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text("To", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
              _buildTimeChip("10:00PM"),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Get This Service"),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTimeChip(String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.05),
        border: Border.all(color: Colors.blue.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        time,
        style: const TextStyle(
          color: Color(0xFF0056D2),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}