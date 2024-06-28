import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'game_button_model.dart';
export 'game_button_model.dart';

class GameButtonWidget extends StatefulWidget {
  const GameButtonWidget({super.key});

  @override
  State<GameButtonWidget> createState() => _GameButtonWidgetState();
}

class _GameButtonWidgetState extends State<GameButtonWidget> {
  late GameButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 74.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: Image.asset(
            'assets/images/SpinBtn.png',
          ).image,
        ),
      ),
    );
  }
}
