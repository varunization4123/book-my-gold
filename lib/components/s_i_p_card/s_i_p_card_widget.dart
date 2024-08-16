import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 's_i_p_card_model.dart';
export 's_i_p_card_model.dart';

class SIPCardWidget extends StatefulWidget {
  const SIPCardWidget({
    super.key,
    required this.img,
    required this.text,
  });

  final String? img;
  final String? text;

  @override
  State<SIPCardWidget> createState() => _SIPCardWidgetState();
}

class _SIPCardWidgetState extends State<SIPCardWidget> {
  late SIPCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SIPCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.3,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).accent1,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent1,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          widget.img!,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.text,
                    'null',
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Nunito',
                        fontSize: 10.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
          ].divide(const SizedBox(height: 4.0)),
        ),
      ),
    );
  }
}
