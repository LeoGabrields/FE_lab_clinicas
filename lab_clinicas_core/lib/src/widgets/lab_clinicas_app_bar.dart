import 'package:flutter/material.dart';

class LabClinicasAppBar extends AppBar {
  LabClinicasAppBar({super.key, super.actions})
      : super(
          toolbarHeight: 72,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            padding: const EdgeInsets.only(left: 74),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.40),
                  offset: const Offset(0, 1),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Image.asset('assets/images/logo_horizontal.png'),
          ),
        );
}
