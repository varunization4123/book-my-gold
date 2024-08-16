import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'payment_provider_model.dart';
export 'payment_provider_model.dart';

class PaymentProviderWidget extends StatefulWidget {
  const PaymentProviderWidget({
    super.key,
    String? providerIcon,
    bool? isSelected,
  })  : providerIcon = providerIcon ??
            'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/phonepe-logo-icon.webp?alt=media&token=3689cfc6-06c3-4c45-8d01-44dce96a12e6',
        isSelected = isSelected ?? false;

  final String providerIcon;
  final bool isSelected;

  @override
  State<PaymentProviderWidget> createState() => _PaymentProviderWidgetState();
}

class _PaymentProviderWidgetState extends State<PaymentProviderWidget> {
  late PaymentProviderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentProviderModel());

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
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: valueOrDefault<Color>(
            widget.isSelected
                ? FlutterFlowTheme.of(context).secondary
                : FlutterFlowTheme.of(context).formBorder,
            FlutterFlowTheme.of(context).formBorder,
          ),
          width: 3.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.contain,
              image: CachedNetworkImageProvider(
                widget.providerIcon,
              ),
            ),
            shape: BoxShape.rectangle,
          ),
        ),
      ),
    );
  }
}
