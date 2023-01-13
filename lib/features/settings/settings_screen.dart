import 'package:auto_route/auto_route.dart';
import 'package:data_config/data_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:preferences/preferences.dart';
import 'package:tekction/utils/widgets/profile_card.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool pushNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: AppBar(
            leading: IconButton(
              onPressed: () => context.router.pop(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            elevation: 0,
            title: Text(
              'Profile settings',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
            ),
            centerTitle: false,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileCard(
              text: 'Edit profile',
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
              onPressed: () {
                context.router.pushNamed(AppRoutes.profileEditPath);
              },
            ),
            const SizedBox(height: 14),
            ProfileCard(
              text: 'Change password',
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
              onPressed: () {},
            ),
            const SizedBox(height: 14),
            ProfileCard(
              text: 'Manage address',
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
              onPressed: () {},
            ),
            const SizedBox(height: 14),
            ProfileCard(
              text: 'Push notifications',
              trailing: Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  activeColor: StaticColors.purple,
                  value: pushNotification,
                  onChanged: (value) {
                    setState(() {
                      pushNotification = !pushNotification;
                    });
                  },
                ),
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 14),
            const SizedBox(height: 40),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom().copyWith(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      return StaticColors.purple;
                    }),
                    padding:
                        MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                            (Set<MaterialState> states) {
                      return const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 18,
                      );
                    }),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AssetsPath.iconLogout),
                        const SizedBox(width: 10),
                        Text(
                          'Logout',
                          style: ThemeData().textTheme.headline1?.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
