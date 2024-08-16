import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'grap_option_model.dart';
export 'grap_option_model.dart';

class GrapOptionWidget extends StatefulWidget {
  const GrapOptionWidget({
    super.key,
    required this.value,
    required this.isSelected,
  });

  final String? value;
  final bool? isSelected;

  @override
  State<GrapOptionWidget> createState() => _GrapOptionWidgetState();
}

class _GrapOptionWidgetState extends State<GrapOptionWidget> {
  late GrapOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GrapOptionModel());

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
        color: valueOrDefault<Color>(
          widget.isSelected!
              ? const Color(0xFFCD950C)
              : FlutterFlowTheme.of(context).accent1,
          FlutterFlowTheme.of(context).accent1,
        ),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: valueOrDefault<Color>(
            widget.isSelected!
                ? const Color(0xFFCD950C)
                : FlutterFlowTheme.of(context).btnBorder,
            FlutterFlowTheme.of(context).btnBorder,
          ),
          width: 0.5,
        ),
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
                color: valueOrDefault<Color>(
                  widget.isSelected!
                      ? FlutterFlowTheme.of(context).primaryBackground
                      : FlutterFlowTheme.of(context).primaryText,
                  FlutterFlowTheme.of(context).primaryText,
                ),
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
