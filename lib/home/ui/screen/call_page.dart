import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:tekction/home/ui/screen/top_bar_live.dart';

import '../../../common/app_constant.dart';

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
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  @override
  void dispose() {
    super.dispose();
    _engine.leaveChannel();
    _engine.release();
  }

  Future<void> initAgora() async {
    //create the engine
    _engine = createAgoraRtcEngine();

    await _engine.initialize(
      RtcEngineContext(
        appId: appID,
        channelProfile: widget.isBroadcaster
            ? ChannelProfileType.channelProfileLiveBroadcasting
            : null,
      ),
    );

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
        onLeaveChannel: (connection, stats) {
          debugPrint(
              '[onLeaveChannel] connection: ${connection.toJson()}, token: $token');
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );

    if (widget.isBroadcaster) {
      await _engine.enableVideo();
      await _engine.startPreview();
    }

    await _engine.joinChannel(
      token: token,
      channelId: widget.channel,
      uid: 0,
      options: ChannelMediaOptions(
        clientRoleType: widget.isBroadcaster
            ? ClientRoleType.clientRoleBroadcaster
            : ClientRoleType.clientRoleAudience,
      ),
    );
  }

  // Create UI with local view and remote view
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          widget.isBroadcaster
              ? Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
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
                )
              : Center(
                  child: _remoteVideo(widget.channel),
                ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: TopBar(
                showLiveInfo: true,
                showGlass: true,
                onBackPressed: () {
                  super.dispose();
                  _engine.leaveChannel();
                  _engine.release();
                  Navigator.pop(context);
                },
              )),
        ],
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
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}
