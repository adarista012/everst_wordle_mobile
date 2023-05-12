import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wordle_mobile/views/character_ar_view/ar_view_controller.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart' as vector;

class CharacterArView extends StatelessWidget {
  const CharacterArView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder<ArViewController>(
        init: ArViewController(),
        builder: (_) {
          return _.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : defaultTargetPlatform == TargetPlatform.iOS
                  ? ARKitSceneView(
                      onARKitViewCreated: (ARKitController controller) {
                        final node = ARKitNode(
                          geometry: ARKitSphere(radius: 0.1),
                          position: vector.Vector3(0.0, -0.5, -2.0),
                        );
                        controller.add(node);
                      },
                    )
                  : ArCoreView(
                      onArCoreViewCreated: (ArCoreController controller) {
                        final node = ArCoreNode(
                          image: ArCoreImage(
                              bytes: _.bytes, width: 480, height: 480),
                          position: vector.Vector3(0.0, -0.5, -2.0),
                        );
                        controller.addArCoreNode(node);
                      },
                    );
        },
      ),
    );
  }
}
