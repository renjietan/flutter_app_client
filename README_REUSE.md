### flutter create 项目名称
### 需拷贝的文件夹
  - ./assets
  - ./lib ：注意不要拷贝lib文件夹中的generated_plugin_registrant.dart，这个文件是自动生成的
  - ./test
  - ./analysis_options.yaml
  - ./build_iconfont.py
  - ./README .md
  - ./README_ERROR.md
  - ./README_GIT.md
  - ./README_UPDATE.md
  
### 添加第三方包
- ./pubspec.yaml中，仅仅需要拷贝第三方包
- ./pubspec.yaml中，添加图片资源

### android原生代码修改
  - android/app/build.gradle
    - defaultConfig中的minSdkVersion 为19
  - android/app/src/main/AndroidManifest.xml
    - <application>标签上方添加
        <uses-permission android:name="android.permission.INTERNET" />
        <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
        <uses-permission android:name="android.permission.WAKE_LOCK" />

### flutter代码修改
- 修改lib文件夹中所有的flutter_app_client的引用，修改为项目名称


        