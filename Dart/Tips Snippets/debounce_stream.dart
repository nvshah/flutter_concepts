class DebounceTransformer<T> extends StreamTransformerBase<T, T>{
    final Duration duration;
    final _controller = StreamController<T>.broadcast();

    DebounceTransformer(this.duration);

    @override
}
