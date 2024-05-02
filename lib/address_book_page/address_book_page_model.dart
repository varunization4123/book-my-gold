import '/flutter_flow/flutter_flow_util.dart';
import 'address_book_page_widget.dart' show AddressBookPageWidget;
import 'package:flutter/material.dart';

class AddressBookPageModel extends FlutterFlowModel<AddressBookPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
