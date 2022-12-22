import 'package:data_config/data_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:injection/injection.dart';
import 'package:tekction/common/app_constant.dart';
import 'package:tekction/resource/asset_manager.dart';

class AuctionCard extends StatelessWidget {
  const AuctionCard(
      {super.key,
      this.imageUrl,
      this.vendor,
      this.onSharePressed,
      this.name,
      this.description,
      this.price,
      this.onRsvpPressed,
      this.onLivePressed,
      this.isLive = false});

  /// Image url.
  final String? imageUrl;

  /// Vendor name.
  final String? vendor;

  /// Callback on share pressed.
  final VoidCallback? onSharePressed;

  // Callback on live.
  final VoidCallback? onLivePressed;

  /// Time.
  final String? name;

  /// Description.
  final String? description;

  final int? price;

  /// Callback on rsvp button pressed.
  final VoidCallback? onRsvpPressed;

  final bool isLive;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        color: const Color(0xff36374080),
        width: locator<SizeConfig>().screenW / 2.2,
        height: 280,
        child: Stack(
          children: [
            Image.asset(
              isLive ? ImageAssets.live : ImageAssets.rsrv,
              height: 280,
              fit: BoxFit.fitHeight,
            ),
            !isLive
                ? Positioned(
                    top: 20,
                    left: horizontalPadding / 2,
                    right: horizontalPadding / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Tuesday 20th \n 9:00 PM',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        InkWell(
                            onTap: onRsvpPressed,
                            child: SvgPicture.asset(SvgAsset.plus))
                      ],
                    ))
                : Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: InkWell(
                      onTap: onLivePressed,
                      child: Image.asset(ImageAssets.liveButton),
                    ),
                  ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: horizontalPadding / 2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name',
                      maxLines: 2,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                    /*  if (isLive)
                      Text(
                        '$price',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ), */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundImage: NetworkImage('$imageUrl'),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '$vendor',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: onSharePressed,
                          icon: const Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
