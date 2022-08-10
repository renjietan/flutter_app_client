### 常规问题解决：
- 杀死dart命令
  - windows
    - taskkill /F /IM dart.exe
  - macos
    - killall -9 dart
  
- lockfile
  - 路径：
    - flutter folder/bin/cache/lockfile
  
- 打包出现问题时
  - 第一种
    > 删除根目录下.packages .pubspec.lock .flutter-plugins .flutter-plugins-dependencies文件
    
    > 删除pubspec.yaml中的 dependencies 所有第三方包，然后撤回，迫使第三方包重新安装并重新编译

    > cd 到android目录下 执行./gradlew assembleRelease
    
  - 第二种：若以上步骤无法解决，请按下列方法解决、
    > 删除根目录下.packages .pubspec.lock .flutter-plugins .flutter-plugins-dependencies文件

    > 删除locakfile

    > 删除pubspec.yaml中的 dependencies 所有第三方包，然后撤回

    > 杀死dart

    > cd 到android目录下 执行./gradlew assembleRelease
    
- 当控制台出现dart lock字样的报错信息时
  - 删除lockfile文件即可：flutter folder/bin/cache/lockfile


- 当显示模拟器未授权时，
  - 将F:\sdks\.android 下的adbkey、adbkey.pub 拷贝到别处，以防万一
  - 杀死adb.exe进程
  - 删除所有模拟器
  - 重新连接即可