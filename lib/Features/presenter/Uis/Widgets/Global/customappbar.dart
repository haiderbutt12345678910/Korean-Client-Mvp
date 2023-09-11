import 'package:flutter/material.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Uis/Widgets/Global/containers.dart';
import 'package:flutter_application_assignmnet/const.dart';
import 'package:intl/intl.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: size.width * .03),
      width: size.width,
      height: size.width * .2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.location_on,
            color: Colors.white,
          ),
          RichText(
            text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.w700),
              children: generateTextSpans(appBarText, context),
            ),
          ),
          SizedBox(
            width: size.width * .01,
          ),
          ContainersWidget(
            isAppBarWidget: true,
            isTags: false,
            isSeletcted: false,
            text: formatNumberWithCommas(3456789.toString()),
          ),
          Stack(
            children: [
              Image.asset("Assets/Images/notification.png"),
              Positioned(
                top: 1,
                right: 3,
                child: Container(
                  width:
                      size.width * .015, // Adjust the size of the dot as needed
                  height: size.width * .015,
                  decoration: const BoxDecoration(
                    color: Colors.pinkAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<TextSpan> generateTextSpans(String text, BuildContext buildContext) {
    final int length = text.length;
    final List<TextSpan> textSpans = [];

    textSpans.add(
      TextSpan(
        text: text.substring(0, 5),
        style: Theme.of(buildContext)
            .textTheme
            .displayMedium!
            .copyWith(fontWeight: FontWeight.w700),
      ),
    );
    textSpans.add(
      TextSpan(
        text: text.substring(5, length - 5),
        style: Theme.of(buildContext)
            .textTheme
            .displayMedium!
            .copyWith(fontWeight: FontWeight.w300),
      ),
    );
    textSpans.add(
      TextSpan(
          text: text.substring(length - 5),
          style: Theme.of(buildContext)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.w700)),
    );

    return textSpans;
  }

  String formatNumberWithCommas(String numberString) {
    final numberFormat = NumberFormat('#,###');
    final number = int.parse(numberString);
    return numberFormat.format(number);
  }
}
