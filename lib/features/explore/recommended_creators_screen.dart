import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../data/model/mode.dart';

class RecommendedCreatorsScreen extends StatefulWidget {
  const RecommendedCreatorsScreen({super.key, required this.users});

  final List<MainUser>? users;

  @override
  State<RecommendedCreatorsScreen> createState() =>
      _RecommendedCreatorsScreenState();
}

class _RecommendedCreatorsScreenState extends State<RecommendedCreatorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Row(
                  children: [
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: () => context.router.pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: StaticColors.appColor,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Recommended Shops',
                      style: ThemeData().textTheme.headline1?.copyWith(
                            color: StaticColors.appColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                    )
                  ],
                ),
                widget.users!.isEmpty
                    ? Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 80,
                            ),
                            SvgPicture.asset(
                              AssetsPath.emptyFollow,
                              height: 268,
                              width: 269,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 40),
                              child: Text(
                                'No results were found',
                                textAlign: TextAlign.center,
                                style: ThemeData()
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                        color: StaticColors.appColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 0.9,
                        ),
                        shrinkWrap: true,
                        itemCount: widget.users!.length,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 32,
                        ),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: widget.users![index].img != null
                                    ? CachedNetworkImage(
                                        imageUrl:
                                            widget.users![index].img ?? '',
                                        fit: BoxFit.cover,
                                        fadeInDuration:
                                            const Duration(milliseconds: 250),
                                        fadeOutDuration:
                                            const Duration(milliseconds: 250),
                                      )
                                    : Center(
                                        child: SvgPicture.asset(
                                            AssetsPath.placeholderProfile),
                                      ),
                              ),
                              widget.users![index].follow!
                                  ? Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              widget.users![index].username!,
                                              style: ThemeData()
                                                  .textTheme
                                                  .headline1
                                                  ?.copyWith(
                                                      color: StaticColors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom()
                                                  .copyWith(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color>(
                                                            (Set<MaterialState>
                                                                states) {
                                                  const Set<MaterialState>
                                                      interactiveStates =
                                                      <MaterialState>{
                                                    MaterialState.disabled,
                                                  };
                                                  return StaticColors
                                                      .activeIcon;

                                                  //return  StaticColors.activeIcon;
                                                }),
                                                padding: MaterialStateProperty
                                                    .resolveWith<
                                                            EdgeInsetsGeometry>(
                                                        (Set<MaterialState>
                                                            states) {
                                                  return const EdgeInsets
                                                      .symmetric(
                                                    vertical: 8,
                                                    horizontal: 18,
                                                  );
                                                }),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                child: Text(
                                                  'Follow',
                                                  style: ThemeData()
                                                      .textTheme
                                                      .headline1
                                                      ?.copyWith(
                                                          color: StaticColors
                                                              .white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14),
                                                ),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            widget.users![index].username!,
                                            style: ThemeData()
                                                .textTheme
                                                .headline1
                                                ?.copyWith(
                                                  color: StaticColors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                          ),
                                        ),
                                        const SizedBox(height: 50),
                                      ],
                                    ),
                            ],
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
