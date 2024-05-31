import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'list_empty_component_model.dart';
export 'list_empty_component_model.dart';

class ListEmptyComponentWidget extends StatefulWidget {
  const ListEmptyComponentWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<ListEmptyComponentWidget> createState() =>
      _ListEmptyComponentWidgetState();
}

class _ListEmptyComponentWidgetState extends State<ListEmptyComponentWidget> {
  late ListEmptyComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListEmptyComponentModel());

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
        valueOrDefault<String>(
          widget.text,
          '[Empty}',
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Nunito',
              letterSpacing: 0.0,
            ),
      ),
    );
  }
}
