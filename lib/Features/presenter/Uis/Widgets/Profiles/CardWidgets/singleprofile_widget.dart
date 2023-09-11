import 'package:flutter/material.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Uis/Widgets/Global/containers.dart';
import 'package:flutter_application_assignmnet/const.dart';
import 'package:intl/intl.dart';

class SingleProfileWidget extends StatefulWidget {
  const SingleProfileWidget({super.key});

  @override
  State<SingleProfileWidget> createState() => _SingleProfileWidgetState();
}

class _SingleProfileWidgetState extends State<SingleProfileWidget> {
  final PageController pageController = PageController(initialPage: 0);
  int pageIndex = 0;

  bool isScrollEnabled = true;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      clipBehavior: Clip.antiAlias,
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F07%2F33%2Fba%2F0733ba760b29378474dea0fdbcb97107.png&f=1&nofb=1&ipt=5b129d16030bdf5e8046d02cf10ee8546e9fa2838ba0c6e068d8385763d10d0f&ipo=images",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * .02,
                        vertical: size.width * .01,
                      ),
                      color: Colors.transparent,
                      width: double.infinity,
                      height: size.width * .2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (int i = 0; i < 4; i++)
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 3,
                                      decoration: BoxDecoration(
                                          color: index ==
                                                  i //change the color based on current index
                                              ? Colors.pinkAccent
                                              : Colors.black.withOpacity(.7),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * .02,
                                  )
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: size.width * .3,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.topRight,
                                  color: Colors.transparent,
                                  height: double.infinity,
                                  child: InkWell(
                                    onTap: () {
                                      //move to next image
                                      scrollPage("P");
                                    },
                                    child: SizedBox(
                                      height: double.infinity,
                                      width: size.width * .3,
                                    ),
                                  ))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.topRight,
                                  color: Colors.transparent,
                                  height: double.infinity,
                                  child: InkWell(
                                    onTap: () {
                                      //move to next image
                                      scrollPage("N");
                                    },
                                    child: SizedBox(
                                      height: double.infinity,
                                      width: size.width * .3,
                                    ),
                                  )))
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .05, vertical: size.width * .1),
                  color: Colors.black.withOpacity(.08),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ContainersWidget(
                                  isTags: false,
                                  text: formatNumberWithCommas("20001"),
                                  isSeletcted: false,
                                  isAppBarWidget: false),
                              SizedBox(
                                height: size.height * .008,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * .062),
                                  children: [
                                    const TextSpan(
                                      text: name,
                                    ),
                                    TextSpan(
                                        text: ' 26',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                                fontSize: size.width * .055)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * .003,
                              ),
                              profileUnique(index, size),
                            ],
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: index == 2
                                        ? size.width * .48
                                        : size.width * .15),
                                alignment: Alignment.bottomRight,
                                child: Image.asset("Assets/Images/like.png"),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: size.width * .05,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Image.asset("Assets/Images/downarrow.png"),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void scrollPage(String id) {
    if (id == "N") {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget profileUnique(int index, var size) {
    if (index == 0) {
      return Padding(
        padding: EdgeInsets.only(right: size.width * .04),
        child: RichText(
          textAlign: TextAlign.end,
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.white.withOpacity(.7)),
            children: [
              const TextSpan(
                text: location,
              ),
              TextSpan(
                  text: " .   2km$awayFrom",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.white.withOpacity(.7))),
            ],
          ),
        ),
      );
    } else if (index == 1) {
      return SizedBox(
        width: size.width * .53,
        child: Text(
          descriition,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Colors.white.withOpacity(.8),
              fontSize: size.width * .034,
              fontWeight: FontWeight.w100),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(top: size.width * .02),
        width: size.width * .5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: size.width * .01),
              child: ContainersWidget(
                  isTags: true,
                  text: tagsList[0],
                  isSeletcted: true,
                  isAppBarWidget: false),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: size.width * .01),
              child: Row(
                children: [
                  ContainersWidget(
                      isTags: true,
                      text: tagsList[1],
                      isSeletcted: true,
                      isAppBarWidget: false),
                  SizedBox(
                    width: size.width * .04,
                  ),
                  ContainersWidget(
                      isTags: true,
                      text: tagsList[2],
                      isSeletcted: false,
                      isAppBarWidget: false),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: size.width * .01),
              child: ContainersWidget(
                  isTags: true,
                  text: tagsList[3],
                  isSeletcted: false,
                  isAppBarWidget: false),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: size.width * .01),
              child: Row(
                children: [
                  ContainersWidget(
                      isTags: true,
                      text: tagsList[4],
                      isSeletcted: true,
                      isAppBarWidget: false),
                  SizedBox(
                    width: size.width * .04,
                  ),
                  ContainersWidget(
                      isTags: true,
                      text: tagsList[5],
                      isSeletcted: false,
                      isAppBarWidget: false),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  String formatNumberWithCommas(String numberString) {
    final numberFormat = NumberFormat('#,###');
    final number = int.parse(numberString);
    return numberFormat.format(number);
  }
}
