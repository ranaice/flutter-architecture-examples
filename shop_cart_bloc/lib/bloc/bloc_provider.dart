import 'package:flutter/material.dart';

// Every bloc will have to extend this class so it can close the streams.
// https://www.didierboelens.com/2018/12/reactive-programming---streams---bloc---practical-use-cases/
abstract class BlocBase {
  void dispose();
}

// We wrap the InheritedWidget with this stateful widget because the InheritedWidget has no dispose method.
// When wrapping we can access the dispose method to close streams when the widget is destroyed.
// Basically we will the parent widgets with the BlocProvider and provide a bloc, so every widget down the tree will
// have access to the bloc, simply by calling BlocProvider.of<T>(context)
class BlocProvider<T extends BlocBase> extends StatefulWidget {
  final Widget child;
  final T bloc;

  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  // This 'of' method is just a convenient method to provide the bloc to the widgets down the tree
  static T of<T extends BlocBase>(BuildContext context) {
    _BlocProviderInherited<T> provider =
        context.getElementForInheritedWidgetOfExactType<_BlocProviderInherited<T>>()?.widget;
    return provider?.bloc;
  }
}

// Just calls the dispose method to close streams and builds the InheritedWidget
class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {
  @override
  void dispose() {
    widget.bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new _BlocProviderInherited<T>(
      bloc: widget.bloc,
      child: widget.child,
    );
  }
}

// We will store the bloc in this InheritedWidget to make it available to other widgets below the widget tree, this way
// we will be able to access the bloc current state.
class _BlocProviderInherited<T> extends InheritedWidget {
  final T bloc;

  _BlocProviderInherited({
    Key key,
    @required Widget child,
    @required this.bloc,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;
}
