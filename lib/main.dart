import 'package:flutter/material.dart';

const flaver = ['オレンジソルベ', 'コットンキャンディ', 'ティーオーレ', 'サーティワンスーパーチョコミント', '抹茶', '杏仁豆腐', '大納言あずき', 'ロッキーロード®︎', 'ストロベリーチーズケーキ', 'ラブポーションサーティワン', 'ポッピングシャワー'];
const lank = ['46', '2', '29', '13', '50', '31', '23', '9', '5', '1', '殿堂入り'];

String egg(int level) {
  if (level >= 4) return '🧊';
  if (level >= 3) return '❄️';
  if (level >= 2) return '🍧';
  if (level >= 1) return '🍨';
  return '🍦';
}

void main() {
  final step = ValueNotifier(0);

  runApp(MaterialApp(home: ValueListenableBuilder(
    valueListenable: step,
    builder: (context, count, _) {
      final i = (count ~/ 2) % flaver.length;
      final level = (count ~/ 2) ~/ lank.length;

      return Scaffold(
        appBar: AppBar(title: Text('${egg(level)}サーティワン人気フレーバーランキング　${level + 1}巡目')),
        backgroundColor: count.isEven ? Colors.white : Colors.yellow[100],
        body: InkWell(
          onTap: () => step.value++,
          child: Center(
            child: Text(count.isEven ? 'Q: ${flaver[i]}' : 'A: ${lank[i]}位', style: TextStyle(fontSize: 64)),
          ),
        ),
      );
    },
  )));
}