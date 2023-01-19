### **大纲**
1级大纲|二级大纲|描述
|:-------:|:-------------: | :----------:|
规范篇||为了便于后期维护，指定的代码规范
基础变量篇||对dart变量的使用
数据类型篇||简单描述dart常规语法
类||对dart关于类的描述以及使用
方法||对dart方法的描述以及使用
多线程||对线程的描述
assets||静态资源的使用
lib|| 项目业务逻辑代码
||api|接口集合
||config|框架配置文件
||init|工程初始化
||page|主要页面
||router|路由封装
||store|状态管理器
||utils|工具栏
||main|工程入口
代码健壮性||有关代码健壮性的注意事项
代码耦合性||有关代码耦合性的具体实现
获取APK的MD5值||
原生打包||
其他||
--- 
### **flutter介绍**
- 万物皆widget，万物皆继承自Object
---
### **规范篇**：
- 命名
  - 类的命名：大驼峰命名法
  - 方法的命名：小驼峰命名法
    - UI类中方法尽量标识为私有方法，防止变量污染
  - 变量的命名：小驼峰命名法
    - UI类中变量尽量标识为私有方法，防止变量污染
  - 公有与私有
    - 公有：既可供外部访问，亦可供内部访问
    - 私有：在变量或方法名前加_，代表私有，只供内部访问
  - page文件命名
    - 单词之间用”_“分隔，例如user_manager_mixin
- 注释
  - 每个文件头部添加注释，声明作者、编写日期、后台人员以及备注等
  - 每个方法名称添加注释，声明方法用途
  - 布局中尽可能多的对布局块添加注释
---
### **基础变量篇**
- Var
  - 声明变量并自动推断类型
  - 与js中var的区别
    - 同一变量可被重复定义
    - flutter中var不可被重复定义，而且第一次赋值后，类型立即被确认，再次赋值时，必须与第一次赋值的类型一致
- dynamic
  - 声明变量，并且类型可变
  - 类似js中的var
- final
  - 赋值一旦定下来，不可再变动
  - 如果运行时，才能获得的值，使用final修饰
  - final 修饰的对象，只要这个对象的字段不是final或const。那么他们是可以再次被赋值的
- const
  - 隐式的 final，不单单可以约束变量，也可以约束变量的值
  - 如果在编译时，就要立刻获得值，使用const
  - 与final的区别是，const不可赋值为不确定值，例如随机数
  - ④const修饰的对象，里面的(字段)一切都是 const。不能再次进行赋值
---
### **数据类型篇**
- num
  - 数字类型，int和double都是num类型的子类
  - 如果不知道值为int还是double类型，可使用num类型
- Int
  - 整数
- Double
  - 浮点数
- Boolean
  - 布尔变量
- List
  - 数组
  - List数组可指定成员的数据类型：List<String> test = [“s”]
- Map
  - 键值对
  - Map集合可指定成员的数据类型。例如Map<String, Array> test = {“a”: []}
---
### **类**
- 常规类
- Get/set：主要用于实体类
- 继承(extends)：子类继承父类，可调用父类公用方法
- 重写(override): 主要用于重写父类方法
- 混入: with/mixins：组合类
- 枚举：enum
- 抽象类 abstract
---
### **方法**
- void: 无返回值的方法
- future: 与promise类似，返回异步操作的构造方法
- 声明返回类型, 例如
  ```
  Map<String,dynamic> _getList(){
		///Todo someing
	}
  返回值为Map集合，且键名为String类型，键值为dynamic类型
  ```
- staic：静态方法,编译时，不执行，但会被初始化
- 异步: async/await 返回Future
  ```
  Future Login(params) async {
    return await Api.login(params);
  }
  ```
- 参数可选：
  ```
  void(name, {age: 18}) {
    /// todo something
  }
  ```
---
### **多线程**
- 内存独立，无需做线程锁处理
- 线程之间通过sendport来实现通信
---
### **目录结构**
> .dart_tool---------------------------编译后生成
>>
> andorid------------------------------原生安卓夹
>>
> assets-------------------------------静态资源夹
>>
> build--------------------------------编译后的打包文件夹
>>
> ios----------------------------------原生IOS文件夹
>>
> lib----------------------------------主要代码输送文件
>>  api--------------------------------api接口类
>>>
>>  config-----------------------------工程配置
>>>
>>  init-------------------------------工程初始化
>>>
>>  mobileUI---------------------------内部封装UI库
>>>
>>  page-------------------------------移动应用页面
>>>
>>  route------------------------------路由
>>>
>>  store------------------------------状态管理器
>>>
>>  tabBar-----------------------------底部导航对应的1级页面
>>>
>>  utils------------------------------工具类
>>>
>>  main.dart--------------------------入口方法
>>
> test---------------------------------测试文件夹
>>
> .flutter-plugins---------------------安装第三方库后生成，通过pubspec.yaml与此文件进行对比，来判断第三方库是否安装或者更新
>>
> .flutter-plugins-dependencies--------安装第三方库后生成，记录第三方库的安装信息
>>
> build_iconfont.py--------------------python写的自动化脚本，将字体图标转为class类
>>
> pubspec.lock-------------------------安装第三方库后生成，
>>
> pubspec.yaml-------------------------flutte工程配置文件，类似package.json
>>
> readme-------------------------------框架手册
>>
> readme_error-------------------------记录一些复杂问题的解决方案
>>
> readme_update------------------------版本更新日志


