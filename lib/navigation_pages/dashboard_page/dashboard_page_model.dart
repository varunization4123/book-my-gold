import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_graph_widget.dart';
import '/components/grap_option_widget.dart';
import '/components/s_i_p_card_widget.dart';
import '/components/sponsored_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_page_widget.dart' show DashboardPageWidget;
import 'package:flutter/material.dart';

class DashboardPageModel extends FlutterFlowModel<DashboardPageWidget> {
  ///  Local state fields for this page.

  double? goldPrice = 6000.0;

  double? goldDifference = 0.0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Gold Price)] action in DashboardPage widget.
  ApiCallResponse? goldPriceFromApi;
  // Stores action output result for [Firestore Query - Query a collection] action in DashboardPage widget.
  AppSettingsRecord? readAppSettings;
  // Model for CustomGraph component.
  late CustomGraphModel customGraphModel;
  // Model for GrapOption component.
  late GrapOptionModel grapOptionModel1;
  // Model for GrapOption component.
  late GrapOptionModel grapOptionModel2;
  // Model for GrapOption component.
  late GrapOptionModel grapOptionModel3;
  // Model for GrapOption component.
  late GrapOptionModel grapOptionModel4;
  // Model for GrapOption component.
  late GrapOptionModel grapOptionModel5;
  // Model for GrapOption component.
  late GrapOptionModel grapOptionModel6;
  // Model for GrapOption component.
  late GrapOptionModel grapOptionModel7;
  // Model for SIPCard component.
  late SIPCardModel sIPCardModel1;
  // Model for SIPCard component.
  late SIPCardModel sIPCardModel2;
  // Model for SIPCard component.
  late SIPCardModel sIPCardModel3;
  // Model for SponsoredCard component.
  late SponsoredCardModel sponsoredCardModel1;
  // Model for SponsoredCard component.
  late SponsoredCardModel sponsoredCardModel2;
  // Model for SponsoredCard component.
  late SponsoredCardModel sponsoredCardModel3;
  // Model for SponsoredCard component.
  late SponsoredCardModel sponsoredCardModel4;
  // Model for SponsoredCard component.
  late SponsoredCardModel sponsoredCardModel5;
  // Model for SponsoredCard component.
  late SponsoredCardModel sponsoredCardModel6;
  // Model for SponsoredCard component.
  late SponsoredCardModel sponsoredCardModel7;
  // Model for SponsoredCard component.
  late SponsoredCardModel sponsoredCardModel8;

  @override
  void initState(BuildContext context) {
    customGraphModel = createModel(context, () => CustomGraphModel());
    grapOptionModel1 = createModel(context, () => GrapOptionModel());
    grapOptionModel2 = createModel(context, () => GrapOptionModel());
    grapOptionModel3 = createModel(context, () => GrapOptionModel());
    grapOptionModel4 = createModel(context, () => GrapOptionModel());
    grapOptionModel5 = createModel(context, () => GrapOptionModel());
    grapOptionModel6 = createModel(context, () => GrapOptionModel());
    grapOptionModel7 = createModel(context, () => GrapOptionModel());
    sIPCardModel1 = createModel(context, () => SIPCardModel());
    sIPCardModel2 = createModel(context, () => SIPCardModel());
    sIPCardModel3 = createModel(context, () => SIPCardModel());
    sponsoredCardModel1 = createModel(context, () => SponsoredCardModel());
    sponsoredCardModel2 = createModel(context, () => SponsoredCardModel());
    sponsoredCardModel3 = createModel(context, () => SponsoredCardModel());
    sponsoredCardModel4 = createModel(context, () => SponsoredCardModel());
    sponsoredCardModel5 = createModel(context, () => SponsoredCardModel());
    sponsoredCardModel6 = createModel(context, () => SponsoredCardModel());
    sponsoredCardModel7 = createModel(context, () => SponsoredCardModel());
    sponsoredCardModel8 = createModel(context, () => SponsoredCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    customGraphModel.dispose();
    grapOptionModel1.dispose();
    grapOptionModel2.dispose();
    grapOptionModel3.dispose();
    grapOptionModel4.dispose();
    grapOptionModel5.dispose();
    grapOptionModel6.dispose();
    grapOptionModel7.dispose();
    sIPCardModel1.dispose();
    sIPCardModel2.dispose();
    sIPCardModel3.dispose();
    sponsoredCardModel1.dispose();
    sponsoredCardModel2.dispose();
    sponsoredCardModel3.dispose();
    sponsoredCardModel4.dispose();
    sponsoredCardModel5.dispose();
    sponsoredCardModel6.dispose();
    sponsoredCardModel7.dispose();
    sponsoredCardModel8.dispose();
  }
}
