import 'package:flutter/widgets.dart';
import 'package:vhv_video_player/vhv_video_player.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Extract url 1', () {
    final videoId = extractVideoId('https://www.youtube.com/watch?v=GpS36BWaV5Y');
    debugPrint(videoId);
    expect(videoId, 'GpS36BWaV5Y');
  });
  
  test('Extract url 2', () {
    final videoId = extractVideoId('https://www.youtube.com/embed/r2Xtk1dS_dE');
    debugPrint(videoId);
    expect(videoId, 'r2Xtk1dS_dE');
  });

  test('Extract url 3', ()  {
    final videoId = extractVideoId('https://youtu.be/GpS36BWaV5Y&t=194s');
    debugPrint(videoId);
    expect(videoId, 'GpS36BWaV5Y');
  });

  test('Extract url 4', ()  {
    expect(() {
      final videoId = extractVideoId('https://www.youtube.com');
      debugPrint(videoId);
    }, throwsException);
  });
}
