import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'walkthrough_step1_model.dart';
export 'walkthrough_step1_model.dart';

class WalkthroughStep1Widget extends StatefulWidget {
  const WalkthroughStep1Widget({super.key});

  @override
  State<WalkthroughStep1Widget> createState() => _WalkthroughStep1WidgetState();
}

class _WalkthroughStep1WidgetState extends State<WalkthroughStep1Widget> {
  late WalkthroughStep1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalkthroughStep1Model());

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
        'You can click here to \"Buy Gold\" instantly',
        textAlign: TextAlign.center,
        style: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Nunito',
              letterSpacing: 0.0,
            ),
      ),
    );
  }
}
