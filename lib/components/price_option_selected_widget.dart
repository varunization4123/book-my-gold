import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'price_option_selected_model.dart';
export 'price_option_selected_model.dart';

class PriceOptionSelectedWidget extends StatefulWidget {
  const PriceOptionSelectedWidget({
    super.key,
    required this.value,
  });

  final String? value;

  @override
  State<PriceOptionSelectedWidget> createState() =>
      _PriceOptionSelectedWidgetState();
}

class _PriceOptionSelectedWidgetState extends State<PriceOptionSelectedWidget> {
  late PriceOptionSelectedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PriceOptionSelectedModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: const Color(0xFFCD950C),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Text(
          valueOrDefault<String>(
            widget.value,
            '10',
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Nunito',
                color: FlutterFlowTheme.of(context).primaryBackground,
                letterSpacing: 0.0,
                fontWeight: FontWeight.normal,
              ),
        ),
      ),
    );
  }
}
