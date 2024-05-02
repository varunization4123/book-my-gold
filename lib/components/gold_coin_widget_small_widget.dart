import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'gold_coin_widget_small_model.dart';
export 'gold_coin_widget_small_model.dart';

class GoldCoinWidgetSmallWidget extends StatefulWidget {
  const GoldCoinWidgetSmallWidget({super.key});

  @override
  State<GoldCoinWidgetSmallWidget> createState() =>
      _GoldCoinWidgetSmallWidgetState();
}

class _GoldCoinWidgetSmallWidgetState extends State<GoldCoinWidgetSmallWidget> {
  late GoldCoinWidgetSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoldCoinWidgetSmallModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [FlutterFlowTheme.of(context).accent1, const Color(0xFFCD950C)],
            stops: const [0.0, 1.0],
            begin: const AlignmentDirectional(0.0, -1.0),
            end: const AlignmentDirectional(0, 1.0),
          ),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFCD950C),
                  FlutterFlowTheme.of(context).accent1
                ],
                stops: const [0.0, 1.0],
                begin: const AlignmentDirectional(-0.64, -1.0),
                end: const AlignmentDirectional(0.64, 1.0),
              ),
              shape: BoxShape.circle,
              border: Border.all(
                color: FlutterFlowTheme.of(context).btnBorder,
                width: 0.0,
              ),
            ),
            child: Icon(
              Icons.check_rounded,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}
