import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'add_new_address_model.dart';
export 'add_new_address_model.dart';

class AddNewAddressWidget extends StatefulWidget {
  const AddNewAddressWidget({super.key});

  @override
  State<AddNewAddressWidget> createState() => _AddNewAddressWidgetState();
}

class _AddNewAddressWidgetState extends State<AddNewAddressWidget> {
  late AddNewAddressModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNewAddressModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Enter your address',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Nunito',
                        color: FlutterFlowTheme.of(context).formBorder,
                        letterSpacing: 0.0,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Nunito',
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).formBorder,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondary,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: const EdgeInsets.all(12.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito',
                      letterSpacing: 0.0,
                    ),
                maxLines: 3,
                cursorColor: FlutterFlowTheme.of(context).secondary,
                validator: _model.textControllerValidator.asValidator(context),
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
                  if (_model.formKey.currentState == null ||
                      !_model.formKey.currentState!.validate()) {
                    return;
                  }

                  await currentUserReference!.update({
                    ...mapToFirestore(
                      {
                        'address':
                            FieldValue.arrayUnion([_model.textController.text]),
                      },
                    ),
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 43.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Add Address',
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
      ),
    );
  }
}
