import 'package:animate_do/animate_do.dart';
import 'package:eye_muslim/utils/base_extensions.dart';
import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final String icon;
  final String title;
  final double? width;

  const NavBarItem({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.icon,
    required this.title,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? context.colorPalette.green1C9 : context.colorPalette.grey81;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if(isSelected)
                FadeInDown(
                  from: 10,
                  animate: true,
                  curve: Curves.linear,
                  duration: const Duration(milliseconds: 400),
                  child: Divider(
                    color: context.colorPalette.green37B,
                    endIndent: 10,
                    thickness: 2,
                    indent: 10,
                  ),
                ) 
                else const Divider(
                    color: Colors.transparent,
                    endIndent: 10,
                    thickness: 2,
                    indent: 10,
                  ),
                Expanded(
                  child: Image.asset(
                    icon,
                    // height: 25,
                    width: width,
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: context.textTheme.labelSmall!.copyWith(
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
