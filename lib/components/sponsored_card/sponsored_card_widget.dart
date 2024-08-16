import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'sponsored_card_model.dart';
export 'sponsored_card_model.dart';

class SponsoredCardWidget extends StatefulWidget {
  const SponsoredCardWidget({
    super.key,
    required this.title,
    required this.img,
  });

  final String? title;
  final String? img;

  @override
  State<SponsoredCardWidget> createState() => _SponsoredCardWidgetState();
}

class _SponsoredCardWidgetState extends State<SponsoredCardWidget> {
  late SponsoredCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SponsoredCardModel());

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
      width: MediaQuery.sizeOf(context).width * 0.33,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent1,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Container(
              width: 80.0,
              height: 80.0,
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
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
            child: Text(
              valueOrDefault<String>(
                widget.title,
                'Title',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nunito',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ].divide(const SizedBox(height: 16.0)),
      ),
    );
  }
}
