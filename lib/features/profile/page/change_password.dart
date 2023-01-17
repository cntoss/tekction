import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:tekction/utils/widgets/password_input.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode focusOldPassword = FocusNode();
  final FocusNode focusNewPassword = FocusNode();
  final FocusNode focusConfirmPassword = FocusNode();
  String? passwordMatchMessage;

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
              'Change password',
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
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: AppPasswordInput(
                  prefix: SvgPicture.asset(AssetsPath.iconLock),
                  controller: _oldPasswordController,
                  hint: 'Current password',
                  errorText: null,
                  contentPadding: true,
                  focusNode: focusOldPassword,
                  onSubmit: (_) => {focusNewPassword.requestFocus()},
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: AppPasswordInput(
                  prefix: SvgPicture.asset(AssetsPath.iconLock),
                  controller: _newPasswordController,
                  hint: 'New password',
                  errorText: null,
                  contentPadding: true,
                  focusNode: focusNewPassword,
                  onSubmit: (_) => {focusConfirmPassword.requestFocus()},
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: AppPasswordInput(
                  prefix: SvgPicture.asset(AssetsPath.iconLock),
                  controller: _confirmPasswordController,
                  hint: 'Confirm password',
                  errorText: passwordMatchMessage,
                  contentPadding: true,
                  focusNode: focusConfirmPassword,
                ),
              ),
              const SizedBox(height: 35),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom().copyWith(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        const Set<MaterialState> interactiveStates =
                            <MaterialState>{
                          MaterialState.disabled,
                        };
                        if (states.any(interactiveStates.contains)) {
                          return StaticColors.disableBtn;
                        }
                        return StaticColors.activeIcon;
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
                      child: Text(
                        'Save',
                        style: ThemeData().textTheme.headline1?.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                    onPressed: () {
                      if (_newPasswordController.text.isEmpty &&
                          _confirmPasswordController.text.isEmpty) {
                        return;
                      } else if (_newPasswordController.text !=
                          _confirmPasswordController.text) {
                        setState(() {
                          passwordMatchMessage = 'Enter same password!';
                        });
                        return;
                      }
                      setState(() {
                        passwordMatchMessage = null;
                      });
                    }),
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
