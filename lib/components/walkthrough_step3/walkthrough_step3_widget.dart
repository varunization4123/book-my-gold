import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'walkthrough_step3_model.dart';
export 'walkthrough_step3_model.dart';

class WalkthroughStep3Widget extends StatefulWidget {
  const WalkthroughStep3Widget({super.key});

  @override
  State<WalkthroughStep3Widget> createState() => _WalkthroughStep3WidgetState();
}

class _WalkthroughStep3WidgetState extends State<WalkthroughStep3Widget> {
  late WalkthroughStep3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalkthroughStep3Model());

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
        'You can even start an SIP to save in Gold',
        style: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Nunito',
              letterSpacing: 0.0,
            ),
      ),
    );
  }
}
