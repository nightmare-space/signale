import 'dart:io';
// #!/bin/bash

// # 打印256种颜色
// for ((color = 0; color < 256; color++)); do
//     contrast_color=$((color < 16 || (color > 231 && color < 244) || ((color - 16) % 36 / 6 > 2) ? 0 : 15))
//     printf "\e[48;5;%sm\e[38;5;%sm%3d\e[0m " "$color" "$contrast_color" "$color"
//     if ((color % 16 == 15)); then
//         echo # 每16个颜色换行
//     fi
// done
void main() {
  // 打印256种颜色
  for (int color = 0; color < 256; color++) {
    int contrastColor = (color < 16 || (color > 231 && color < 244) || ((color - 16) % 36 ~/ 6 > 2)) ? 0 : 15;
    stdout.write('\x1B[48;5;${color}m\x1B[38;5;${contrastColor}m${color.toString().padLeft(3, ' ')}\x1B[0m ');
    if (color % 16 == 15) {
      print(''); // 每16个颜色换行
    }
  }
}
