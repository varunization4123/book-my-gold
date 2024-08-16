import '/backend/api_requests/api_calls.dart';
import '/components/gold_coin_widget/gold_coin_widget_widget.dart';
import '/components/gold_coin_widget_small/gold_coin_widget_small_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'withdraw_successful_page_widget.dart' show WithdrawSuccessfulPageWidget;
import 'package:flutter/material.dart';

class WithdrawSuccessfulPageModel
    extends FlutterFlowModel<WithdrawSuccessfulPageWidget> {
  ///  Local state fields for this page.

  int? txId;

  String? invoiceId;

  ///  State fields for stateful widgets in this page.

  // Model for GoldCoinWidget component.
  late GoldCoinWidgetModel goldCoinWidgetModel;
  // Stores action output result for [Backend Call - API (Invoice API)] action in Row widget.
  ApiCallResponse? invoiceApi;
  // Stores action output result for [Custom Action - decryptApiResponse] action in Row widget.
  String? decryptedSellInvoiceApiResponse;
  // Model for GoldCoinWidgetSmall component.
  late GoldCoinWidgetSmallModel goldCoinWidgetSmallModel1;
  // Model for GoldCoinWidgetSmall component.
  late GoldCoinWidgetSmallModel goldCoinWidgetSmallModel2;

  @override
  void initState(BuildContext context) {
    goldCoinWidgetModel = createModel(context, () => GoldCoinWidgetModel());
    goldCoinWidgetSmallModel1 =
        createModel(context, () => GoldCoinWidgetSmallModel());
    goldCoinWidgetSmallModel2 =
        createModel(context, () => GoldCoinWidgetSmallModel());
  }

  @override
  void dispose() {
    goldCoinWidgetModel.dispose();
    goldCoinWidgetSmallModel1.dispose();
    goldCoinWidgetSmallModel2.dispose();
  }
}
