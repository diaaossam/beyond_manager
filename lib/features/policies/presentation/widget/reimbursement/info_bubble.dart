import 'package:flutter/material.dart';

class InfoBubble extends StatelessWidget {
  final String title;
  final String message;
  final Color accentColor;
  final Color backgroundColor;
  final double borderRadius;
  final double leftBarWidth;
  final EdgeInsetsGeometry padding;
  final double elevation;

  const InfoBubble({
    Key? key,
    this.title = 'Status Info:',
    required this.message,
    this.accentColor = const Color(0xFF0A84FF), // الأزرق في الشريط
    this.backgroundColor = const Color(0xFFF3F8FF), // خلفية فاتحة
    this.borderRadius = 12.0,
    this.leftBarWidth = 6.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
    this.elevation = 1.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 100),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: leftBarWidth,
            height: 36,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                ),

                const SizedBox(height: 4),

                // Message
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Colors.black87,
                        height: 1.25,
                      ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // لو عايز أيقونة صغيرة على اليمين (اختياري) ممكن تفعلها
          // SizedBox(width: 8),
          // Icon(Icons.info_outline, size: 18, color: accentColor),
        ],
      ),
    );
  }
}
