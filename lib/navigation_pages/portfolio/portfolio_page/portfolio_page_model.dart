import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'portfolio_page_widget.dart' show PortfolioPageWidget;
import 'package:flutter/material.dart';

class PortfolioPageModel extends FlutterFlowModel<PortfolioPageWidget> {
  ///  Local state fields for this page.

  double? goldPrice = 6000.0;

  double? goldDifference = 1.0;

  List<dynamic> transactions = [];
  void addToTransactions(dynamic item) => transactions.add(item);
  void removeFromTransactions(dynamic item) => transactions.remove(item);
  void removeAtIndexFromTransactions(int index) => transactions.removeAt(index);
  void insertAtIndexInTransactions(int index, dynamic item) =>
      transactions.insert(index, item);
  void updateTransactionsAtIndex(int index, Function(dynamic) updateFn) =>
      transactions[index] = updateFn(transactions[index]);

  double currentPrice = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Buy Price API)] action in PortfolioPage widget.
  ApiCallResponse? goldPriceFromApi;
  // Stores action output result for [Custom Action - decryptApiResponse] action in PortfolioPage widget.
  String? decryptedApiResponse;
  // Stores action output result for [Backend Call - API (User Transactions API)] action in PortfolioPage widget.
  ApiCallResponse? userTransactionApi;
  // Stores action output result for [Custom Action - decryptApiResponse] action in PortfolioPage widget.
  String? decryptedUserTransactionApi;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
