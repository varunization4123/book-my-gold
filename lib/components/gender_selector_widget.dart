import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'gender_selector_model.dart';
export 'gender_selector_model.dart';

class GenderSelectorWidget extends StatefulWidget {
  const GenderSelectorWidget({super.key});

  @override
  State<GenderSelectorWidget> createState() => _GenderSelectorWidgetState();
}

class _GenderSelectorWidgetState extends State<GenderSelectorWidget> {
  late GenderSelectorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenderSelectorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(56.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      _model.maleSelected = true;
                      _model.femaleSelected = false;
                      _model.pnsSelected = false;
                    });
                    setState(() {
                      _model.selectedGender = 'Male';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        _model.maleSelected
                            ? const Color(0xFFCD950C)
                            : FlutterFlowTheme.of(context).accent1,
                        FlutterFlowTheme.of(context).accent1,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            _model.selectedGender = 'Male';
                          });
                        },
                        child: Text(
                          'Male',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Nunito',
                                    color: valueOrDefault<Color>(
                                      _model.maleSelected
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      _model.maleSelected = false;
                      _model.femaleSelected = true;
                      _model.pnsSelected = false;
                    });
                    setState(() {
                      _model.selectedGender = 'Female';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        _model.femaleSelected
                            ? const Color(0xFFCD950C)
                            : FlutterFlowTheme.of(context).accent1,
                        FlutterFlowTheme.of(context).accent1,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        'Female',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Nunito',
                              color: valueOrDefault<Color>(
                                _model.femaleSelected
                                    ? FlutterFlowTheme.of(context)
                                        .primaryBackground
                                    : FlutterFlowTheme.of(context).primaryText,
                                FlutterFlowTheme.of(context).primaryText,
                              ),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      _model.maleSelected = false;
                      _model.femaleSelected = false;
                      _model.pnsSelected = true;
                    });
                    setState(() {
                      _model.selectedGender = 'Prefer Not to Say';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        _model.pnsSelected
                            ? const Color(0xFFCD950C)
                            : FlutterFlowTheme.of(context).accent1,
                        FlutterFlowTheme.of(context).accent1,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        'Prefer Not to Say',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Nunito',
                              color: valueOrDefault<Color>(
                                _model.pnsSelected
                                    ? FlutterFlowTheme.of(context)
                                        .primaryBackground
                                    : FlutterFlowTheme.of(context).primaryText,
                                FlutterFlowTheme.of(context).primaryText,
                              ),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 16.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await currentUserReference!.update(createUsersRecordData(
                  gender: _model.selectedGender,
                ));
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'Confirm',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nunito',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
