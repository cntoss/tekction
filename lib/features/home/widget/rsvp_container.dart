import 'package:flutter/material.dart';

import 'primary_button_icon.dart';

class RsvpContainer extends StatelessWidget {
  const RsvpContainer({
    super.key,
    this.imageUrl,
    this.vendor,
    this.onSharePressed,
    this.time,
    this.description,
    this.totalNumber,
    this.onRsvpPressed,
    this.onRsvpCancelPressed,
    required this.isRsvped,
  });

  /// Image url.
  final String? imageUrl;

  /// Vendor name.
  final String? vendor;

  /// Callback on share pressed.
  final VoidCallback? onSharePressed;

  /// Time.
  final String? time;

  /// Description.
  final String? description;

  /// Total number of people rsvped.
  final String? totalNumber;

  /// Callback on rsvp button pressed.
  final VoidCallback? onRsvpPressed;

  /// Callback on rsvp cancel button pressed.
  final VoidCallback? onRsvpCancelPressed;

  /// Is RSVPed.
  final bool isRsvped;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 16, bottom: 32),
      decoration: const BoxDecoration(
        color: Color(0xff03174C),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
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
          const SizedBox(height: 15),
          Text(
            '$time',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            '$description',
            maxLines: 5,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 21,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            '$totalNumber people RSVP’d',
            maxLines: 5,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.center,
            child: isRsvped
                ? Column(
                    children: [
                      PrimaryButtonIcon(
                        onPressed: () {},
                        iconData: Icons.timer_outlined,
                        label: 'RSVPed',
                        buttonColor: Colors.white,
                        iconColor: const Color(0xff03174C),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color(0xff03174C),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: onRsvpCancelPressed,
                        child: const Text(
                          'Cancel RSVP',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  )
                : PrimaryButtonIcon(
                    onPressed: onRsvpPressed,
                    iconData: Icons.timer_outlined,
                    label: 'RSVP to event',
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
