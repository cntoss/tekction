import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:hive/hive.dart';
import 'package:preferences/preferences.dart';
import 'package:tekction/core/db/hive_initializer.dart';
import 'package:tekction/core/db/hive_manager.dart';
import 'package:tekction/features/home/widget/basket_widget.dart';
import 'package:tekction/features/home/widget/chat_listview.dart';
import 'package:tekction/features/home/widget/stream_text_row.dart';
import 'package:tekction/locator.dart';

import '../widget/live_product.dart';
import 'top_bar_live.dart';

class LiveStreaming extends StatefulWidget {
  final bool? isBroadCaster;
  const LiveStreaming({super.key, this.isBroadCaster});

  @override
  State<LiveStreaming> createState() => _LiveStreamingState();
}

class _LiveStreamingState extends State<LiveStreaming> {
  final _sizeConfig = locator<SizeConfig>();
  bool isChatPage = true;
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;
  final commentController = TextEditingController();

  int userBid = 0;

  List<String> chatList = [
    'name1',
    'Amazinggg!!',
    'jiminfan',
    'Show us the model in black',
    'karla18',
    'Can i get it resized?',
    'Karla18 just joined',
    'Karla18 just joined',
    'Karla18 just joined',
    'Karla18 just joined',
    'Karla18 just joined',
    'Karla18 just joined',
    'Karla18 just joined',
    'Karla18 just joined',
    'Karla18 just joined',
    'Karla18 just joined',
  ];

  @override
  void initState() {
    initBid();
    initAgora();
    super.initState();
  }

  initBid() {
    Hive.box(HIVE_DB_KEY).watch(key: "USER_BID_KEY").listen((event) {
      print(
          "BoxEvent | key: ${event.key}, value: ${event.value}, deleted: ${event.deleted},");
      setState(() {
        userBid = event.value;
      });
    });
  }

  saveBid() {
    HiveManager().write("USER_BID_KEY", userBid);
    context.router.pop();
  }

  Future<void> initAgora() async {
    //create the engine
    _engine = createAgoraRtcEngine();

    if (widget.isBroadCaster ?? false) {
      await _engine.initialize(
        const RtcEngineContext(
          appId: appID,
          channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
        ),
      );
    } else {
      await _engine.initialize(
        const RtcEngineContext(appId: appID),
      );
    }

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

    await _engine.enableVideo();
    if (widget.isBroadCaster ?? false) {
      await _engine.startPreview();
    }

    if (widget.isBroadCaster ?? false) {
      await _engine.joinChannel(
        token: token,
        channelId: channel,
        uid: 0,
        options: const ChannelMediaOptions(
          clientRoleType: ClientRoleType.clientRoleBroadcaster,
        ),
      );
    } else {
      await _engine.joinChannel(
        token: token,
        channelId: channel,
        uid: 0,
        options: const ChannelMediaOptions(
          clientRoleType: ClientRoleType.clientRoleAudience,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ColorManager.appColor,
        body: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              SizedBox(
                height: isChatPage
                    ? _sizeConfig.blockSizeH * 88
                    : _sizeConfig.screenH,
                child: Stack(
                  children: [
                    !(widget.isBroadCaster ?? false)
                        ? Center(
                            child: _remoteVideo(channel),
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
                    PageView(
                      onPageChanged: (int page) {
                        setState(() {
                          isChatPage = page == 0;
                        });
                      },
                      children: [
                        Stack(
                          children: [
                            _blueOverlay,
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: TopBar(
                                showLiveInfo: true,
                                showGlass: true,
                                showReport: true,
                                onBackPressed: () {
                                  _engine.leaveChannel();
                                  _engine.release();
                                  Navigator.pop(context);
                                },
                                onBuyPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(
                                          builder: (context, setModalState) {
                                        return Container(
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    child: Image.network(
                                                      'https://picsum.photos/1000/500',
                                                      width: double.infinity,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text('Top Bid: Rs.$userBid'),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setModalState(() {
                                                        userBid = userBid - 5;
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(),
                                                      ),
                                                      child: const Icon(
                                                        Icons.remove,
                                                        size: 16,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Row(
                                                    children: [
                                                      const Text('Rs. '),
                                                      Text(
                                                        '$userBid',
                                                        style: const TextStyle(
                                                            fontSize: 50),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 8),
                                                  InkWell(
                                                    onTap: () {
                                                      setModalState(() {
                                                        userBid = userBid + 5;
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(),
                                                      ),
                                                      child: const Icon(
                                                        Icons.add,
                                                        size: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30),
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom()
                                                          .copyWith(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .resolveWith<
                                                                Color>((Set<
                                                                    MaterialState>
                                                                states) {
                                                      const Set<MaterialState>
                                                          interactiveStates =
                                                          <MaterialState>{
                                                        MaterialState.disabled,
                                                      };
                                                      if (states.any(
                                                          interactiveStates
                                                              .contains)) {
                                                        return ColorManager
                                                            .disableBtn;
                                                      }
                                                      return ColorManager
                                                          .activeIcon;
                                                    }),
                                                    padding: MaterialStateProperty
                                                        .resolveWith<
                                                                EdgeInsetsGeometry>(
                                                            (Set<MaterialState>
                                                                states) {
                                                      return const EdgeInsets
                                                          .symmetric(
                                                        vertical: 14,
                                                        horizontal: 12,
                                                      );
                                                    }),
                                                  ),
                                                  onPressed: saveBid,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        'Submit',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: ThemeData()
                                                            .textTheme
                                                            .headline1
                                                            ?.copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                      ),
                                                      const SizedBox(width: 16),
                                                      SvgPicture.asset(
                                                        AssetsPath.seeMoreIcon,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                            ],
                                          ),
                                        );
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                            const Positioned(
                              bottom: 0,
                              right: horizontalPadding,
                              child: BasketWidget(),
                            ),
                            _chat
                          ],
                        ),
                        Stack(
                          children: [
                            _blueOverlay,
                            Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: TopBar(
                                  showLiveInfo: true,
                                  showGlass: false,
                                  showReport: false,
                                  onBackPressed: () {
                                    _engine.leaveChannel();
                                    _engine.release();
                                    Navigator.pop(context);
                                  },
                                )),
                            Positioned(
                                top: _sizeConfig.screenH / 2,
                                left: 0,
                                right: 0,
                                child: const LiveProductWidget())
                          ],
                        )
                      ],
                    ),
                    /* Positioned(
                      bottom: 0,
                      left: 0,
                      top: _sizeConfig.screenH / 2,
                      right: 0,
                      child: Container(
                        height: _sizeConfig.screenH,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Color(0xff03174c)],
                        )),
                      ),
                    ), */
                  ],
                ),
              ),
              if (isChatPage)
                Expanded(
                  child: StreamTextRow(
                    commentController: commentController,
                    onSendPressed: () {
                      setState(() {
                        chatList.add(commentController.text.trim());
                        commentController.clear();
                      });
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

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
        style: TextStyle(color: Colors.white, fontSize: 20),
      );
    }
  }

  Widget get _blueOverlay => Positioned(
        bottom: 0,
        left: 0,
        top: _sizeConfig.blockSizeH * 60,
        right: 0,
        child: Container(
          height: _sizeConfig.screenH,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, ColorManager.appColor],
          )),
        ),
      );

  Widget get _chat => Positioned(
        bottom: 0,
        left: 0,
        child: SizedBox(
          height: _sizeConfig.screenH / 3,
          child: ChatListView(
            chatList: chatList,
          ),
        ),
      );
}
