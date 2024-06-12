import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';

class AppExpandableWidget extends StatelessWidget {
  const AppExpandableWidget(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Expandable(
        collapsed: ExpandableButton(
          theme: const ExpandableThemeData(useInkWell: false),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: getTextBold(
                        colors: ColorConstants.cDarkTextColor, size: 18.0),
                  ),
                ),
                const SizedBox(width: 25),
                const Icon(
                  Icons.add,
                  size: 25,
                ),
              ],
            ),
          ),
        ),
        expanded: ExpandableButton(
          theme: const ExpandableThemeData(useInkWell: false),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: getTextBold(
                            colors: ColorConstants.cDarkTextColor, size: 18.0),
                      ),
                    ),
                    const SizedBox(width: 25),
                    const Icon(
                      Icons.remove,
                      size: 25,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  subtitle,
                  textAlign: TextAlign.start,
                  style: getTextMedium(
                      colors: ColorConstants.cPrimaryTextColor, size: 15.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
