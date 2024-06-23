import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  CallPage({Key? key, required this.callID, required this.userName})
      : super(key: key);
  final String callID;
  final String userName;

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    print(_auth.currentUser!.email.toString(),);
    return ZegoUIKitPrebuiltCall(
      appID:
          460459670, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          '3bcda310cedb852b45fc557581256e31be49bb1a5f607b7d748cbe559a323d9c', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: _auth.currentUser!.email.toString(),
      userName: userName,
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
    );
  }
}
