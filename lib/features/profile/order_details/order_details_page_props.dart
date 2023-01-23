part of 'order_details_page.dart';

abstract class _OrderDetailsPageProps extends State<OrderDetailsPage> {
  final ScrollController _eShowSectionsController = ScrollController();

  String amount = "";
  bool loadingDialogIsOpen = false;

  @override
  void dispose() {
    _eShowSectionsController.dispose();
    super.dispose();
  }

  void dismissDialog() {
    if (loadingDialogIsOpen) {
      // context.router.pop();
    }

    setState(() {
      loadingDialogIsOpen = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> openMap(double? latitude, double? longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    /*  if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    } */
  }
}
