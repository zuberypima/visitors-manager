import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 460459670, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:  '3bcda310cedb852b45fc557581256e31be49bb1a5f607b7d748cbe559a323d9c', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: '123456',
      userName: 'Juma',
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
    );
  }
}
