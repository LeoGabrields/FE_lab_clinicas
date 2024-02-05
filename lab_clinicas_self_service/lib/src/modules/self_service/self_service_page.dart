import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SelfServicePage extends StatefulWidget {
  const SelfServicePage({super.key});

  @override
  State<SelfServicePage> createState() => _SelfServicePageState();
}

class _SelfServicePageState extends State<SelfServicePage>
    with MessageViewMixin {
  final controller = Injector.get<SelfServiceController>();

  @override
  void initState() {
    super.initState();
    messageListener(controller);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.startProcess();
      effect(() {
        var baseRoute = '/self-service/';
        final step = controller.step;

        switch (step) {
          case FormStpes.none:
            return;
          case FormStpes.whoIAm:
            baseRoute += 'whoIAm';
          case FormStpes.findPatient:
            baseRoute += 'find-patient';
          case FormStpes.patient:
            baseRoute += 'patient';
          case FormStpes.documents:
            baseRoute += 'documents';
          case FormStpes.done:
            baseRoute += 'done';
          case FormStpes.restart:
            Navigator.of(context)
                .popUntil(ModalRoute.withName('/self-service'));
            controller.startProcess();
            return;
        }

        Navigator.of(context).pushNamed(baseRoute);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
