// my_plugin_web
import 'dart:html' as html;

class MyPluginWeb implements MyPlugin{
    @override
    String m1(){
        return 'Web-m1';
    }
}

MyPlugin getMyPlugin() => MyPluginWeb();
