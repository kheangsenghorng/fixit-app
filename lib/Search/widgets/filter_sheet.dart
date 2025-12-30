import 'package:flutter/material.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  double _ratingValue = 3.0;
  RangeValues _priceRange = const RangeValues(10, 500);

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
              const Text("Search Filter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSectionTitle("Service Type"),
                Wrap(
                  spacing: 10,
                  children: [
                    _choiceChip("ALL", true),
                    _choiceChip("wiring", false),
                    _choiceChip("repairs", false),
                    _choiceChip("emergency", false),
                  ],
                ),

                _buildSectionTitle("Availability"),
                Row(
                  children: [
                    Expanded(child: _selectableCard("Electrician Urgently", Icons.check_circle_outline, false)),
                    const SizedBox(width: 10),
                    Expanded(child: _selectableCard("specific times", Icons.check_circle, true)),
                  ],
                ),

                _buildSectionTitle("Rating"),
                Slider(
                  value: _ratingValue,
                  max: 5,
                  divisions: 5,
                  label: _ratingValue.round().toString(),
                  onChanged: (val) => setState(() => _ratingValue = val),
                ),

                _buildSectionTitle("Pricing"),
                RangeSlider(
                  values: _priceRange,
                  max: 500,
                  divisions: 50,
                  labels: RangeLabels("\$${_priceRange.start.round()}", "\$${_priceRange.end.round()}"),
                  onChanged: (val) => setState(() => _priceRange = val),
                ),

                _buildSectionTitle("Experience Level"),
                Wrap(
                  spacing: 8,
                  children: ["ALL", "A year", "2 year", "3 year", "5+ year"].map((e) => _choiceChip(e, e == "ALL")).toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Apply Filter"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
    );
  }

  Widget _choiceChip(String label, bool isSelected) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (val) {},
      selectedColor: const Color(0xFF0056D2),
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.blue),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: Colors.blue.shade100)),
    );
  }

  Widget _selectableCard(String label, IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF0056D2) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: isSelected ? Colors.white : Colors.blue),
          const SizedBox(width: 5),
          Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.blue, fontSize: 12)),
        ],
      ),
    );
  }
}