---

### **pubspec**
工程配置文件， 类似package.json
- name: 包名
- description： 备注
- version： +前面是版本名称， +后面是版本号
- environment： SDK环境
- dependencies: 第三方包以及flutter 原生包的引入，生产环境（打包时）或开发环境中，此节点下所有的包将被编译
- dev_dependencies：第三方包以及flutter 原生包的引入，开发环境中，此节点下所有的包将被编译
- uses-material-design: 是否允许使用flutter自带的icons
- assets：静态资源路径
- fonts：字体图标路径
---
### **assets**
- 将图片或字体图标等静态资源放入此文件下
- 然后在pubspec中引入图片路径
---
### **lib/api**
接口集合
- 由于目前服务请求使用了多线程，所以需摒弃老的接口方式，采用新的接口书写方式，具体如下:
  ```
  static Future login(Map<String, dynamic> params) {
    return TheadAxios.getData(
      url: "/auth/login1",
      params: params,
    );
  }
  ```
- api中文件应以swagger的模块作为文件名进行命名，并以swagger最后一个单词作为方法名称，
  - swagger中地址为`auth/user/login` 那么应当新建一个名为`auth`的文件
  - 在`anth`文件中，新建login方法
---

### **lib/config**
框架配置文件
- config
  - navigatorKey: 监听页面路由用到的key，可通过此key找到当前的路由信息，例如context、state等
  - baseUrl：服务请求的基础路径
  - whiteList：白名单（发起服务请求时，白名单的地址不验证Token）
- enum
  - 枚举类
---
### **lib/init**
工程初始化
- app_init：
  - 在执行runApp前，添加异常日志捕获
- default_app：
  - 在执行runapp前，初始化路由、本地缓存、状态管理器、服务请求封装类
---
### **lib/mobileUI**
内部UI库
### **lib/model**
数据层
- 姜后台返回的数据，复制到  https://javiercbk.github.io/中，可得到返回结果
- 在此文件夹下，新增对应页面的model文件，例如LoginPage页面，新增model时，文件名与类名应取名为LoginModel
- 将之前得到的返回结果，赋值到此dart文件中
- 如何使用？
  - LoginModel lm =  UserManagerModel.fromJson(json);
  - lm.code => 20000
  - lm.msg => "后台返回的消息"
  - lm.data => "后台返回的数据"
### **lib/page**
主要页面以及业务逻辑
- index：
  - 类似于layout，最大的容器页面，
  - 包含底部Tab栏、各tab的appbar以及content
  - 点击不同的Tab对appbar以及content进行切换
- splash: 
  - 此页面主要用于移动页面启动时，判断本地是否存在token，若存在则直接进入到首页，否则进入到登录页
- 页面新增 
  - 以新增用户管理（userManager）页为例，
    - 新增一个文件夹userManager
    - 在userManager文件夹下新增一个user_manager.dart文件，此文件主要用于画页面，不含业务逻辑
    - 在userManager文件夹下新增一个user_manager_mixin.dart文件,此文件主要用于书写业务逻辑，
      ```
      mixin TabHomeMixin<T extends StatefulWidget> on State<T> {
        @override
        void initState() {
          super.initState();
        }
      }
      ```
    - 在userManager文件夹下新增一个user_manager_model.dart文件,此文件主要用于书写业务逻辑，
      - 以{ code: 20000, data: {name: 1}, msg: "" }为例，将json/Map数据复制到 https://javiercbk.github.io/json_to_dart/  之中，点击【Generate Dart】进行转化
      - 将转化结果复制至user_manager_model.dart中
      - 如何使用？
        - lm.code => 20000
        - lm.msg => "后台返回的消息"
        - lm.data => "后台返回的数据"
---
### **lib/router**
路由
- async_animation
  - 页面跳转时的动画类
- route_map
  - 路由地址命名
- router：
  - 路由封装类
    - goto: 根据router_map中命名的路由进行跳转，如下：
     ```
      CustomRouter.goto(context, "/home");
     ``` 
    - gotwidget: 通过UI类名进行跳转
    ```
      CustomRouter.gotoWidget(context, PageClass);
    ```
    - asyncGotoWidget：通过UI类名进行跳转，当页面返回时，可接受回传的参数
    ```
    CustomRouter.asyncGotoWidget(context, PageClass).then((res) {
      /// res 是页面返回，回传的参数
    });
    ```
- switch_animation 
  - 页面跳转时的动画类
---

