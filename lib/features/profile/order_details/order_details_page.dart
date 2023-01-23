import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:tekction/navigation/router.gr.dart';
import 'package:tekction/utils/widgets/basic_scaffold_view.dart';
import 'package:tekction/utils/widgets/molecules/custom_auto_back.dart';

import '../../../data/model/mode.dart';
import '../order_product/order_product_list_view.dart';

part '../order_details/order_details_page_props.dart';
part '../order_details/order_details_page_widgets.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({Key? key, required this.orderHistory})
      : super(key: key);
  final OrderDetails orderHistory;

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();

  /* @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<OrderDetailsCubit>(
      create: (context) => OrderDetailsCubit(),
      child: this,
      lazy: true,
    );
  } */
}

class _OrderDetailsPageState extends _OrderDetailsPageProps
    with _OrderDetailsPageWidgets {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(116),
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: AppBar(
            elevation: 0,
            leading: AutoBackCustom(
              onTap: () {
                /* BlocProvider.of<RefreshCubit>(context)
                    .updateEnumRefresh(EnumRefresh.orderHistoryPage); */
              },
            ),
            title: Text('Orders',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24)),
            centerTitle: false,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: BasicScaffoldView(
        bodyWidget: body(context),
      ),
    );
  }
}
