import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'price_option_model.dart';
export 'price_option_model.dart';

class PriceOptionWidget extends StatefulWidget {
  const PriceOptionWidget({
    super.key,
    required this.value,
  });

  final String? value;

  @override
  State<PriceOptionWidget> createState() => _PriceOptionWidgetState();
}

class _PriceOptionWidgetState extends State<PriceOptionWidget> {
  late PriceOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PriceOptionModel());

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
      width: 50.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent1,
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
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
