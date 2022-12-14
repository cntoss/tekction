import 'package:flutter/material.dart';
import 'package:tekction/home/ui/widget/basket_widget.dart';
import 'package:tekction/home/ui/widget/product_card.dart';
import 'package:tekction/resource/color_manager.dart';

class LiveProductWidget extends StatelessWidget {
  const LiveProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 16, bottom: 32),
      decoration: BoxDecoration(
        color: ColorManager.blue.withOpacity(0.9),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text("Products",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const Spacer(
                  flex: 3,
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
                    decoration: BoxDecoration(
                        color: ColorManager.darkBlue,
                        borderRadius: BorderRadius.circular(30)),
                    child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText1,
                            children: const [
                          TextSpan(
                              text: '\$ 500',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          TextSpan(
                              text: '.00',
                              style: TextStyle(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ]))),
                const Spacer(
                  flex: 1,
                ),
                const BasketWidget(),
              ],
            ),
          ),
          ListView.builder(
            itemCount: 30,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 15),
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Product(
                index: (index + 1).toString(),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
