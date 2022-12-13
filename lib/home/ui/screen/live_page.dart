import 'package:flutter/material.dart';

import 'top_bar_live.dart';

class LivePage extends StatefulWidget {
  const LivePage({super.key});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  var isRsvped = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Stack(
        children: [
          Image.network(
            'https://picsum.photos/${size.width.toInt()}/${size.height.toInt()}',
          ),
          Column(
            children: [
              const TopBar(showLiveInfo: true),
              // TopBar(showLiveInfo: false),
              const Spacer(),
              RsvpContainer(
                isRsvped: isRsvped,
                imageUrl: 'https://picsum.photos/300/300',
                vendor: 'jackyoung',
                description: 'Live sale on all Apple products !!',
                time: 'Today 9:00PM',
                totalNumber: '629',
                onRsvpPressed: () {
                  setState(() {
                    isRsvped = !isRsvped;
                  });
                },
                onRsvpCancelPressed: () {
                  setState(() {
                    isRsvped = !isRsvped;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class LiveInfo extends StatelessWidget {
  const LiveInfo({
    super.key,
    required this.iconData,
    required this.text,
  });

  /// Icon data.
  final IconData iconData;

  /// Info.
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: 57,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Column(
        children: [
          Icon(
            iconData,
            color: Colors.white,
            size: 18,
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

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

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, this.onPressed, required this.label, this.textStyle});

  /// Callback when button is pressed.
  final VoidCallback? onPressed;

  /// Button Text.
  final String label;

  /// Text style.
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color(0xffEF5858),
        ),
        child: Text(
          label,
          style: textStyle ??
              const TextStyle(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}

class PrimaryButtonIcon extends StatelessWidget {
  const PrimaryButtonIcon({
    super.key,
    required this.label,
    required this.iconData,
    this.textStyle,
    this.onPressed,
    this.buttonColor,
    this.iconColor,
  });

  /// Callback when button is pressed.
  final VoidCallback? onPressed;

  /// Button Text.
  final String label;

  /// Button Color.
  final Color? buttonColor;

  /// Icon Color.
  final Color? iconColor;

  /// Text style.
  final TextStyle? textStyle;

  /// Icon data.
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: buttonColor ?? const Color(0xffEF5858),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: iconColor ?? Colors.white,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: textStyle ??
                  const TextStyle(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
