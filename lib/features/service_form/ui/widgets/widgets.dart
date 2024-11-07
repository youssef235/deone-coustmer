import 'package:wasq/theme/app_colors.dart';
import 'package:flutter/material.dart';

Widget serviceCard() {
  return Container(
      width: 90,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: const Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Icon(
            Icons.settings_accessibility,
            color: Colors.black,
            size: 40,
          ),
          Text("تركيب", style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ));
}

class whiteButtonTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final small;
  final bool? iconLeft;
  final BuildContext context;
  final Function()? pressed;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  const whiteButtonTile(
      {this.iconLeft,
      this.color,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.icon,
      required this.title,
      required this.context,
      required this.pressed,
      super.key,
      this.small});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.small != null
          ? MediaQuery.of(context).size.width * 0.863 / 2
          : MediaQuery.of(context).size.width * 0.893,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
          color: color == null ? AppColors.white : color,
          borderRadius: BorderRadius.circular(8),
          // boxShadow: [
          //   BoxShadow(
          //     color: const Color.fromARGB(255, 206, 206, 206),
          //     blurRadius: 5,
          //     spreadRadius: 1,
          //   )
          // ]
          border: Border.all(color: Color(0xffD5D5D5), width: 1)),
      child: TextButton(
        onPressed: pressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ignore: unnecessary_const
            Text(
              this.title,
              style: TextStyle(
                letterSpacing: 0,
                fontSize: this.fontSize ?? 16,
                color: textColor != null
                    ? textColor
                    : color == AppColors.primaryColor ||
                            color == AppColors.blackGrey
                        ? AppColors.white
                        : Color.fromARGB(255, 0, 0, 0),
                fontWeight:
                    this.fontWeight != null ? FontWeight.w700 : this.fontWeight,
              ),
            ),
            Icon(
              size: 30,
              this.icon,
              color: color == AppColors.primaryColor ||
                      color == AppColors.blackGrey ||
                      color == AppColors.green6E ||
                      color == AppColors.red
                  ? Colors.white
                  : AppColors.primaryColor, // Icon color
            ),
          ],
        ),
      ),
    );
  }
}

Widget DateSelector() {
  return AlertDialog(
    content: Center(
      child: Text("Date"),
    ),
  );
}

Widget videoThumbnailCard(image, deleteAction) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      children: [
        Container(
          width: 100, // Customize the width of the container as needed
          height: 100, // Customize the height of the container as needed
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                20), // Adjust the radius as needed for curved edges
            border: Border.all(
                color: AppColors.primaryColor,
                width: 2), // Customize border properties
            image: DecorationImage(
              image: image != null
                  ? image
                  : const AssetImage("res/assets/logo_rec.png")
                      as ImageProvider,
              fit: BoxFit.cover, // You can customize the fit property
            ),
          ),
        ),
        Positioned(
          right: -10,
          top: -10,
          child: IconButton(
            icon: const Icon(
              Icons.cancel,
              color: Color.fromARGB(255, 10, 10, 10),
            ),
            onPressed: deleteAction,
          ),
        ),
      ],
    ),
  );
}
