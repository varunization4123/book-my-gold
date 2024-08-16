import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'rewards_card_model.dart';
export 'rewards_card_model.dart';

class RewardsCardWidget extends StatefulWidget {
  const RewardsCardWidget({
    super.key,
    required this.title,
    required this.img,
    required this.description,
  });

  final String? title;
  final String? img;
  final String? description;

  @override
  State<RewardsCardWidget> createState() => _RewardsCardWidgetState();
}

class _RewardsCardWidgetState extends State<RewardsCardWidget> {
  late RewardsCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RewardsCardModel());

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
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent1,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondary,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
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
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 3.0),
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
              Text(
                valueOrDefault<String>(
                  widget.description,
                  'description',
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Nunito',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
