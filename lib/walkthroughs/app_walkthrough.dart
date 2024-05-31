import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/walkthrough_step1_widget.dart';
import '/components/walkthrough_step2_widget.dart';
import '/components/walkthrough_step3_widget.dart';

// Focus widget keys for this walkthrough
final containerVcfz0bry = GlobalKey();
final containerJwkfyeql = GlobalKey();
final containerSx22cg5d = GlobalKey();

/// App Walkthrough
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: containerVcfz0bry,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughStep1Widget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: containerJwkfyeql,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughStep2Widget(),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: containerSx22cg5d,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => const WalkthroughStep3Widget(),
          ),
        ],
      ),
    ];
