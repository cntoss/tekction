import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({
    Key? key,
    required this.onRefresh,
    required this.image,
    this.titleText,
    this.supText,
    this.textColor,
    this.height,
    this.width,
  }) : super(key: key);

  final String image;
  final String? titleText;
  final String? supText;
  final Color? textColor;
  final double? height;
  final double? width;
  final Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    // if (failure != null) {
    //   if (failure!.code == 0) {
    //     return RefreshIndicator(
    //       onRefresh: () async {
    //         onRefresh.call();
    //         return Future<void>.delayed(const Duration(seconds: 1));
    //       },
    //       child: CustomScrollView(
    //         slivers: [
    //           SliverToBoxAdapter(
    //             child: Center(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children: [
    //                   SizedBox(
    //                     height: 80,
    //                   ),
    //                   SvgPicture.asset(
    //                     AssetsPath.iconNoInternet,
    //                     height: 278,
    //                     width: 342,
    //                   ),
    //                   Visibility(
    //                     visible: true,
    //                     child: Padding(
    //                       padding: EdgeInsets.symmetric(
    //                           horizontal: 40, vertical: 46),
    //                       child: Text(
    //                         S.current.empty_no_internet,
    //                         textAlign: TextAlign.center,
    //                         style: ThemeData().textTheme.subtitle1?.copyWith(
    //                             color: textColor ?? StaticColors.white,
    //                             fontSize: 21,
    //                             fontWeight: FontWeight.w500),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   }
    // }
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh.call();
        return Future<void>.delayed(const Duration(seconds: 1));
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  SvgPicture.asset(
                    image,
                    height: height ?? 268,
                    width: width ?? 269,
                  ),
                  Visibility(
                    visible: titleText != null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 46),
                      child: Text(
                        titleText ?? "",
                        textAlign: TextAlign.center,
                        style: ThemeData().textTheme.subtitle1?.copyWith(
                            color: textColor ?? Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: supText != null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 40),
                      child: Text(
                        supText ?? "",
                        textAlign: TextAlign.center,
                        style: ThemeData().textTheme.subtitle1?.copyWith(
                            color: textColor ?? Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
