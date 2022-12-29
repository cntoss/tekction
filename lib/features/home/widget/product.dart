import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({
    super.key,
    this.index,
    this.label,
    this.productImageURL,
    this.subLabel,
    this.price,
    this.onBuyPressed,
  });

  /// Product ImageURL.
  final String? productImageURL;

  /// Index.
  final String? index;

  /// Label
  final String? label;

  /// Sub-label.
  final String? subLabel;

  /// Price.
  final String? price;

  /// Callback on button pressed.
  final VoidCallback? onBuyPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 378,
      height: 108,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.3),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  productImageURL ?? 'https://picsum.photos/108/108',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 29,
                width: 29,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    index ?? '1',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: 268,
            padding:
                const EdgeInsets.only(left: 26, right: 16, top: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label ?? 'Dolce small handbag',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subLabel?.toUpperCase() ?? 'Dolce & gabana'.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9A9BA6),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price ?? 'NPR 1250.00',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: onBuyPressed,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(26)),
                          color: Color(0xff8E97FD),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Buy',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
