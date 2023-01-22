// my_plugin.dart
import 'my_plugin_stub.dart'
    if (dart.library.io) 'my_plugin_io.dart'
    if (dart.library.html) 'my_plugin_web.dart';

abstract class MyPlugin{
    factory MyPlugin() = getMyPlugin
    String m1();
}
