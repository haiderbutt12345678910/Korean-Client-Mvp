import 'package:flutter/material.dart';

class ContainersWidget extends StatelessWidget {
  final bool isTags;
  final bool isAppBarWidget;
  final bool isSeletcted;
  final String text;
  const ContainersWidget(
      {super.key,
      required this.isTags,
      required this.text,
      required this.isSeletcted,
      required this.isAppBarWidget});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return !isTags
        ? Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .02, vertical: size.width * .02),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(.1)),
                borderRadius: BorderRadius.circular(15),
                color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  size: isAppBarWidget ? size.width * .026 : size.width * .027,
                  color: isAppBarWidget ? Colors.pinkAccent : Colors.grey,
                ),
                SizedBox(
                  width: size.width * .006,
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            ))
        : Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .02, vertical: size.width * .02),
            decoration: BoxDecoration(
                border: Border.all(
                    color: isSeletcted
                        ? Colors.pinkAccent
                        : const Color(0xFF3A3A3A)),
                borderRadius: BorderRadius.circular(15),
                color: isSeletcted
                    ? Colors.pinkAccent.withOpacity(.2)
                    : const Color(0xFF1A1A1A)),
            child: Text(text,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: isSeletcted ? Colors.pink : Colors.white)));
  }
}
