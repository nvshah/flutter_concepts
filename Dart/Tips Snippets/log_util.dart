//log_util.dart
import 'dart:developer' as devtools show log;

extension Log on Object? {
    void log() =>
        devtools.log(this?.toString() ?? '';
}
