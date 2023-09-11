import 'package:flutter/material.dart';
import 'package:flutter_application_assignmnet/Features/presenter/Uis/Widgets/Profiles/CardWidgets/singleprofile_widget.dart';
import 'package:flutter_application_assignmnet/const.dart';

class ProfilesWidget extends StatefulWidget {
  const ProfilesWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfilesWidgetState createState() => _ProfilesWidgetState();
}

class _ProfilesWidgetState extends State<ProfilesWidget> {
  final List<int> _itemIndices = [
    0,
    1,
    2,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final allDismissed = _itemIndices.isEmpty;

    return Expanded(
      child: allDismissed
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    loadingTextTitle,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: size.width * .05),
                  ),
                  SizedBox(height: size.width * .008),
                  Text(
                    loadingTextSubTitile,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: size.width * .04,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _itemIndices.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                final itemIndex = _itemIndices[index];

                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_) {
                    _dismissCard(itemIndex);
                  },
                  direction: DismissDirection.endToStart,
                  // Customize the background color for swiping down
                  child: Dismissible(
                    key: UniqueKey(),
                    onDismissed: (_) {
                      _dismissCard(itemIndex);
                    },
                    direction: DismissDirection.down,

                    // Customize the background color for swiping down
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: size.width * .05,
                        vertical: size.width * .00001,
                      ),
                      width: size.width * .82,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white.withOpacity(.5),
                          width: 1,
                        ),
                      ),
                      child: const SingleProfileWidget(),
                    ),
                  ),
                );
              }),
            ),
    );
  }

  void _dismissCard(int itemIndex) {
    setState(() {
      _itemIndices.remove(itemIndex);
    });
  }
}
