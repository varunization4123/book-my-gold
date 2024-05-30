import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'withdraw_full_model.dart';
export 'withdraw_full_model.dart';

class WithdrawFullWidget extends StatefulWidget {
  const WithdrawFullWidget({super.key});

  @override
  State<WithdrawFullWidget> createState() => _WithdrawFullWidgetState();
}

class _WithdrawFullWidgetState extends State<WithdrawFullWidget> {
  late WithdrawFullModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WithdrawFullModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent1,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.ten_k,
              color: FlutterFlowTheme.of(context).secondary,
              size: 14.0,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Withdraw full Investment',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Nunito',
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
