import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'custom_list_tile_model.dart';
export 'custom_list_tile_model.dart';

class CustomListTileWidget extends StatefulWidget {
  const CustomListTileWidget({
    super.key,
    String? item,
  }) : item = item ?? 'null';

  final String item;

  @override
  State<CustomListTileWidget> createState() => _CustomListTileWidgetState();
}

class _CustomListTileWidgetState extends State<CustomListTileWidget> {
  late CustomListTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomListTileModel());
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
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondary,
            width: 1.0,
          ),
        ),
        child: Visibility(
          visible: widget.item != 'null',
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              valueOrDefault<String>(
                widget.item,
                'null',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nunito',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
