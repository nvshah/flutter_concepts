// recovering_stream_transformer.dart

extension Recover<T> on Stream<T>{
    Stream<T> onErrorRecoverWith(T? Function(Object error) onError) =>
        transform(StreamErrorHandler<T>(onError: onError));
}

class StreamErrorHandler<T> extends StreamTransformerBase<T, T>{
    final _controller = StreamController<T>.bradcast();
    final T? Function(Object error) onError;

    StreamErrorHandler({
        required this.onError,
    });

    @override
    Stream<T> bind(Stream<T> stream){
        final sub = stream.handleError((error){
            final value = onError(error);
            if(value != null){
                _controller.sink.add(value);
            }
        }).listen(_controller.sink.add)  // This will add any non-error event to our custom stream (ie _controller)

        _controller.onCancel = () {
            sub.cancel();
        }

        return _controller.stream;
    }
}

// --- Custom Stream via Generator

Stream<String> getNames() async*{
    yield 'Foo';
    yield 'Bar';
    throw Exception('Something Went Wrong');
    yield 'Jar';
}

Future<void> testIt() async{
    final names = getNames().onErrorRecoverWith((error){
        error.log();
        return 'Baz';
    });

    await for (final name in names){
        name.log();
    }
}

void main(){
    testIt();
}
