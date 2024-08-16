import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'walkthrough_step2_model.dart';
export 'walkthrough_step2_model.dart';

class WalkthroughStep2Widget extends StatefulWidget {
  const WalkthroughStep2Widget({super.key});

  @override
  State<WalkthroughStep2Widget> createState() => _WalkthroughStep2WidgetState();
}

class _WalkthroughStep2WidgetState extends State<WalkthroughStep2Widget> {
  late WalkthroughStep2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalkthroughStep2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Text(
        'Click here to \"Withdraw\" gold.',
        style: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Nunito',
              letterSpacing: 0.0,
            ),
      ),
    );
  }
}
