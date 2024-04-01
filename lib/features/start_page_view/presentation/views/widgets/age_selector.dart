import 'package:flutter/material.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/styles.dart';

class AgeSelect extends StatefulWidget {
  const AgeSelect({super.key});

  @override
  _AgeSelectState createState() => _AgeSelectState();
}

class _AgeSelectState extends State<AgeSelect> {
  late int selectedYear;

  @override
  void initState() {
    super.initState();
    selectedYear = 0; // Initialize the selected year
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 280,
        child: ListView.builder(
          itemCount: 70,
          itemBuilder: (context, index) {
            final year = index + 1;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedYear = year;
                });
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: selectedYear == year ?  kSecondaryColor: Colors.transparent,
                ),
                child: Text(
                  "$year Year",
                  style: Styles.textStyle20(context).copyWith(
                    color: selectedYear == year ? Colors.white : Colors.white60,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
