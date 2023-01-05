part of 'user_follower_page.dart';

abstract class _UserFollowerPageProps extends State<UserFollowerPage>
    with TickerProviderStateMixin {
  final ScrollController _eShowSectionsController = ScrollController();
  late TabController _tabController;
  bool loadingDialogIsOpen = false;

  @override
  void dispose() {
    _eShowSectionsController.dispose();

    super.dispose();
  }

  void dismissDialog() {
    if (loadingDialogIsOpen) {
      context.router.popForced();
    }
    setState(() {
      loadingDialogIsOpen = false;
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  void selectSize(StockItem stockItem, ItemProduct productElement) {
   /*  for (int i = 0; i < productElement.stocks!.length; i++) {
      productElement.stocks![i] =
          productElement.stocks![i].copyWith(select: false);
    }
    setState(() {
      productElement.stocks![productElement.stocks!.indexOf(stockItem)] =
          productElement.stocks![productElement.stocks!.indexOf(stockItem)]
              .copyWith(select: true);
    }); */
  }

/*   bool checkReservation(
      List<Reservation>? reservations, UserEntity userEntity) {
    if (reservations != null) {
      for (var element in reservations) {
        if (element.userId == userEntity.id) {
          return true;
        }
      }
    }
    return false;
  }
*/
    }
