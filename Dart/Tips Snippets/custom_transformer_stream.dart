//custom_transformer_stream

class ErrorAbsorberTransformer<T> extends StreamTransformerBase<T, T>{
    final _controller = StreamController<T>.broadcast();
    ErrorAbsorberTransformer();

    @overridr
    Stream<T> bind(Stream<T> stream){  // [stream] is original stream before transform
        final sub = stream
            .handleError((_) => _controller.close(),)
            .listen(_controller.sink.add);

        _controller.onCancel = (){
            sub.cancel();
        }
        return _controller.stream;
    }
}

extension AbsorbErrors<T> on Stream<T>{
    Stream<T> absorbErrors() => transform(ErrorAbsorberTransformer());
}
