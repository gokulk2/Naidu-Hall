import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/observers/route_observer.dart';
import 'package:intl/intl.dart';
import 'package:mobileapp/constant/variable_constant.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../model/response/api_checker.dart';
import '../model/response/api_response.dart';
import '../model/response/grid.dart';
import '../model/response/responsive.dart';
import 'color_constants.dart';
import 'extensions.dart';

String dateTimeFormat = "MM/dd/yyyy HH:mm";
String dateFormat = "MM/dd/yyyy";
String dobMask = '00/00/0000';
String timeMask = '00:00';
String mobileNumber = "000-000-0000";
String inMobileNumber = "+(00) 000-000-0000";
String usMobileNumber = "+(0) 000-000-0000";

bool checkAPIResponse(ApiResponse apiResponse) {
  if (apiResponse.response != null &&
      (apiResponse.response!.statusCode == 200 ||
          apiResponse.response!.statusCode == 201)) {
    return true;
  } else {
    return false;
  }
}

rapidSoftPrint(e) {
  if (kDebugMode) {
    print(e);
  }
}

width() {
  double width =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
  return width;
}

height() {
  double width =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
  return width;
}

String convertDateTimeString(var dateTimeString) {
  String selectedDate = "";
  if (isNotNullOrEmpty(dateTimeString)) {
    DateFormat newDateFormat = DateFormat(dateTimeFormat);
    DateTime dateTime =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(dateTimeString);
    selectedDate = newDateFormat.format(dateTime);
  }
  return selectedDate;
}

sizedBox5() {
  return const SizedBox(
    width: 5,
    height: 5,
  );
}

sizedBox10() {
  return const SizedBox(
    width: 10,
    height: 10,
  );
}

sizedBox20() {
  return const SizedBox(
    width: 20,
    height: 20,
  );
}

nonVisibility() {
  return Container();
}

// class AITitle extends StatelessWidget {
//   const AITitle({
//     super.key,
//     required this.text,
//     this.showBackArrow = true,
//   });
//
//   final String text;
//   final bool showBackArrow;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         BackArrow(
//           showBackArrow: showBackArrow,
//         ),
//         Text(
//           text,
//           style: const TextStyle(
//               fontWeight: FontWeight.w700, fontSize: 18, fontFamily: "Arial"),
//           overflow: TextOverflow.ellipsis,
//         ),
//       ],
//     );
//   }
// }

