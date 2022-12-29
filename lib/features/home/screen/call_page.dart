/* // ignore: depend_on_referenced_packages
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:tekction/features/home/screen/top_bar_live.dart';

class CallPage extends StatefulWidget {
  const CallPage({
    super.key,
    required this.channel,
    required this.isBroadcaster,
  });

  /// Channel name.
  final String channel;

  /// IS broadcaster.
  final bool isBroadcaster;

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            !widget.isBroadcaster
                ? Center(
                    child: _remoteVideo(widget.channel),
                  )
                : SizedBox(
                    width: size.width,
                    height: size.height,
                    child: Center(
                      child: _localUserJoined
                          ? AgoraVideoView(
                              controller: VideoViewController(
                                rtcEngine: _engine,
                                canvas: const VideoCanvas(uid: 0),
                              ),
                            )
                          : const CircularProgressIndicator(),
                    ),
                  ),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: TopBar(
                  showLiveInfo: true,
                  showGlass: true,
                  onBackPressed: () {
                    _engine.leaveChannel();
                    _engine.release();
                    context.router.pop();
                  },
                )),
          ],
        ),
      ),
    );
  }

  // Display remote user's video
  Widget _remoteVideo(String channel) {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: RtcConnection(channelId: channel),
        ),
      );
    } else {
      return const Text(
        'Please wait for host to join',
        textAlign: TextAlign.center,
      );
    }
  }
}
 */