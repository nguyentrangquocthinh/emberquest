import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';

void main() {
  final game = FlameGame();
  runApp(GameWidget(game: game));
}


git init
git add --all
git commit -m 'initial commit'
git remote add origin https://github.com/nguyentrangquocthinh/emberquest.git
git branch -M main
git push -u origin main