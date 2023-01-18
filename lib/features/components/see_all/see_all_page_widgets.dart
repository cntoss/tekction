part of 'see_all_page.dart';

mixin _SeeAllPageWidgets {
  void showBottomSheetLogin(BuildContext context, VoidCallback loginAction,
      VoidCallback signupAction) {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: ColorManager.appColor,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 2,
                width: 35,
                margin: const EdgeInsets.only(top: 8, bottom: 28),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(1.5)),
                  color: Colors.white,
                ),
              ),
              Text(
                "You need to have an account to watch live events",
                textAlign: TextAlign.center,
                style: ThemeData().textTheme.subtitle1?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom().copyWith(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      return ColorManager.activeIcon;
                    }),
                    padding:
                        MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                            (Set<MaterialState> states) {
                      return EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 18,
                      );
                    }),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text('Sign Up'),
                  ),
                  onPressed: signupAction),
              SizedBox(
                height: 35,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: [
                  TextSpan(
                    text: "Already signed up",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'Login',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        loginAction();
                      },
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.white, fontSize: 16),
                  ),
                ]),
              ),
              SizedBox(
                height: 35,
              ),
            ],
          );
        });
  }
}
