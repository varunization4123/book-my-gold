import '/components/f_a_qfor_support_widget.dart';
import '/components/support_topic_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'support_page_widget.dart' show SupportPageWidget;
import 'package:flutter/material.dart';

class SupportPageModel extends FlutterFlowModel<SupportPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SupportTopic component.
  late SupportTopicModel supportTopicModel1;
  // Model for SupportTopic component.
  late SupportTopicModel supportTopicModel2;
  // Model for SupportTopic component.
  late SupportTopicModel supportTopicModel3;
  // Model for SupportTopic component.
  late SupportTopicModel supportTopicModel4;
  // Model for SupportTopic component.
  late SupportTopicModel supportTopicModel5;
  // Model for SupportTopic component.
  late SupportTopicModel supportTopicModel6;
  // Model for FAQforSupport component.
  late FAQforSupportModel fAQforSupportModel1;
  // Model for FAQforSupport component.
  late FAQforSupportModel fAQforSupportModel2;
  // Model for FAQforSupport component.
  late FAQforSupportModel fAQforSupportModel3;
  // Model for FAQforSupport component.
  late FAQforSupportModel fAQforSupportModel4;

  @override
  void initState(BuildContext context) {
    supportTopicModel1 = createModel(context, () => SupportTopicModel());
    supportTopicModel2 = createModel(context, () => SupportTopicModel());
    supportTopicModel3 = createModel(context, () => SupportTopicModel());
    supportTopicModel4 = createModel(context, () => SupportTopicModel());
    supportTopicModel5 = createModel(context, () => SupportTopicModel());
    supportTopicModel6 = createModel(context, () => SupportTopicModel());
    fAQforSupportModel1 = createModel(context, () => FAQforSupportModel());
    fAQforSupportModel2 = createModel(context, () => FAQforSupportModel());
    fAQforSupportModel3 = createModel(context, () => FAQforSupportModel());
    fAQforSupportModel4 = createModel(context, () => FAQforSupportModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    supportTopicModel1.dispose();
    supportTopicModel2.dispose();
    supportTopicModel3.dispose();
    supportTopicModel4.dispose();
    supportTopicModel5.dispose();
    supportTopicModel6.dispose();
    fAQforSupportModel1.dispose();
    fAQforSupportModel2.dispose();
    fAQforSupportModel3.dispose();
    fAQforSupportModel4.dispose();
  }
}
