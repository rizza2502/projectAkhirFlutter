import 'package:flutter/material.dart';

class PartnerCard extends StatelessWidget {
  final String image;
  final VoidCallback? onTap;

  const PartnerCard({
    required this.image, 
    this.onTap, 
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        width: MediaQuery.of(context).size.width / 4.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Padding(
          padding:const EdgeInsets.all(12),
          child: Image.asset(
            image, 
            fit: BoxFit.contain),
        ),
      ),
    );
  }
}
