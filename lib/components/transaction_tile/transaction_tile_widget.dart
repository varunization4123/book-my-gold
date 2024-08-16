import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'transaction_tile_model.dart';
export 'transaction_tile_model.dart';

class TransactionTileWidget extends StatefulWidget {
  const TransactionTileWidget({
    super.key,
    this.transactionDate,
    this.transactionValue,
    this.transactionGold,
    this.transactionGoldPrice,
    String? buy,
    String? sell,
    String? delivery,
    this.txId,
  })  : buy = buy ?? '',
        sell = sell ?? '',
        delivery = delivery ?? '';

  final String? transactionDate;
  final String? transactionValue;
  final String? transactionGold;
  final String? transactionGoldPrice;
  final String buy;
  final String sell;
  final String delivery;
  final int? txId;

  @override
  State<TransactionTileWidget> createState() => _TransactionTileWidgetState();
}

class _TransactionTileWidgetState extends State<TransactionTileWidget> {
  late TransactionTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionTileModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        'https://firebasestorage.googleapis.com/v0/b/jar-app-2kol48.appspot.com/o/icon-images%2Fgold%20icon.png?alt=media&token=122cc462-b2a5-418f-accd-261f2a202738',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Digital',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Nunito',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        Text(
                          ' Gold ',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Nunito',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            () {
                              if (widget.buy != '') {
                                return 'Purchased';
                              } else if (widget.sell != '') {
                                return 'Sold';
                              } else if (widget.delivery != '') {
                                return 'Delivered';
                              } else {
                                return '-';
                              }
                            }(),
                            'Purchased',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Nunito',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                    Text(
                      '${valueOrDefault<String>(
                        functions
                            .splitDateTimeString(valueOrDefault<String>(
                              widget.transactionDate,
                              '0',
                            ))
                            .first,
                        '0',
                      )} | ${valueOrDefault<String>(
                        functions
                            .splitDateTimeString(valueOrDefault<String>(
                              widget.transactionDate,
                              '0',
                            ))
                            .last,
                        '0',
                      )}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        '₹ ${valueOrDefault<String>(
                          widget.transactionValue,
                          '0',
                        )}',
                        '₹ 7000',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        '${valueOrDefault<String>(
                          widget.transactionGold,
                          '0',
                        )}gm  @ ₹${valueOrDefault<String>(
                          widget.transactionGoldPrice,
                          '0',
                        )} /gm',
                        '0.99 gm @ ₹6864.80 /gm',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 0.25,
            color: Color(0xFF505050),
          ),
        ],
      ),
    );
  }
}
