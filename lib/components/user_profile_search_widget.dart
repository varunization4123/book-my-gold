import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'user_profile_search_model.dart';
export 'user_profile_search_model.dart';

class UserProfileSearchWidget extends StatefulWidget {
  const UserProfileSearchWidget({
    super.key,
    String? name,
    String? phoneNumber,
    String? photoUrl,
  })  : name = name ?? '[Name]',
        phoneNumber = phoneNumber ?? '[phone_number]',
        photoUrl = photoUrl ?? '[profile_photo]';

  final String name;
  final String phoneNumber;
  final String photoUrl;

  @override
  State<UserProfileSearchWidget> createState() =>
      _UserProfileSearchWidgetState();
}

class _UserProfileSearchWidgetState extends State<UserProfileSearchWidget> {
  late UserProfileSearchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileSearchModel());
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
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).formBorder,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.network(
                    widget.photoUrl,
                  ).image,
                ),
                shape: BoxShape.circle,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.phoneNumber,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nunito',
                        letterSpacing: 0.0,
                      ),
                ),
                Text(
                  widget.name,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Lato',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ].divide(const SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}
