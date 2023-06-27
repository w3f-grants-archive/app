import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dtim/domain/utils/functions.dart';
import 'package:dtim/router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:matrix/matrix.dart' as link;

import '../platform_infos.dart';

class CallAction {
  final link.CallSession call;
  // final link.GroupCall? gcall;
  CallAction(this.call);

  link.CallState get _state => call.state;
  bool get speakerOn => call.speakerOn;
  bool get isMicrophoneMuted => call.isMicrophoneMuted;
  bool get isLocalVideoMuted => call.isLocalVideoMuted;
  bool get isScreensharingEnabled => call.screensharingEnabled;
  bool get isRemoteOnHold => call.remoteOnHold;
  bool get voiceonly => call.type == link.CallType.kVoice;
  bool get connecting => call.state == link.CallState.kConnecting;
  bool get connected => call.state == link.CallState.kConnected;

  List<Action> buildActionButtons() {
    final switchCameraButton = Action(
      tooltip: 'switchCamera',
      onPressed: _switchCamera,
      backgroundColor: Colors.black45,
      child: const Icon(Icons.switch_camera),
    );

    final hangupButton = Action(
      onPressed: () async {
        if (call.isRinging) {
          call.reject();
        } else {
          call.hangup();
        }
      },
      tooltip: 'Hangup',
      backgroundColor: _state == link.CallState.kEnded ? Colors.black45 : Colors.red,
      child: const Icon(Icons.call_end),
    );

    final answerButton = Action(
      onPressed: () => call.answer(),
      tooltip: 'Answer',
      backgroundColor: Colors.green,
      child: const Icon(Icons.phone),
    );

    final muteMicButton = Action(
      tooltip: 'muteMic',
      onPressed: () => call.setMicrophoneMuted(!call.isMicrophoneMuted),
      backgroundColor: isMicrophoneMuted ? Colors.blueGrey : Colors.black45,
      child: Icon(isMicrophoneMuted ? Icons.mic_off : Icons.mic),
    );

    final screenSharingButton = Action(
      tooltip: 'screenSharing',
      onPressed: _screenSharing,
      backgroundColor: isScreensharingEnabled ? Colors.blueGrey : Colors.black45,
      child: const Icon(Icons.desktop_mac),
    );

    final holdButton = Action(
      tooltip: 'hold',
      onPressed: () => call.setRemoteOnHold(!call.remoteOnHold),
      backgroundColor: isRemoteOnHold ? Colors.blueGrey : Colors.black45,
      child: Icon(isRemoteOnHold ? Icons.pause : Icons.pause),
    );

    final muteCameraButton = Action(
      tooltip: 'muteCam',
      onPressed: () => call.setLocalVideoMuted(!call.isLocalVideoMuted),
      backgroundColor: isLocalVideoMuted ? Colors.yellow : Colors.black45,
      child: Icon(isLocalVideoMuted ? Icons.videocam_off : Icons.videocam),
    );

    // final closeGroupCallButton = Action(
    //   tooltip: 'closeGroupCall',
    //   onPressed: () => gcall!.terminate(),
    //   backgroundColor: Colors.red,
    //   child: const Icon(Icons.close),
    // );

    switch (_state) {
      case link.CallState.kRinging:
      case link.CallState.kInviteSent:
      case link.CallState.kCreateAnswer:
      case link.CallState.kConnecting:
        return call.isOutgoing ? [hangupButton] : [answerButton, hangupButton];
      case link.CallState.kConnected:
        return [
          muteMicButton,
          //switchSpeakerButton,
          if (!voiceonly && !kIsWeb) switchCameraButton,
          if (!voiceonly) muteCameraButton,
          if (PlatformInfos.isMobile || PlatformInfos.isWeb) screenSharingButton,
          holdButton,
          hangupButton,
        ];
      case link.CallState.kEnded:
        return [
          hangupButton,
        ];
      case link.CallState.kFledgling:
        break;
      case link.CallState.kWaitLocalMedia:
        break;
      case link.CallState.kCreateOffer:
        break;
      default:
        break;
    }
    return [];
  }

  void _switchCamera() async {
    if (call.localUserMediaStream != null) {
      await Helper.switchCamera(
        call.localUserMediaStream!.stream!.getVideoTracks()[0],
      );
      if (PlatformInfos.isMobile) {
        call.facingMode == 'user' ? call.facingMode = 'environment' : call.facingMode = 'user';
      }
    }
  }

  void _screenSharing() async {
    if (PlatformInfos.isAndroid) {
      if (!call.screensharingEnabled) {
        FlutterForegroundTask.init(
          androidNotificationOptions: AndroidNotificationOptions(
            channelId: 'notification_channel_id',
            channelName: 'Foreground Notification',
            channelDescription: 'Foreground Notification',
          ),
          iosNotificationOptions: const IOSNotificationOptions(),
          foregroundTaskOptions: const ForegroundTaskOptions(),
        );
        FlutterForegroundTask.startService(
          notificationTitle: "screen sharing",
          notificationText: "screen sharing",
        );
      } else {
        FlutterForegroundTask.stopService();
      }
    }

    call.setScreensharingEnabled(!call.screensharingEnabled);
  }
}

