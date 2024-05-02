import '/flutter_flow/flutter_flow_util.dart';
import 'marketplace_page_widget.dart' show MarketplacePageWidget;
import 'package:flutter/material.dart';

class MarketplacePageModel extends FlutterFlowModel<MarketplacePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