// class BackArrow extends GetView<MasterController> {
//   const BackArrow({super.key, required this.showBackArrow});
//
//   final bool showBackArrow;
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<MasterController>(builder: (context) {
//       return Visibility(
//         visible: showBackArrow,
//         child: AIToolTip(
//           message: 'Back',
//           child: IconButton(
//               constraints: const BoxConstraints(),
//               padding: EdgeInsets.zero,
//               onPressed: pageRouteCollections.isEmpty
//                   ? null
//                   : () {
//                 routeBack();
//               },
//               icon: Icon(
//                 Icons.keyboard_arrow_left,
//                 color: pageRouteCollections.isEmpty ? Colors.grey : mainColor,
//                 size: 25,
//               )),
//         ),
//       );
//     });
//   }
// }

class PMDButton extends StatelessWidget {
  final String closeButtonName;
  final Function(BuildContext) closeEvent;

  const PMDButton({
    Key? key,
    required this.closeButtonName,
    required this.closeEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () => closeEvent(context),
        child: Card(
          elevation: 5,
          color: pmdButtonColor,
          child: SizedBox(
            width: 150,
            height: 40,
            child: Center(
              child: ButtonText(buttonText: closeButtonName),
            ),
          ),
        ),
      ),
    );
  }
}

// class PMDButton2 extends StatelessWidget {
//   final String closeButtonName;
//   final Function(BuildContext) closeEvent;
//
//   const PMDButton2({
//     Key? key,
//     required this.closeButtonName,
//     required this.closeEvent,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: InkWell(
//         onTap: () => closeEvent(context),
//         child: Card(
//           elevation: 5,
//           color: pmdColor,
//           child: SizedBox(
//             width: 250,
//             height: 40,
//             child: Center(
//               child: ButtonText1(buttonText:closeButtonName),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// Using Material UI Design
class PMDButton2 extends StatelessWidget {
  final String closeButtonName;
  final Function(BuildContext) closeEvent;

  const PMDButton2({
    Key? key,
    required this.closeButtonName,
    required this.closeEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => closeEvent(context),
          borderRadius: BorderRadius.circular(8), // Adjust as needed
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), // Adjust as needed
              color: pmdColor, // Change color as needed
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: SizedBox(
              width: 250,
              height: 40,
              child: Center(
                child: Text(
                  closeButtonName,
                  style: const TextStyle(
                    color: Colors.white, // Change text color as needed
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AICard extends StatelessWidget {
  const AICard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: whiteColor,
      margin: const EdgeInsets.only(top: 20),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}

class RSFieldResponsive extends StatelessWidget {
  const RSFieldResponsive({
    super.key,
    required this.renderingWidgetList,
    this.callBackBtn,
  });

  final List<FieldResponsive> renderingWidgetList;
  final Widget? callBackBtn;

  @override
  Widget build(BuildContext context) {
    List<FieldResponsive> widgets =
        renderingWidgetList.where((element) => !element.isDeleted).toList();
    return FocusTraversalGroup(
      policy: OrderedTraversalPolicy(),
      child: Column(
        children: [
          ResponsiveGridRow(
            children: List.generate(
              widgets.length,
              (index) => ResponsiveGridCol(
                lg: widgets[index].fieldWidth,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: widgets[index].widget!,
                ),
              ),
            ),
          ),
          if (callBackBtn != null) ...[
            sizedBox20(),
            callBackBtn!,
          ],
        ],
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  final String buttonText;

  const ButtonText({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonText,
      style: TextStyle(
        color: blackColor,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}

class ButtonText1 extends StatelessWidget {
  final String buttonText;

  const ButtonText1({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonText,
      style: TextStyle(
        color: whiteColor,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}

class PMDButton1 extends StatelessWidget {
  final bool saveEnabled;
  final Function(BuildContext) saveEvent;
  final Function(BuildContext) cancelEvent;
  final Function(BuildContext) operatorEvent;
  final String saveButtonName;
  final String cancelButtonName;
  final String operatorButtonName;
  final bool saveButtonVisible;

  const PMDButton1({
    Key? key,
    required this.saveEnabled,
    required this.saveEvent,
    required this.cancelEvent,
    required this.operatorEvent,
    this.cancelButtonName = 'Cancel',
    this.operatorButtonName = 'Operation',
    this.saveButtonName = 'Save',
    this.saveButtonVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            cancelEvent(context);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.grey, // Change color to your desired color
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: Colors.blueAccent), // Border color
            ),
          ),
          child: Text(
            cancelButtonName,
            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 20), // Use const SizedBox for better performance
        ElevatedButton(
          onPressed: () {
            operatorEvent(context);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.grey, // Change color to your desired color
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: Colors.blueAccent), // Border color
            ),
          ),
          child: Text(
            operatorButtonName,
            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 20), // Use const SizedBox for better performance
        Visibility(
          visible: saveButtonVisible,
          child: ElevatedButton(
            onPressed: saveEnabled ? () => saveEvent(context) : null,
            style: ElevatedButton.styleFrom(
              primary: saveEnabled ? Colors.grey : Colors.blueGrey,
              // Change color based on saveEnabled
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.blueAccent), // Border color
              ),
            ),
            child: saveEnabled
                ? Text(
              saveButtonName,
              style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
            )
                : const CircularProgressIndicator(
              backgroundColor: Colors.white, // Change loader color
            ),
          ),
        ),
      ],
    );
  }
}

class ScanButton extends StatelessWidget {
  final bool saveEnabled;
  final Function saveEvent;
  final String saveButtonName;
  final bool saveButtonVisible;

  const ScanButton({
    super.key,
    required this.saveEnabled,
    required this.saveEvent,
    this.saveButtonName = 'Save',
    this.saveButtonVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Visibility(
          visible: saveButtonVisible,
          child: InkWell(
            onTap: !saveEnabled
                ? null
                : () {
              saveEvent(context);
            },
            child: Card(
              color: Colors.white38,
              child: SizedBox(
                width: 300,
                height: 40,
                child: Center(
                  child: !saveEnabled
                      ? ApiChecker().buttonLoader()
                      : ButtonText(
                    buttonText: saveButtonName,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

scrollBarThemeData() {
  return ThemeData(
    tabBarTheme: TabBarTheme(
        labelColor: Colors.pink[800],
        labelStyle: TextStyle(color: Colors.pink[800]), // color for text
        indicator: UnderlineTabIndicator(
            // color for indicator (underline)
            borderSide: BorderSide(color: mainColor))),
    scrollbarTheme: ScrollbarThemeData(
      interactive: true,
      isAlwaysShown: true,
      showTrackOnHover: true,
      radius: const Radius.circular(10.0),
      thumbColor: MaterialStateProperty.all(mainColor),
      thickness: MaterialStateProperty.all(4.0),
      minThumbLength: 100,
    ),
  );
}

double customGridWidth(double width, double breakPoint) {
  double gridWidth = (width > breakPoint) ? width : breakPoint;
  return gridWidth;
}

class CustomGridView extends StatelessWidget {
  CustomGridView({
    super.key,
    required this.gridDetail,
    required this.modelMapList,
    required this.width,
    required this.height,
    required this.breakPoint,
    this.headerHeight,
    this.bodyHeight,
    this.bodyWidth,
    this.gridScrollController,
    this.pageName,
  });

  final List<GridViewModel> gridDetail;
  final List<Map<String, dynamic>> modelMapList;
  final double width;
  final double height;
  final double breakPoint;
  final double? headerHeight;
  final double? bodyHeight;
  final double? bodyWidth;
  final ScrollController? gridScrollController;
  final String? pageName;
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: scrollBarThemeData(),
      child: Scrollbar(
        controller: gridScrollController ?? scrollController,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: gridScrollController ?? scrollController,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 6),
          child: SizedBox(
            width: customGridWidth(width, breakPoint),
            child: Column(
              children: [
                Row(
                  children: List.generate(
                    gridDetail.length,
                    (index) => gridDetail[index].expanded
                        ? Expanded(
                            child: CustomGridHeader(
                              gridDetailIndex: gridDetail[index],
                              border: !(index != (gridDetail.length - 1)),
                              index: index,
                              headerHeight: 35,
                              width: gridDetail[index].width,
                            ),
                          )
                        : CustomGridHeader(
                            gridDetailIndex: gridDetail[index],
                            border: !(index != (gridDetail.length - 1)),
                            index: index,
                            headerHeight: 35,
                            width: gridDetail[index].width,
                          ),
                  ),
                ),
                SelectionArea(
                  child: SizedBox(
                    //height: height,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Column(
                            children: List.generate(
                              modelMapList.length,
                              (gridIndex) => Container(
                                // color: gridIndex.isEven
                                //     ? CADSecondaryBGColor
                                //     : CADPrimaryBGColor,
                                color: Colors.grey,
                                child: Row(
                                  children: List.generate(
                                    gridDetail.length,
                                    (index) => gridDetail[index].expanded
                                        ? Expanded(
                                            child: CustomGridBody(
                                              gridDetailIndex:
                                                  gridDetail[index],
                                              modelMap: modelMapList[gridIndex],
                                              border: !(index !=
                                                  (gridDetail.length - 1)),
                                              bodyHeight: bodyHeight ?? 40,
                                              bodyWidth:
                                                  bodyWidth ?? defaultBodyWidth,
                                            ),
                                          )
                                        : CustomGridBody(
                                            gridDetailIndex: gridDetail[index],
                                            modelMap: modelMapList[gridIndex],
                                            border: !(index !=
                                                (gridDetail.length - 1)),
                                            bodyHeight: bodyHeight ?? 40,
                                            bodyWidth:
                                                bodyWidth ?? defaultBodyWidth,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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

class CustomGridHeader extends StatelessWidget {
  final GridViewModel gridDetailIndex;
  final bool border;
  final int index;
  final double headerHeight;
  final double width;

  const CustomGridHeader({
    super.key,
    required this.gridDetailIndex,
    required this.border,
    required this.index,
    required this.headerHeight,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: mainColor,
        border: Border(
          top: BorderSide(width: 0.50, color: mainColor),
          left: BorderSide(width: 0.50, color: mainColor),
          right: BorderSide(width: 0.50, color: mainColor),
          bottom: BorderSide(width: 0.50, color: mainColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: (gridDetailIndex.sortColumnName != null &&
                gridDetailIndex.sortColumnName!.isNotEmpty)
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GridHeaderText(headerText: gridDetailIndex.title),
          ),
        ],
      ),
    );
  }
}

class GridHeaderText extends StatelessWidget {
  const GridHeaderText({
    Key? key,
    required this.headerText,
  }) : super(key: key);

  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Text(
      headerText,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontFamily: 'Inter'),
    );
  }
}

class GridToggleText extends StatelessWidget {
  const GridToggleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: mainColor,
      ),
    );
  }
}

class CustomGridBody extends StatelessWidget {
  final GridViewModel gridDetailIndex;
  final Map<String, dynamic> modelMap;
  final bool border;
  final double bodyHeight;
  final double bodyWidth;

  const CustomGridBody({
    super.key,
    required this.gridDetailIndex,
    required this.modelMap,
    required this.border,
    required this.bodyHeight,
    required this.bodyWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bodyHeight,
      width: gridDetailIndex.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 0.50, color: mainColor),
          right: BorderSide(width: 0.50, color: mainColor),
          bottom: BorderSide(width: 0.50, color: mainColor),
        ),
        //    : null,
      ),
      child: InkWell(
        onTap: () {
          //controller.navigateToCallNoteDetails(context, modelMap['id']);
          //routeToAddNotePage(controller.callId, modelMap['id']);
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: gridDetailIndex.widget == null
              ? SizedBox(
                  child: GridBodyText(
                    text: toNullableString(
                        modelMap[gridDetailIndex.dataModelName]),
                  ),
                )
              : gridDetailIndex.widget!(modelMap),
        ),
      ),
    );
  }
}

class GridBodyText extends StatelessWidget {
  const GridBodyText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return AIToolTip(
      message: text,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
            color: themeFontColor),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class TilesText extends StatelessWidget {
  const TilesText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final dynamic text;

  @override
  Widget build(BuildContext context) {
    return Text(
      toNullableString(text),
      style: TextStyle(
        color: whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        fontFamily: "Inter",
      ),
      textAlign: TextAlign.center,
    );
  }
}

class TilesCount extends StatelessWidget {
  const TilesCount({
    Key? key,
    required this.text,
  }) : super(key: key);

  final dynamic text;

  @override
  Widget build(BuildContext context) {
    return Text(
      toNullableString(text),
      style: TextStyle(
        color: themePrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: "OpenSans",
      ),
      textAlign: TextAlign.center,
    );
  }
}

// class RSPersonalizationGrid extends StatelessWidget {
//   RSPersonalizationGrid({
//     super.key,
//     required this.gridModelList,
//     required this.height,
//     required this.width,
//     required this.modelMapList,
//     required this.sortingCallBack,
//     required this.sortingIndex,
//     this.headerHeight,
//     this.bodyHeight,
//     this.onHyperLinkPressEvent,
//     this.keyColumnName,
//     this.gridName,
//     this.sortByAsc = false,
//   });

//   final List<RSSortedGridModel> gridModelList;
//   final double height;
//   final double width;
//   final List<Map<String, dynamic>> modelMapList;
//   final Function sortingCallBack;
//   final bool sortByAsc;
//   final int sortingIndex;
//   final double? headerHeight;
//   final double? bodyHeight;
//   final Function? onHyperLinkPressEvent;
//   final String? keyColumnName;
//   final String? gridName;
//   final ScrollController swiftScrollController = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     List<RSSortedGridModel> list = gridModelList
//       ..sort((a, b) => (a.sortOrder).compareTo(b.sortOrder));
//     return Theme(
//       data: scrollBarThemeData(),
//       child: Scrollbar(
//         controller: swiftScrollController,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           controller: swiftScrollController,
//           child: SizedBox(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 5.0),
//                   child: Row(
//                     children: List.generate(
//                       list.length,
//                           (index) => Visibility(
//                         visible: list[index].personalizationModel.isVisible!,
//                         child: Stack(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 InkWell(
//                                   onTap: list[index]
//                                       .personalizationModel
//                                       .isColumnSortable! ==
//                                       true
//                                       ? () {
//                                     int sortOrder = sortByAsc ? 1 : 2;
//                                     sortingCallBack(
//                                         list[index], sortOrder, index);
//                                   }
//                                       : null,
//                                   child: Container(
//                                     height: headerHeight ?? gridHeaderHeight,
//                                     width: (list[index]
//                                         .personalizationModel
//                                         .width! +
//                                         list[index]
//                                             .personalizationModel
//                                             .gridResizing!)
//                                         .toDouble(),
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10),
//                                     decoration: BoxDecoration(
//                                       color: mainColor,
//                                       border: Border(
//                                         top: BorderSide(
//                                             width: 0.50, color: mainColor),
//                                         left: BorderSide(
//                                             width: 0.50, color: mainColor),
//                                         bottom: BorderSide(
//                                             width: 0.50, color: mainColor),
//                                       ),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment: (list[index]
//                                           .personalizationModel
//                                           .isColumnSortable! ==
//                                           true)
//                                           ? MainAxisAlignment.spaceBetween
//                                           : MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                       CrossAxisAlignment.center,
//                                       children: [
//                                         Align(
//                                           alignment: Alignment.centerLeft,
//                                           child: SizedBox(
//                                             child: GridHeaderText(
//                                               headerText: toNullableString(
//                                                   list[index]
//                                                       .personalizationModel
//                                                       .gridDisplayName),
//                                             ),
//                                           ),
//                                         ),
//                                         Visibility(
//                                           visible: list[index]
//                                               .personalizationModel
//                                               .isColumnSortable ??
//                                               false,
//                                           child: SizedBox(
//                                             width: 20,
//                                             child: Icon(
//                                               sortByAsc
//                                                   ? Icons.arrow_drop_down_sharp
//                                                   : Icons.arrow_drop_up_sharp,
//                                               size: 20,
//                                               color: sortingIndex == index
//                                                   ? whiteColor
//                                                   : mainColor,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 MouseRegion(
//                                   cursor: SystemMouseCursors.resizeColumn,
//                                   child: GestureDetector(
//                                     behavior: HitTestBehavior.opaque,
//                                     onHorizontalDragUpdate: (details) {
//                                       gridColumnReSizing(
//                                         offset: details.delta,
//                                         modelMap:
//                                         list[index].personalizationModel,
//                                         defaultWidth: list[index]
//                                             .personalizationModel
//                                             .defaultWidth ??
//                                             0,
//                                       );
//                                     },
//                                     child: Container(
//                                       height: headerHeight ?? gridHeaderHeight,
//                                       width: 2,
//                                       color: mainColor,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Visibility(
//                   visible: modelMapList.isEmpty,
//                   child: Center(
//                     child: Text(
//                       'No Records Found',
//                       style: TextStyle(
//                         color: mainColor, // Change the text color to red
//                         fontSize: 18, // Change the font size to 18
//                         fontWeight:
//                         FontWeight.bold, // Change the font weight to bold
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 10.0),
//                   child: SelectionArea(
//                     child: SizedBox(
//                       height: height,
//                       child: SingleChildScrollView(
//                         physics: const BouncingScrollPhysics(),
//                         padding: const EdgeInsets.only(right: 5),
//                         child: Column(
//                           children: List.generate(
//                             modelMapList.length,
//                                 (gridIndex) => Container(
//                               color: whiteColor,
//                               child: Row(
//                                 children: List.generate(
//                                   gridModelList.length,
//                                       (index) => Visibility(
//                                     visible: list[index]
//                                         .personalizationModel
//                                         .isVisible!,
//                                     child: Container(
//                                       height: bodyHeight ?? gridBodyHeight,
//                                       width: (list[index]
//                                           .personalizationModel
//                                           .width! +
//                                           2 +
//                                           list[index]
//                                               .personalizationModel
//                                               .gridResizing!)
//                                           .toDouble(),
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 10),
//                                       decoration: BoxDecoration(
//                                         border: Border(
//                                           left: BorderSide(
//                                               width: 0.50, color: mainColor),
//                                           right: BorderSide(
//                                               width: 0.50, color: mainColor),
//                                           bottom: BorderSide(
//                                               width: 0.50, color: mainColor),
//                                         ),
//                                       ),
//                                       child: MouseRegion(
//                                         cursor: SystemMouseCursors.click,
//                                         child: Align(
//                                           alignment: Alignment.centerLeft,
//                                           child: gridModelList[index].widget ==
//                                               null
//                                               ? RSHyperLink(
//                                             linkText:
//                                             '${modelMapList[gridIndex][list[index].personalizationModel.gridColumnName!] ?? ''}',
//                                             onPressedEvent: () {
//                                               rsGridTapEvent(
//                                                   gridName,
//                                                   modelMapList,
//                                                   gridIndex,
//                                                   keyColumnName,
//                                                   onHyperLinkPressEvent);
//                                             },
//                                           )
//                                               : InkWell(
//                                               onTap: () {
//                                                 rsGridTapEvent(
//                                                     gridName,
//                                                     modelMapList,
//                                                     gridIndex,
//                                                     keyColumnName,
//                                                     onHyperLinkPressEvent);
//                                               },
//                                               child: gridModelList[index]
//                                                   .widget!(
//                                                   modelMapList[gridIndex])),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

void rsGridTapEvent(String? gridName, List<Map<String, dynamic>> modelMapList,
    int gridIndex, String? keyColumnName, Function? onHyperLinkPressEvent) {
  if (onHyperLinkPressEvent != null && keyColumnName != null) {
    onHyperLinkPressEvent(modelMapList[gridIndex][keyColumnName]);
  }
}

// class RSHyperLink extends StatelessWidget {
//   const RSHyperLink(
//       {super.key, required this.linkText, required this.onPressedEvent});
//
//   final String linkText;
//   final Function onPressedEvent;
//
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: InkWell(
//         onTap: () {
//           onPressedEvent();
//         },
//         child: GridBodyText(
//           text: linkText.trim(),
//         ),
//       ),
//     );
//   }
// }
//
// gridColumnReSizing({
//   required Offset offset,
//   required GridPersonalizationModel modelMap,
//   required int defaultWidth,
// }) {
//   final delta = offset.dx;
//   if (delta.isNegative) {
//     if (modelMap.width! < (modelMap.width! + modelMap.gridResizing!)) {
//       modelMap.gridResizing = modelMap.gridResizing! - 1;
//     }
//   } else {
//     modelMap.gridResizing = modelMap.gridResizing! + 1;
//   }
// }

// rsGridResizing({
//   required double screenWidth,
//   required List<GridPersonalizationModel> gridPersonalizationModel,
// }) {
//   double expandedWidth = 0;
//   for (var element in gridPersonalizationModel
//       .where((element) => !toNullableBool(element.isExpanded))
//       .toList()) {
//     if (toNullableBool(element.isVisible)) {
//       expandedWidth += (element.defaultWidth ?? 0);
//     }
//   }
//   double gridWidth = screenWidth - (expandedWidth + 40);
//   double totalVisibleColumnWidth = 0;
//   num resizedWidth = 0;
//   num unVisibleCount = 0;
//   List<GridPersonalizationModel> expanded = gridPersonalizationModel
//       .where((element) => toNullableBool(element.isExpanded))
//       .toList();
//   for (var element in expanded) {
//     element.width = element.defaultWidth!;
//     element.gridResizing = 0;
//     if (element.isVisible == false) {
//       unVisibleCount++;
//       resizedWidth = resizedWidth + element.width!;
//     } else {
//       totalVisibleColumnWidth = totalVisibleColumnWidth + element.width!;
//     }
//   }
//   if ((resizedWidth > 0 && unVisibleCount > 0) ||
//       gridWidth > totalVisibleColumnWidth) {
//     num totalColumn = expanded.length;
//     num visibleColumn = totalColumn - unVisibleCount;
//     num width = 0;
//     if (gridWidth > totalVisibleColumnWidth && expanded.isNotEmpty) {
//       double columnWidth = gridWidth - totalVisibleColumnWidth;
//       width = (columnWidth / visibleColumn).round();
//     }
//     for (var element in expanded) {
//       if (element.isVisible == true) {
//         element.width = int.parse('${element.width! + width - 1}');
//         element.gridResizing = 0;
//       }
//     }
//   }
//   return gridPersonalizationModel;
// }

// onFieldColumnSortOrderChange({
//   required List<GridPersonalizationModel> gridPersonalizationModelList,
//   required int index,
//   required String event,
// }) {
//   GridPersonalizationModel sortOrderData = gridPersonalizationModelList[index];
//   int sortOrder = 1;
//   gridPersonalizationModelList.removeAt(index);
//   if (event.toLowerCase() == 'down') {
//     sortOrder = sortOrderData.sortOrder!;
//     sortOrder = sortOrder + 1;
//     sortOrderData.sortOrder = sortOrder;
//     gridPersonalizationModelList[index].sortOrder = sortOrder - 1;
//     gridPersonalizationModelList.insert(index + 1, sortOrderData);
//   } else if (event.toLowerCase() == 'up') {
//     sortOrder = sortOrderData.sortOrder!;
//     sortOrder = sortOrder - 1;
//     sortOrderData.sortOrder = sortOrder;
//     gridPersonalizationModelList[index - 1].sortOrder = sortOrder + 1;
//     gridPersonalizationModelList.insert(index - 1, sortOrderData);
//   }
//   gridPersonalizationModelList
//       .sort((a, b) => a.sortOrder!.compareTo(b.sortOrder!));
//   return gridPersonalizationModelList;
// }
//
// class RSGridSettings extends StatefulWidget {
//   final List<GridPersonalizationModel> gridPersonalizationModel;
//   final Function saveGridPersonalization;
//   final Function clearGridPersonalization;
//   final bool gridSaveDisable;
//   final double screenWidth;
//   final StreamController<bool> pageStreamController;
//
//   const RSGridSettings({
//     super.key,
//     required this.gridPersonalizationModel,
//     required this.saveGridPersonalization,
//     required this.gridSaveDisable,
//     required this.screenWidth,
//     required this.clearGridPersonalization,
//     required this.pageStreamController,
//   });
//
//   @override
//   State<RSGridSettings> createState() => _RSGridSettingsState();
// }
//
// class _RSGridSettingsState extends State<RSGridSettings> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Column(
//           children: List.generate(
//             widget.gridPersonalizationModel.length,
//                 (i) => SizedBox(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   RSCheckBox2(
//                     onChangeEvent: (event) {
//                       setState(() {
//                         if (event) {
//                           widget.gridPersonalizationModel[i].isVisible = event;
//                         }
//                         int unVisibleCount = widget.gridPersonalizationModel
//                             .where((element) => element.isVisible == false)
//                             .toList()
//                             .length;
//                         if (unVisibleCount <=
//                             widget.gridPersonalizationModel.length - 3) {
//                           widget.gridPersonalizationModel[i].isVisible = event;
//                           rsGridResizing(
//                             screenWidth: widget.screenWidth,
//                             gridPersonalizationModel:
//                             widget.gridPersonalizationModel,
//                           );
//                         } else {
//                           ApiChecker().failureMessageGetX(
//                               header: 'Alert',
//                               message: 'Disabled Maximum Column');
//                         }
//                       });
//                       if (widget.pageStreamController.hasListener) {
//                         widget.pageStreamController.add(true);
//                       }
//                     },
//                     checkBoxValue: toNullableBool(
//                         widget.gridPersonalizationModel[i].isVisible),
//                     displayName: toNullableString(
//                         widget.gridPersonalizationModel[i].gridDisplayName),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       InkWell(
//                         onTap: (i ==
//                             widget.gridPersonalizationModel.length -
//                                 1 ||
//                             widget.gridPersonalizationModel[i].isVisible! ==
//                                 false)
//                             ? null
//                             : () {
//                           if (mounted) {
//                             setState(() {
//                               onFieldColumnSortOrderChange(
//                                 gridPersonalizationModelList:
//                                 widget.gridPersonalizationModel,
//                                 index: i,
//                                 event: "down",
//                               );
//                             });
//                             if (widget.pageStreamController.hasListener) {
//                               widget.pageStreamController.add(true);
//                             }
//                           }
//                         },
//                         child: SizedBox(
//                           height: 30,
//                           width: 25,
//                           child: Icon(
//                             Icons.arrow_circle_down,
//                             color: (i ==
//                                 widget.gridPersonalizationModel.length -
//                                     1) ||
//                                 widget.gridPersonalizationModel[i]
//                                     .isVisible! ==
//                                     false
//                                 ? Colors.grey
//                                 : Colors.black,
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       InkWell(
//                         onTap: i == 0 ||
//                             widget.gridPersonalizationModel[i].isVisible! ==
//                                 false
//                             ? null
//                             : () {
//                           if (mounted) {
//                             setState(() {
//                               onFieldColumnSortOrderChange(
//                                 gridPersonalizationModelList:
//                                 widget.gridPersonalizationModel,
//                                 index: i,
//                                 event: "up",
//                               );
//                             });
//                             if (widget.pageStreamController.hasListener) {
//                               widget.pageStreamController.add(true);
//                             }
//                           }
//                         },
//                         child: SizedBox(
//                           height: 30,
//                           width: 25,
//                           child: Icon(
//                             Icons.arrow_circle_up,
//                             color: i == 0 ||
//                                 widget.gridPersonalizationModel[i]
//                                     .isVisible! ==
//                                     false
//                                 ? Colors.grey
//                                 : Colors.black,
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         AIButton(
//           saveEnabled: widget.gridSaveDisable,
//           saveEvent: widget.saveGridPersonalization,
//           cancelEvent: widget.clearGridPersonalization,
//         ),
//       ],
//     );
//   }
// }

// gridWidthResizing({
//   required List<GridPersonalizationModel> gridPersonalizationList,
//   required bool event,
//   required int i,
//   Function? setStates,
// }) {
//   int resizedWidth = 0;
//   int visibleCount = 0;
//   for (var element in gridPersonalizationList) {
//     if (element.isVisible == false) {
//       resizedWidth = resizedWidth + element.defaultWidth!;
//       visibleCount++;
//     }
//   }
//   if (resizedWidth > 0 && visibleCount > 0) {
//     int totalColumn = gridPersonalizationList.length;
//     num visibleColumn = totalColumn - visibleCount;
//     int width = (resizedWidth / visibleColumn).round();
//     for (var element in gridPersonalizationList) {
//       if (element.isVisible == true) {
//         element.width = element.defaultWidth! + width - 1;
//         element.gridResizing = 0;
//       }
//     }
//   }
//   if (setStates != null) {
//     setStates(() {});
//   }
// }

// class GridSettingIcon extends StatefulWidget {
//   const GridSettingIcon({
//     super.key,
//     required this.gridPersonalizationList,
//     required this.screenWidth,
//     required this.gridInit,
//     required this.pageStreamController,
//   });
//
//   final List<GridPersonalizationModel> gridPersonalizationList;
//   final double screenWidth;
//   final Function gridInit;
//   final StreamController<bool> pageStreamController;
//
//   @override
//   State<GridSettingIcon> createState() => _GridSettingIconState();
// }
//
// class _GridSettingIconState extends State<GridSettingIcon> {
//   bool saveEnabled = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData(
//         tooltipTheme: TooltipThemeData(
//           decoration: BoxDecoration(
//             color: Colors.grey,
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ),
//       child: PopupMenuButton(
//         tooltip: 'Grid Settings',
//         offset: const Offset(0, 30),
//         icon: Icon(Icons.settings, size: 20, color: mainColor),
//         onSelected: null,
//         onCanceled: null,
//         itemBuilder: (context) => [
//           PopupMenuItem(
//             height: 40,
//             value: 1,
//             onTap: null,
//             child: GetBuilder<MasterController>(builder: (controller) {
//               widget.gridPersonalizationList
//                   .sort((a, b) => a.sortOrder!.compareTo(b.sortOrder!));
//               return SizedBox(
//                 child: RSGridSettings(
//                   screenWidth: widget.screenWidth,
//                   gridPersonalizationModel: widget.gridPersonalizationList,
//                   gridSaveDisable: saveEnabled,
//                   saveGridPersonalization: saveGridPersonalization,
//                   clearGridPersonalization: clearGridPersonalization,
//                   pageStreamController: widget.pageStreamController,
//                 ),
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
//
//   saveGridPersonalization(BuildContext context) async {
//     try {
//       setState(() {
//         saveEnabled = false;
//       });
//       ApiResponse apiResponse =
//       await CommonRepo().saveGridData(widget.gridPersonalizationList);
//       if (apiResponse.response!.statusCode == 200) {
//         Get.back();
//         ApiChecker().successMessageGetX(
//           header: "Grid",
//           message: 'Grid Customisation Updated Successfully',
//         );
//         await Get.find<MasterController>().getAllGridPersonalization();
//         widget.gridInit();
//       } else {
//         ApiChecker().checkApiGetX(
//             apiResponse: apiResponse, header: 'Field Grid Table ');
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//     setState(() {
//       saveEnabled = true;
//     });
//   }
//
//   clearGridPersonalization(BuildContext context) {
//     setState(() {
//       Get.back();
//       widget.gridInit();
//     });
//   }
// }

// class RSEditButton extends StatelessWidget {
//   const RSEditButton(
//       {super.key, required this.onPressedEvent, this.pressEventEnable = true});
//
//   final Function onPressedEvent;
//   final bool pressEventEnable;
//
//   @override
//   Widget build(BuildContext context) {
//     return AIToolTip(
//       message: 'Edit',
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: IconButton(
//             onPressed: pressEventEnable
//                 ? () {
//               onPressedEvent();
//             }
//                 : null,
//             icon: Icon(
//               FontAwesomeIcons.solidPenToSquare,
//               color: themePrimaryColor,
//               size: 15,
//             )),
//       ),
//     );
//   }
// }

// class RSDeleteButton extends StatelessWidget {
//   const RSDeleteButton(
//       {super.key, required this.onPressedEvent, this.pressEventEnable = true});
//
//   final Function onPressedEvent;
//   final bool pressEventEnable;
//
//   @override
//   Widget build(BuildContext context) {
//     return AIToolTip(
//       message: pressEventEnable ? 'Delete' : 'Delete not Allowed',
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: IconButton(
//             onPressed: pressEventEnable
//                 ? () {
//               onPressedEvent();
//             }
//                 : null,
//             icon: Icon(
//               FontAwesomeIcons.trash,
//               color: redColor,
//               size: 15,
//             )),
//       ),
//     );
//   }
// }
//
// GridPersonalizationModel getListByUsingDataColumnName(
//     String gridColumnName, List<GridPersonalizationModel> dataList) {
//   return dataList
//       .where((element) =>
//   element.gridColumnName!.toLowerCase() == gridColumnName.toLowerCase())
//       .first;
// }
//
// List<RSSortedGridModel> rsGridList({
//   required List<RSGridModel> gridList,
// }) {
//   List<RSSortedGridModel> sortOrderList = [];
//   for (var element in gridList) {
//     if (gridList.any((a) => a.personalizationModel.any((b) =>
//     b.gridColumnName!.toLowerCase() ==
//         element.gridColumnName.toLowerCase()))) {
//       RSSortedGridModel sortOrderGrid = RSSortedGridModel(
//         personalizationModel: getListByUsingDataColumnName(
//             element.gridColumnName, element.personalizationModel),
//         gridColumnName: element.gridColumnName,
//         sortOrder: getListByUsingDataColumnName(
//             element.gridColumnName, element.personalizationModel)
//             .sortOrder!,
//         widget: element.widget,
//       );
//       sortOrderList.add(sortOrderGrid);
//     }
//   }
//   sortOrderList.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
//   return sortOrderList;
// }
//}
class ScreenSize extends GetObserver {
  /// 420
  // bool isMobile() => width() > 299 && width() < 599;
  bool isMobile() => width() < 420;

  /// 420 to 1024
  // bool isTablet() => width() >= 600 && width() < 799;
  // bool isTablet() => width() >= 600 && width() < 1099;
  bool isTablet() => width() >= 420 && width() < 1024;

  bool isMiniDesktop() => width() >= 800 && width() < 1099;

  // bool isDesktop() => width() >= 1200 && width() <= 1400;
  /// 1024 above
  bool isDesktop() => width() >= 1024;

  bool isMaxDesktop() => width() >= 1600;

  bool isConstraintDesktop(double width) => width >= 1024;

  bool isConstraintMobile(double width) => width < 420;

  bool isConstraintTablet(double width) => width >= 420 && width < 1024;

  int checkForDoubleRow(double width) {
    int lg = 6;
    if (width < 420) {
      lg = 12;
    } else {
      lg = 6;
    }
    return lg;
  }

  nonVisibility() {
    return Container();
  }

  titleFontSize() {
    if (isMobile()) {
      return 12.0;
    } else if (isTablet()) {
      return 14.0;
    } else {
      return 14.0;
    }
  }

  subTitleFontSize() {
    if (isMobile()) {
      return 10.0;
    } else if (isTablet()) {
      return 12.0;
    } else {
      return 12.0;
    }
  }

  width() {
    double width =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
    return width;
  }

  height() {
    double width =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
    return width;
  }

  getScreen() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  }
}

class RSDivider extends StatelessWidget {
  const RSDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: mainColor,
      thickness: 0.30,
    );
  }
}

// class GridPagination extends StatelessWidget {
//   const GridPagination({
//     super.key,
//     required this.totalCount,
//     required this.pageIndex,
//     required this.pageSize,
//     required this.pagination,
//   });
//
//   final int totalCount;
//   final int pageIndex;
//   final int pageSize;
//   final Function pagination;
//
//   @override
//   Widget build(BuildContext context) {
//     return (totalCount == 0)
//         ? const SizedBox()
//         : Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         AIToolTip(
//           message: "Previous Page",
//           child: IconButton(
//             constraints: const BoxConstraints(),
//             padding: const EdgeInsets.all(0),
//             onPressed: (pageIndex * pageSize) == 0
//                 ? null
//                 : () {
//               pagination(decreaseEvent);
//             },
//             icon: Icon(
//               size: 14,
//               FontAwesomeIcons.angleLeft,
//               color:
//               (pageIndex * pageSize) == 0 ? Colors.grey : mainColor,
//             ),
//           ),
//         ),
//         AIToolTip(
//           message: "Start",
//           child: IconButton(
//             constraints: const BoxConstraints(),
//             padding: const EdgeInsets.all(0),
//             onPressed: (pageIndex * pageSize) == 0
//                 ? null
//                 : () {
//               pagination(startEvent);
//             },
//             icon: Icon(
//               size: 14,
//               FontAwesomeIcons.anglesLeft,
//               color:
//               (pageIndex * pageSize) == 0 ? Colors.grey : mainColor,
//             ),
//           ),
//         ),
//         AIToolTip(
//           message: "End",
//           child: IconButton(
//             constraints: const BoxConstraints(),
//             padding: const EdgeInsets.all(0),
//             onPressed: ((pageIndex + 1) * pageSize) < totalCount
//                 ? () {
//               //Start Event
//               pagination(endEvent);
//             }
//                 : null,
//             icon: Icon(
//               size: 14,
//               FontAwesomeIcons.anglesRight,
//               color: ((pageIndex + 1) * pageSize) < totalCount
//                   ? mainColor
//                   : Colors.grey,
//             ),
//           ),
//         ),
//         AIToolTip(
//           message: "Next Page",
//           child: IconButton(
//             constraints: const BoxConstraints(),
//             padding: const EdgeInsets.all(0),
//             onPressed: ((pageIndex + 1) * pageSize) < totalCount
//                 ? () {
//               //Increase Event
//               pagination(increaseEvent);
//             }
//                 : null,
//             icon: Icon(
//               size: 14,
//               FontAwesomeIcons.angleRight,
//               color: ((pageIndex + 1) * pageSize) < totalCount
//                   ? mainColor
//                   : Colors.grey,
//             ),
//           ),
//         ),
//         Text(
//           "${(pageIndex * pageSize) == 0 ? "1" : buildNumberSeparator(value: pageIndex * pageSize)}-${(pageIndex + 1) * pageSize < totalCount ? buildNumberSeparator(value: (pageIndex + 1) * pageSize) : buildNumberSeparator(value: totalCount)} of ${buildNumberSeparator(value: totalCount)}",
//         ),
//       ],
//     );
//   }
// }

buildNumberSeparator({required int value}) {
  var formatter = NumberFormat('###,###,000');
  dynamic count;
  if (value >= 1000) {
    count = formatter.format(value);
  } else {
    count = value;
  }
  return count;
}

// class GridHeader extends StatelessWidget {
//   final List<GridPersonalizationModel> gridPersonalizationModel;
//   final Function gridInit;
//   final double width;
//   final StreamController<bool> streamController;
//   final String title;
//   final Function? routeFunction;
//   final bool addVisibility;
//   final Widget? additionalWidget;
//   final bool showBackArrow;
//
//   const GridHeader({
//     super.key,
//     required this.gridPersonalizationModel,
//     required this.width,
//     required this.gridInit,
//     required this.streamController,
//     required this.title,
//     this.routeFunction,
//     this.addVisibility = false,
//     this.additionalWidget,
//     this.showBackArrow = true,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         AITitle(
//           text: title,
//           showBackArrow: showBackArrow,
//         ),
//         Row(
//           children: [
//             if (additionalWidget != null) ...[
//               additionalWidget!,
//             ],
//             Visibility(
//               visible: routeFunction != null && addVisibility,
//               child: AIToolTip(
//                 message: 'Add $title',
//                 child: InkWell(
//                   onTap: addVisibility
//                       ? () {
//                     routeFunction!();
//                   }
//                       : null,
//                   child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 5),
//                       decoration: BoxDecoration(
//                           color: mainColor,
//                           borderRadius: BorderRadius.circular(5)),
//                       child: Text(
//                         'Add New',
//                         style: TextStyle(
//                           color: whiteColor,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       )),
//                 ),
//               ),
//             ),
//             GridSettingIcon(
//               gridPersonalizationList: gridPersonalizationModel,
//               screenWidth: width,
//               gridInit: gridInit,
//               pageStreamController: streamController,
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }

class AIToolTip extends StatelessWidget {
  const AIToolTip({super.key, required this.message, required this.child});

  final String message;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

// rapidColorPicker(TextEditingController textController, String modelName,
//     Map<String, dynamic> modelMap, var onChangedEvent) {
//   Get.defaultDialog(
//     title: 'Pick Color',
//     content: StatefulBuilder(
//       builder: ((context, setState) {
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ColorPicker(
//               pickerColor: isNotNullOrEmpty(modelMap[modelName])
//                   ? Color(int.parse(modelMap[modelName]))
//                   : mainColor,
//               onColorChanged: (val) {
//                 setState(() {
//                   textController.text = '$val';
//                   modelMap[modelName] = '${val.value}';
//                   rapidSoftPrint(val.value);
//                   if (isNotNullOrEmpty(onChangedEvent)) {
//                     onChangedEvent(modelMap[modelName], modelName);
//                   }
//                 });
//               },
//             ),
//             const SizedBox(width: 20, height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                         color: mainColor,
//                         borderRadius: BorderRadius.circular(10)),
//                     width: 80,
//                     child: const Center(
//                       child: Text(
//                         'Confirm',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 InkWell(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                         color: Colors.grey,
//                         borderRadius: BorderRadius.circular(10)),
//                     width: 80,
//                     child: const Center(
//                       child: Text(
//                         'Cancel',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             //AIButton(saveEnabled: true, saveEvent: (ctx){Get.back();}, cancelEvent: (ctx){Get.back();},saveButtonName: "Confirm",),
//           ],
//         );
//       }),
//     ),
//   );
// }

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.saveEvent,
    required this.saveEnabled,
    required this.buttonName,
    this.buttonColor = const Color.fromRGBO(53, 49, 97, 1),
  });

  final Function saveEvent;
  final bool saveEnabled;
  final String buttonName;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !saveEnabled
          ? null
          : () {
              saveEvent(context);
            },
      child: Card(
        elevation: 5,
        color: buttonColor,
        child: SizedBox(
          width: 80,
          height: 30,
          child: Center(
            child: !saveEnabled
                ? ApiChecker().buttonLoader()
                : ButtonText(
                    buttonText: buttonName,
                  ),
          ),
        ),
      ),
    );
  }
}

// openWindowsPlayers({String? base64File, String? fileName}) async {
//   try {
//     final Directory tempDir = await getTemporaryDirectory();
//     final String tempPath =
//         "${tempDir.path}\\${toNullableString(fileName).replaceAll(" ", "")}"; // '/video.mp4';
//     await File(tempPath).writeAsBytes(base64Decode(base64File ?? ''));
//     await Process.run('cmd', ['/c', 'start', tempPath]);
//   } catch (e) {
//     rapidSoftPrint(e);
//     Map<String, dynamic> exceptionModelMap = {};
//     exceptionModelMap['methodName'] = 'openWindowsPlayers';
//     exceptionModelMap['parameter'] = '$base64File,$fileName';
//     exceptionModelMap['exMessage'] = '$e';
//     CommonRepo().saveUIException(exceptionModelMap);
//   }
// }

Color getMessageTypeColor(String messageType) {
  switch (messageType.toLowerCase()) {
    case 'm':
      return mainColor;
    case 'h':
      return Colors.grey;
    case 'ei':
      return Colors.black;
    case 'pr':
      return Colors.red;
    case 'nr':
      return Colors.green;
    default:
      return mainColor;
  }



}