class GCallAction {
  final link.GroupCall call;
  final Function? onChange;
  GCallAction(this.call, {this.onChange});

  String get _state => call.state;
  // bool get speakerOn => call.speakerOn;
  bool get isMicrophoneMuted => call.isMicrophoneMuted;
  bool get isLocalVideoMuted => call.isLocalVideoMuted;
  bool get isScreensharingEnabled => call.screensharingEnabled;
  // bool get isRemoteOnHold => call.remoteOnHold;
  bool get voiceonly => call.type == 'm.voice';
  bool get connecting => call.state == link.GroupCallState.Entering;
  bool get connected => call.state == link.GroupCallState.Entered;

  List<Action> buildActionButtons() {
    final switchCameraButton = Action(
      tooltip: 'switchCamera',
      onPressed: _switchCamera,
      backgroundColor: Colors.black45,
      child: const Icon(Icons.switch_camera),
    );

    final hangupButton = Action(
      onPressed: () async {
        final result = await showModalActionSheet<int>(
          style: AdaptiveStyle.iOS,
          context: globalCtx(),
          actions: [
            const SheetAction(
              icon: Icons.info,
              label: 'leave call',
              key: 1,
            ),
            const SheetAction(
              icon: Icons.info,
              label: 'terminate call',
              key: 2,
            ),
          ],
        );
        if (result == 1) {
          await call.leave();
        } else if (result == 2) {
          await call.terminate();
          return onChange?.call();
        }
      },
      tooltip: 'Hangup',
      backgroundColor: _state == link.GroupCallState.Ended ? Colors.black45 : Colors.red,
      child: const Icon(Icons.call_end),
    );

    // final answerButton = Action(
    //   onPressed: () => call.answer(),
    //   tooltip: 'Answer',
    //   backgroundColor: Colors.green,
    //   child: const Icon(Icons.phone),
    // );

    final muteMicButton = Action(
      tooltip: 'muteMic',
      onPressed: () async {
        await call.setMicrophoneMuted(!call.isMicrophoneMuted);
        return onChange?.call();
      },
      backgroundColor: isMicrophoneMuted ? Colors.blueGrey : Colors.black45,
      child: Icon(isMicrophoneMuted ? Icons.mic_off : Icons.mic),
    );

    final screenSharingButton = Action(
      tooltip: 'screenSharing',
      onPressed: _screenSharing,
      backgroundColor: isScreensharingEnabled ? Colors.blueGrey : Colors.black45,
      child: const Icon(Icons.desktop_mac),
    );

    // final holdButton = Action(
    //   tooltip: 'hold',
    //   onPressed: () => call.setRemoteOnHold(!call.remoteOnHold),
    //   backgroundColor: isRemoteOnHold ? Colors.blueGrey : Colors.black45,
    //   child: Icon(isRemoteOnHold ? Icons.pause : Icons.pause),
    // );

    final muteCameraButton = Action(
      tooltip: 'muteCam',
      onPressed: () async {
        await call.setLocalVideoMuted(!call.isLocalVideoMuted);
        return onChange?.call();
      },
      backgroundColor: isLocalVideoMuted ? Colors.yellow : Colors.black45,
      child: Icon(isLocalVideoMuted ? Icons.videocam_off : Icons.videocam),
    );

    printError(call.type);
    switch (_state) {
      case "entering":
        return [hangupButton];
      case "entered":
        return [
          muteMicButton,
          //switchSpeakerButton,
          if (!voiceonly && !kIsWeb) switchCameraButton,
          if (!voiceonly) muteCameraButton,
          screenSharingButton,
          // holdButton,
          hangupButton,
        ];
      case "ended":
        return [
          hangupButton,
        ];
      default:
        break;
    }
    return [hangupButton];
  }

  void _switchCamera() async {
    if (call.localUserMediaStream != null) {
      await Helper.switchCamera(
        call.localUserMediaStream!.stream!.getVideoTracks()[0],
      );
      if (PlatformInfos.isMobile) {
        // call.facingMode == 'user' ? call.facingMode = 'environment' : call.facingMode = 'user';
      }
    }
    onChange?.call();
  }

  void _screenSharing() async {
    if (PlatformInfos.isAndroid) {
      if (!call.screensharingEnabled) {
        FlutterForegroundTask.init(
          androidNotificationOptions: AndroidNotificationOptions(
            channelId: 'notification_channel_id',
            channelName: 'Foreground Notification',
            channelDescription: 'Foreground Notification',
          ),
          iosNotificationOptions: const IOSNotificationOptions(),
          foregroundTaskOptions: const ForegroundTaskOptions(),
        );
        FlutterForegroundTask.startService(
          notificationTitle: "screen sharing",
          notificationText: "screen sharing",
        );
      } else {
        FlutterForegroundTask.stopService();
      }
    }

    // call.setScreensharingEnabled(!call.screensharingEnabled);
    onChange?.call();
  }
}

class Action {
  final String tooltip;
  final Color backgroundColor;
  final Widget child;
  final Function onPressed;
  Action({required this.backgroundColor, required this.child, required this.onPressed, required this.tooltip});
}
