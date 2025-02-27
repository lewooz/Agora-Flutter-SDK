/// GENERATED BY testcase_gen. DO NOT MODIFY BY HAND.

// ignore_for_file: deprecated_member_use,constant_identifier_names

import 'dart:async';
import 'dart:typed_data';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iris_tester/iris_tester.dart';
import 'package:iris_method_channel/iris_method_channel.dart';

void generatedTestCases(IrisTester irisTester) {
  testWidgets(
    'onLocalAudioSpectrum',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      MediaPlayerController mediaPlayerController = MediaPlayerController(
          rtcEngine: rtcEngine, canvas: const VideoCanvas());
      await mediaPlayerController.initialize();

      final onLocalAudioSpectrumCompleter = Completer<bool>();
      final theAudioSpectrumObserver = AudioSpectrumObserver(
        onLocalAudioSpectrum: (AudioSpectrumData data) {
          onLocalAudioSpectrumCompleter.complete(true);
        },
      );

      const int intervalInMS = 10;

      mediaPlayerController.registerMediaPlayerAudioSpectrumObserver(
        observer: theAudioSpectrumObserver,
        intervalInMS: intervalInMS,
      );

// Delay 500 milliseconds to ensure the registerMediaPlayerAudioSpectrumObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const List<double> dataAudioSpectrumData = [];
        const int dataDataLength = 10;
        const AudioSpectrumData data = AudioSpectrumData(
          audioSpectrumData: dataAudioSpectrumData,
          dataLength: dataDataLength,
        );

        final eventJson = {
          'data': data.toJson(),
        };

        if (!kIsWeb) {
          irisTester.fireEvent('AudioSpectrumObserver_onLocalAudioSpectrum',
              params: eventJson);
        } else {
          final ret = irisTester.fireEvent(
              'AudioSpectrumObserver_onLocalAudioSpectrum',
              params: eventJson);
// Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
// TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (ret) {
            if (!onLocalAudioSpectrumCompleter.isCompleted) {
              onLocalAudioSpectrumCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onLocalAudioSpectrumCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaPlayerController.unregisterMediaPlayerAudioSpectrumObserver(
          theAudioSpectrumObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterMediaPlayerAudioSpectrumObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets(
    'onRemoteAudioSpectrum',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      MediaPlayerController mediaPlayerController = MediaPlayerController(
          rtcEngine: rtcEngine, canvas: const VideoCanvas());
      await mediaPlayerController.initialize();

      final onRemoteAudioSpectrumCompleter = Completer<bool>();
      final theAudioSpectrumObserver = AudioSpectrumObserver(
        onRemoteAudioSpectrum: (List spectrums, int spectrumNumber) {
          onRemoteAudioSpectrumCompleter.complete(true);
        },
      );

      const int intervalInMS = 10;

      mediaPlayerController.registerMediaPlayerAudioSpectrumObserver(
        observer: theAudioSpectrumObserver,
        intervalInMS: intervalInMS,
      );

// Delay 500 milliseconds to ensure the registerMediaPlayerAudioSpectrumObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        const List<UserAudioSpectrumInfo> spectrums = [];
        const int spectrumNumber = 10;

        final eventJson = {
          'spectrums': spectrums,
          'spectrumNumber': spectrumNumber,
        };

        if (!kIsWeb) {
          irisTester.fireEvent('AudioSpectrumObserver_onRemoteAudioSpectrum',
              params: eventJson);
        } else {
          final ret = irisTester.fireEvent(
              'AudioSpectrumObserver_onRemoteAudioSpectrum',
              params: eventJson);
// Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
// TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (ret) {
            if (!onRemoteAudioSpectrumCompleter.isCompleted) {
              onRemoteAudioSpectrumCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onRemoteAudioSpectrumCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaPlayerController.unregisterMediaPlayerAudioSpectrumObserver(
          theAudioSpectrumObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterMediaPlayerAudioSpectrumObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );
}
