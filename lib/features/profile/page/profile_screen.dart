import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:tekction/data/model/mode.dart';
import 'package:tekction/navigation/router.gr.dart';

//TODO:logout code
/* async {
                    // LogoutHelper().loggedOutAlert(context);
                    await FirebaseAuth.instance.signOut();
                    final action =
                        FlutterFireUIAction.ofType<SignedOutAction>(context);
                    action?.callback(context);
                    context.router.pop();
                    context.router.replace(const SplashRoute());
                  }, */
// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserModel _user = UserModel(
      id: '1234',
      userDisplayName: 'Thomas Selby',
      phone: '9829327790',
      address: 'Lalitpur-15, Patan',
      profileUrl:
          'https://i2-prod.mirror.co.uk/incoming/article7861134.ece/ALTERNATES/s615b/Peaky-Blinders-3.jpg');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  color: StaticColors.appColor,
                ),
                padding: const EdgeInsets.all(Dimens.dp40),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Container(
                          height: 80,
                          width: 80,
                          clipBehavior: Clip.antiAlias,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: CachedNetworkImage(
                            imageUrl: _user.profileUrl ??
                                'https://picsum.photos/1000/1000',
                            fit: BoxFit.cover,
                            fadeInDuration: const Duration(milliseconds: 250),
                            fadeOutDuration: const Duration(milliseconds: 250),
                            width: 99,
                            height: 99,
                            errorWidget: (_, __, ___) {
                              return CircleAvatar(
                                radius: 45,
                                backgroundColor: StaticColors.bgGray2,
                                child: SvgPicture.asset(
                                  AssetsPath.placeholderProfile,
                                  width: 99,
                                  height: 99,
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                                onTap: () {
                                  context.router
                                      .pushNamed(AppRoutes.settingsPath);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(13),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      color: StaticColors.bgSetting),
                                  child:
                                      SvgPicture.asset(AssetsPath.iconSettings),
                                )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _user.userDisplayName ?? "Jack Daniels",
                      style: ThemeData().textTheme.headline1?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "@${_user.userDisplayName ?? 'n.a'}",
                      style: ThemeData().textTheme.headline1?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: StaticColors.gradientName),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              ProfileCard(
                text: 'My wallet',
                padding: 18,
                trailing: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: StaticColors.nextBg,
                  ),
                  child: Text(
                    "\$ 500",
                    style: ThemeData().textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: StaticColors.appColor),
                  ),
                ),
                leadingIcon: AssetsPath.myWallet,
                onPressed: () {},
              ),
              ProfileCard(
                text: 'Following',
                padding: 18,
                trailing: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: StaticColors.nextBg,
                    ),
                    child: Text(
                      '12',
                      style: ThemeData().textTheme.headline1?.copyWith(
                          color: StaticColors.appColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    )),
                leadingIcon: AssetsPath.following,
                onPressed: () {},
              ),
              ProfileCard(
                text: 'My products',
                padding: 18,
                trailing: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: StaticColors.nextBg,
                  ),
                  child: SvgPicture.asset(
                    AssetsPath.iconNext,
                    color: StaticColors.blue4,
                  ),
                ),
                leadingIcon: AssetsPath.following,
                onPressed: () {
                  context.router.push(ProductPageRoute(user: _user));
                },
              ),
              ProfileCard(
                text: 'Saved live',
                padding: 18,
                trailing: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: StaticColors.nextBg,
                  ),
                  child: SvgPicture.asset(
                    AssetsPath.iconNext,
                    color: StaticColors.blue4,
                  ),
                ),
                leadingIcon: AssetsPath.iconNotification,
                onPressed: () {},
              ),
              ProfileCard(
                text: 'Order history',
                padding: 18,
                trailing: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: StaticColors.nextBg,
                  ),
                  child: SvgPicture.asset(
                    AssetsPath.iconNext,
                    color: StaticColors.blue4,
                  ),
                ),
                leadingIcon: AssetsPath.orderHis,
                onPressed: () {
                  //TODO:REMOVE ASMITCODE
                  //  context.router.pushNamed(AppRoutes.profileOrderPath);
                },
              ),
              const SizedBox(height: 8),
              Container(
                height: 170,
                margin: const EdgeInsets.only(bottom: 17),
                padding: const EdgeInsets.all(8),
                color: StaticColors.bgColor,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            child: Text(
                              'Become a live creator now',
                              style: ThemeData().textTheme.headline1?.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom().copyWith(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  const Set<MaterialState> interactiveStates =
                                      <MaterialState>{
                                    MaterialState.disabled,
                                  };
                                  return StaticColors.purple;
                                }),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Start now',
                                      style: ThemeData()
                                          .textTheme
                                          .headline1
                                          ?.copyWith(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(AssetsPath.iconRequest),
                  ],
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatefulWidget {
  const ProfileCard({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.trailing,
    this.leadingIcon,
    this.padding,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final Widget trailing;
  final String? leadingIcon;
  final double? padding;

  @override
  _ProfileCard createState() => _ProfileCard();
}

class _ProfileCard extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 8,
          left: widget.padding ?? 35,
          right: widget.padding ?? 35,
          bottom: 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: ListTile(
          onTap: widget.onPressed,
          leading: widget.leadingIcon != null
              ? Container(
                  height: 44,
                  width: 44,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: StaticColors.bgColor),
                  child: SvgPicture.asset(
                    widget.leadingIcon ?? "",
                    color: (widget.leadingIcon == AssetsPath.iconNotification)
                        ? StaticColors.purple
                        : null,
                  ),
                )
              : null,
          title: Text(
            widget.text,
            style: ThemeData().textTheme.headline1?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: StaticColors.titleColor),
          ),
          trailing: widget.trailing),
    );
  }
}
