// my_plugin_io.dart
import 'dart:io';

class MyPluginIo implements MyPlugin{
    @override
    String m1(){
        return 'IO-m1';
    }
}

MyPlugin getMyPlugin() => MyPluginIo();
