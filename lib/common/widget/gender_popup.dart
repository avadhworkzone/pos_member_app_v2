import 'package:flutter/material.dart';
import 'package:member_app_v2/common/alert/app_alert.dart';
import 'package:member_app_v2/common/message_constants.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/utils/network_utils.dart';

/* late GetGendersResponse mGetGendersResponse;

Future<void> fetchGetGendersList(
    BuildContext context, GetGendersBloc mGetGendersBloc) async {
  await NetworkUtils().checkInternetConnection().then((isInternetAvailable) {
    if (isInternetAvailable) {
      mGetGendersBloc.add(const GetGendersClickEvent());
    } else {
      AppAlert.showSnackBar(context, MessageConstants.noInternetConnection);
    }
  });
}

/// get Genders id
Future<String> showPopupGendersItem(TextEditingController textEditingController,
    GlobalKey keyRaces, BuildContext context) async {
  var sValue;
  RenderBox box = keyRaces.currentContext?.findRenderObject() as RenderBox;
  Offset offset = box.localToGlobal(Offset.zero);
  List<PopupMenuEntry> itemsPopupMenuEntry = [];
  for (int i = 0; i < mGetGendersResponse.genders!.length; i++) {
    itemsPopupMenuEntry.add(PopupMenuItem<String>(
      value: mGetGendersResponse.genders![i].id.toString(),
      child: Text(mGetGendersResponse.genders![i].name.toString()),
      onTap: () {
        textEditingController.text =
            mGetGendersResponse.genders![i].name.toString();
      },
    ));
  }
  // double left = offset.dx;
  double top = offset.dy;
  sValue = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          SizeConstants.width / 2 + SizeConstants.s_10,
          top + SizeConstants.s_50,
          SizeConstants.width / 2 + SizeConstants.s_10,
          0),
      items: itemsPopupMenuEntry,
      elevation: 8.0,
      constraints: BoxConstraints(maxHeight: SizeConstants.width / 3));
  if (sValue.toString().toLowerCase() != "null") {
    return sValue.toString();
  } else {
    return "";
  }
} */
