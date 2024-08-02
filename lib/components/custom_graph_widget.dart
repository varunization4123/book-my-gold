import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_graph_model.dart';
export 'custom_graph_model.dart';

class CustomGraphWidget extends StatefulWidget {
  const CustomGraphWidget({super.key});

  @override
  State<CustomGraphWidget> createState() => _CustomGraphWidgetState();
}

class _CustomGraphWidgetState extends State<CustomGraphWidget> {
  late CustomGraphModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomGraphModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: const BoxDecoration(),
      child: SizedBox(
        height: 180.0,
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Builder(
                builder: (context) {
                  if (FFAppState().xAxis.isNotEmpty) {
                    return SizedBox(
                      height: 230.0,
                      child: FlutterFlowLineChart(
                        data: [
                          FFLineChartData(
                            xData: FFAppState().xAxis,
                            yData: FFAppState().yAxis,
                            settings: LineChartBarData(
                              color: const Color(0xFFCD950C),
                              barWidth: 2.0,
                              isCurved: true,
                              preventCurveOverShooting: true,
                              dotData: const FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: true,
                                color: FlutterFlowTheme.of(context).accent1,
                              ),
                            ),
                          )
                        ],
                        chartStylingInfo: ChartStylingInfo(
                          enableTooltip: true,
                          tooltipBackgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          backgroundColor: const Color(0x00FFFFFF),
                          showGrid: true,
                          showBorder: false,
                        ),
                        axisBounds: const AxisBounds(
                          minX: 0.0,
                          minY: 5000.0,
                          maxX: 16.0,
                          maxY: 7500.0,
                        ),
                        xAxisLabelInfo: const AxisLabelInfo(),
                        yAxisLabelInfo: const AxisLabelInfo(),
                      ),
                    );
                  } else {
                    return Container(
                      width: double.infinity,
                      height: 230.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    );
                  }
                },
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(1.0, 1.0),
              child: Container(
                width: double.infinity,
                height: 109.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0x00FFFFFF),
                      FlutterFlowTheme.of(context).primaryBackground
                    ],
                    stops: const [0.45, 1.0],
                    begin: const AlignmentDirectional(-0.07, -1.0),
                    end: const AlignmentDirectional(0.07, 1.0),
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
