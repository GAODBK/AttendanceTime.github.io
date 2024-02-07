# 记账本

plagiarism Flutter project.

## 入门

该项目是Flutter应用程序的起点。

这是第一个Flutter项目，一些资源可以让你开始:

- [Create a Stunning Splash Screen Flutter闪屏页面](https://www.youtube.com/watch?v=baa0SlEDimk)
- [Flutter Snake Game📱](https://www.youtube.com/watch?v=9jvJyLhJP00&list=PLlvRDpXh1Se4wZWOWs8yapI8AS_fwDHzf&index=10)

有关Flutter开发入门的帮助，请查看
[在线文档](https:// docs.flutter.Dev/)，提供教程，
比如 我第一次学明白的官方示例`[showModalBottomSheet](https://api.flutter.dev/flutter/material/showModalBottomSheet.html)`
移动开发指南和完整的API参考

```dart
name: LYG_JZB
description: A new Flutter project.
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=2.19.0 <3.0.0'
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2

  provider:
#  ^6.0.5
  intl: ^0.17.0
  fl_chart: ^0.55.2
  flutter_slidable: ^2.0.0
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  shared_preferences: ^2.2.2
  video_player: ^2.7.2
  lottie: ^2.3.2
  dio: ^5.4.0
  #  flutter_playout: ^2.0.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

flutter:
  uses-material-design: true
  assets:
    - assets/
```
以我的文件夹举例：在
> /d/code/FLUTTERCODE/fle/android/app/src/main/res/mipmap-xhdpi 等

这几个文件夹 由于装程序的 `logo图标` 
安装程序时 在桌面的那个logo

> /d/code/FLUTTERCODE/fle/build/app/outputs/apk/debug
<br> /d/code/FLUTTERCODE/fle/build/app/outputs/flutter-apk

当程序稀里糊涂跑坏了，在文件夹里删 apk 文件

> /d/code/FLUTTERCODE/fle/android/app/src/main/AndroidManifest.xml

这个文件的 第四排 是这样的形式：`android:label="记账本X"`
可以修改软件在桌面的名字
