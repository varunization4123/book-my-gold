import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'support_topic_model.dart';
export 'support_topic_model.dart';

class SupportTopicWidget extends StatefulWidget {
  const SupportTopicWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  final String? title;
  final String? icon;

  @override
  State<SupportTopicWidget> createState() => _SupportTopicWidgetState();
}

class _SupportTopicWidgetState extends State<SupportTopicWidget> {
  late SupportTopicModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportTopicModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48.0,
          height: 48.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent1,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    widget.icon!,
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          valueOrDefault<String>(
            widget.title,
            'title',
          ),
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Nunito',
                letterSpacing: 0.0,
              ),
        ),
      ].divide(const SizedBox(height: 6.0)),
    );
  }
}
