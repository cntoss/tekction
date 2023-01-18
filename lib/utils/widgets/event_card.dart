import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class EventCard extends StatelessWidget {
  const EventCard(
      {super.key,
      this.imageUrl,
      this.vendor,
      this.onSharePressed,
      this.name,
      this.description,
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

  /// Callback on rsvp button pressed.
  final VoidCallback? onRsvpPressed;

  final bool isLive;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var cardSize = isLive ? 253.0 : size.width / 2.2;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        color: const Color(0xff36374080),
        width: cardSize,
        height: isLive ? 350 : 280,
        child: Stack(
          children: [
            Image.network(
              imageUrl ?? '',
              height: isLive ? 350 : 280,
              fit: BoxFit.fill,
            ),
            !isLive
                ? Positioned(
                    top: 20,
                    left: 30 / 2,
                    right: 30 / 2,
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
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              AssetsPath.addNoteIcon,
                            ),
                          ),
                        )
                      ],
                    ))
                : Positioned(
                    top: 16,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: onLivePressed,
                          child: Container(
                            height: 22,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [
                                  ColorManager.gradient1,
                                  ColorManager.gradient2,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment(0, 3),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.circle,
                                  size: 8,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'LIVE',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            Positioned(
              bottom: 0,
              child: Container(
                width: cardSize,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              radius: 10,
                              backgroundImage:
                                  NetworkImage('https://picsum.photos/280/300'),
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
                        GestureDetector(
                          onTap: onSharePressed,
                          child: const Icon(
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
