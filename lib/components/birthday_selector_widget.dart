import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'birthday_selector_model.dart';
export 'birthday_selector_model.dart';

class BirthdaySelectorWidget extends StatefulWidget {
  const BirthdaySelectorWidget({super.key});

  @override
  State<BirthdaySelectorWidget> createState() => _BirthdaySelectorWidgetState();
}

class _BirthdaySelectorWidgetState extends State<BirthdaySelectorWidget> {
  late BirthdaySelectorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BirthdaySelectorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(64.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              final datePickedDate = await showDatePicker(
                context: context,
                initialDate: getCurrentTimestamp,
                firstDate: DateTime(1900),
                lastDate: getCurrentTimestamp,
                builder: (context, child) {
                  return wrapInMaterialDatePickerTheme(
                    context,
                    child!,
                    headerBackgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    headerForegroundColor:
                        FlutterFlowTheme.of(context).primaryText,
                    headerTextStyle:
                        FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Nunito',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                            ),
                    pickerBackgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    pickerForegroundColor:
                        FlutterFlowTheme.of(context).primaryText,
                    selectedDateTimeBackgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    selectedDateTimeForegroundColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    actionButtonForegroundColor:
                        FlutterFlowTheme.of(context).primaryText,
                    iconSize: 18.0,
                  );
                },
              );

              if (datePickedDate != null) {
                safeSetState(() {
                  _model.datePicked = DateTime(
                    datePickedDate.year,
                    datePickedDate.month,
                    datePickedDate.day,
                  );
                });
              }
              _model.birthday = _model.datePicked;
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).formBorder,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 16.0,
                    ),
                    Text(
                      'Set Birthday',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito',
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(const SizedBox(width: 6.0)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await currentUserReference!.update(createUsersRecordData(
                  dateOfBirth: _model.datePicked,
                ));
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: 41.0,
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
