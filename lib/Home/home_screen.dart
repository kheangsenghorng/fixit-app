import 'package:fixit/Home/widgets/category_card.dart';
import 'package:fixit/Home/widgets/promo_banner.dart';
import 'package:fixit/Home/widgets/provider_card.dart';
import 'package:fixit/Home/widgets/section_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onSearchTap;
  const HomeScreen({
    super.key,
    required this.onSearchTap,
  });

  // REMOVED: BuildContext get context => null; (This causes crashes)

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Pass the context to the helper method
              _buildAppBar(context),
              const SizedBox(height: 20),
              PromoBanner(
                onSearchTap: onSearchTap, // ✅ delegate upward
              ),
              const SizedBox(height: 50),
              SectionHeader(title: "Popular Services", onTap: () {}),
              const SizedBox(height: 15),
              _buildCategoryList(),
              const SizedBox(height: 20),
              SectionHeader(title: "Service Providers", onTap: () {}),
              const SizedBox(height: 15),
              // 1. Wrap in a SizedBox to define the height of the cards
              SizedBox(
                height: 240, // Adjust this height based on your ProviderCard content
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // Add some padding so the first card isn't touching the edge
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  children: const [
                    // 2. Wrap each card in a SizedBox to give it a fixed width
                    SizedBox(
                      width: 180,
                      child: ProviderCard(name: "Maskot Kota", job: "Plumber"),
                    ),
                    SizedBox(width: 15), // Space between cards
                    SizedBox(
                      width: 180,
                      child: ProviderCard(name: "Shams Jan", job: "Electrician"),
                    ),
                    SizedBox(width: 15),
                    SizedBox(
                      width: 180,
                      child: ProviderCard(name: "John Doe", job: "Carpenter"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Accept context as a parameter here
  Widget _buildAppBar(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/logo/fixit_logo_small.png',
          width: 32,
          height: 32,
          color: theme.colorScheme.primary,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.phone_outlined)
        ),
      ],
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CategoryCard(title: "Plumbing", icon: Icons.plumbing),
          CategoryCard(title: "Electric work", icon: Icons.electric_bolt),
          CategoryCard(title: "Solar", icon: Icons.wb_sunny_outlined),
        ],
      ),
    );
  }
}