### **lib/store**
状态管理器
- provider
  - 封装的状态管理器的一个类
    - 如何新增一个状态？？？
      - 第一步
      ```
        class TestStatus with ChangeNotifier {
          int _test;

          TestStatus(this._test);

          int get test => _test;

          set test(int number) {
            _test = number;
            notifyListeners();
          }
        }
      ```
      - 第二步在MultiProvider的providers数组中添加
      ```
      ChangeNotifierProvider.value(value: TestStatus(0)),
      ```
    - 如何使用？
      - 获取值：Provider.of<TestStatus>(context, listen: false).test;
      - 赋值：Provider.of<TestStatus>(context, listen: false).test = 1111
      - 监听：
      ```
        Consumer(BuildContext context, TestStatus testStatus, Widget child) {
          ///当值发生变化时，触发
        }
      ```
---
### **lib/utils**
工具栏
- core
  - http
    - request: 
      - 路由封装，由于使用了多线程，放弃使用服务的拦截器，制作服务请求的基础配置
    - TheadAxios
      - 多线程：将服务请求放入多线程使用
  - click
    - 通过判断俩次点击事件是否超过1000秒，超过返回false，不超过返回true
    - 主要用于home键双击间隔过短，此时将退出APP
  - event
    - bus总线
    - 如何使用?
      - 发布消息：
        ```
        XEvent.post("msg", 1);
        ```
      - 订阅消息
        ```
        StreamSubscription xe;
        xe = XEvent.on("msg", (res) {
          print(res);
        });
        ```
      - 根据消息名称，取消订阅，并关闭对应的流
        ```
        XEvent.cancel("msg", xe);
        ```
      - 根据消息名称，取消订阅，关闭所有的流
        ```
        XEvent.cancelAll("msg");
        ```
  - path
    - 文件路径工具类
  - XUpdate
    - 自动更新类
- IconFont
  - 字体图标类，
    - 在vscode应用市场中，安装python插件
    - 按下快捷键ctrl + shift + p,输入python， 选择 Python create Terminal
    - 将iconfont.ttf、iconfont.css文件、放入assets/fonts中
    - 在根目录下运行python3 build_iconfont.py，将自动解析字体图标文件，并生成字体图标类
    备注：安装python3.5以上版本，否则有些语法无法支持
- sputils
  - 封装的缓存类
- utils
  - 常用工具类
- verify
  - 验证类
---
### **lib/main**
框架入口类
- 初始化 线程池---负载均衡，防止线程过载

### **代码健壮性**
代码编写过程中，应采用防御式编程思想，也就是说程序/方法不应该因传入错误数据而被破坏，哪怕是其他由自己编写方法和程序产生的错误数据。这种思想是将可能出现的错误造成的影响控制在有限的范围内。
- assets断言: 若方法或类的 参数为空时，可能影响到程序执行，使用assets 断言提醒
  - `assets（test > 10）`,此模式只在debug生效
- 类的构造函数的默认值
  ```
  class Test3 extends StatefulWidget {
    final String name;
    Test3({Key key, this.name = ""}) : super(key: key);

    @override
    _Test3State createState() => _Test3State();
  }
  ```
- 判null
  - 当绑定的变量`test`不确定是否不为null时，应使用`"${test?? ''}"`（若test为null则取值为空字符串）
  - 当不确定变量`test`是否为null时，在调用方法时，如test.add(3)，应为test?.add(3)（若test为null，则返回null，否则执行后面的add方法）
- 模板字符串
  - `${test}`
### **代码耦合性**
应采用模块化编程思想，提高代码的复用性，并根据不同的层面进行分离
- 业务逻辑与UI隔离
  ```
  mixin TabHomeMixin<T extends StatefulWidget> on State<T> {
    // ignore: unused_field
    int counter = 0;
    @override
    void initState() {
      super.initState();
    }

    void incrementCounter() {
      setState(() {
        counter++;
      });
    }
  }
  class TabHome extends StatefulWidget {
    TabHome({Key key}) : super(key: key);

    @override
    _TabHomeState createState() => _TabHomeState();
  }
  class _TabHomeState extends State<TabHome> with TabHomeMixin {
    @override
    Widget build(BuildContext context) {
      return Container();
    }
  }

  ```


### **获取APK的MD5值**
CertUtil -hashfile  apk路径\app-release.apk MD5
### **原生打包**
cd 到android目录下 执行./gradlew assembleRelease








### **其他**
- 代码块必须用;隔开
- 颜色值：[颜色转化] (https://tool.lu/color/), 将蓝湖中RGBA的值转化为 flutter 颜色值
- 注意变量类型
  - 例如 `1=='1'` // false
  - 例如 `Map<String, String> test = {“a”: “1”}`  //good
  - 例如 `List<String> test = ['1']` //good
  - 例如 `int i = 1.0` // error
  - 例如 `double i = 1` // good
- 支持链式语法：
  ```
  []..addAll["3"].addAll["4"];
  ```
---



### **框架整体逻辑**
- main:执行AppInit.run
- lib/init/app_init：定义了run方法，此方法主要利用异常捕获机制，监听DefaultApp.run()
- lib/init/default_app: 
  - 定义了run方法，此方法用于确认手势绑定是否已就绪以及初始化状态管理、缓存管理器
  - 并使用runApp()去启动第一个widget类，即MyApp();
  - MyApp（）构造了一个MaterialApp的widget类，所有的页面 将会放在MaterialApp的body中进行渲染
---
