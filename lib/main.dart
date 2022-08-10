//程序的主入口
import 'package:isolate/isolate.dart';

import 'init/app_init.dart';

final Future<LoadBalancer> loadBalancer =
    LoadBalancer.create(2, IsolateRunner.spawn);

void main() => AppInit.run();
