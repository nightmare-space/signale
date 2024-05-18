import 'dart:math';

int get randomColor {
  Random random = Random();
  int color = random.nextInt(256); // 随机选择一个颜色
  return color;
}

String colorString(int color,String data) {
  int contrastColor = (color < 16 || (color > 231 && color < 244) || ((color - 16) % 36 ~/ 6 > 2)) ? 0 : 15;
  return '\x1B[48;5;${color}m\x1B[38;5;${contrastColor}m${data}\x1B[0m';
}

void main() {
  int color = randomColor;
  print(colorString(color,'123'));
  print(colorString(color,'123'));
}
