part of 'details_product_page.dart';

abstract class _DetailsProductProps extends State<DetailsProductPage> {
  final ScrollController _eShowSectionsController = ScrollController();
  bool loadingDialogIsOpen = false;
  int qte = 0;

  @override
  void dispose() {
    _eShowSectionsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //widget.product.stocks!.first = widget.product.stocks!.first.copyWith(select: true);
    //context.read<DetailsProductCubit>().selectStock(widget.product.stocks!.first);
    productQte();
    super.initState();
  }

  void dismissDialog() {
    if (loadingDialogIsOpen) {
      context.router.pop();
    }

    setState(() {
      loadingDialogIsOpen = false;
    });
  }

  void selectSize(StockItem stockItem) {
    for (int i = 0; i < widget.product.stocks!.length; i++) {
      // widget.product.stocks![i] = widget.product.stocks![i].copyWith(select: false);
    }
    setState(() {
      //widget.product.stocks![widget.product.stocks!.indexOf(stockItem)] = widget.product.stocks![widget.product.stocks!.indexOf(stockItem)].copyWith(select: true);
    });
  }

  bool checkCart(
      List<CartDetailsItem> cartDetailsList, ItemProduct productElement) {
    if (cartDetailsList.isEmpty) {
      return true;
    }
    if (cartDetailsList[0].product!.ownerId == productElement.ownerId!) {
      return true;
    }
    return false;
  }

  void productQte() {
    widget.product.stocks!.forEach((element) {
      qte += element.qte!;
    });
  }
}
