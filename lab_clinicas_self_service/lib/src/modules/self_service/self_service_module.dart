import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/documents/documents_page.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/find_patient/find_patient_router.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/patient/patient_router.dart';
import 'package:lab_clinicas_self_service/src/repositories/patients/patients_repository.dart';
import 'package:lab_clinicas_self_service/src/repositories/patients/patients_repository_impl.dart';

import 'documents/scan/documents_scan_page.dart';
import 'documents/scan_confirm/documents_scan_confirm_page.dart';
import 'done/done_page.dart';
import 'self_service_controller.dart';
import 'self_service_page.dart';
import 'who_i_am/who_i_am_page.dart';

class SelfServiceModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => SelfServiceController()),
        Bind.lazySingleton<PatientsRepository>(
            (i) => PatientsRepositoryImpl(restClient: i()))
      ];

  @override
  String get moduleRouteName => '/self-service';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (_) => const SelfServicePage(),
        '/whoIAm': (_) => const WhoIAmPage(),
        '/find-patient': (_) => const FindPatientRouter(),
        '/patient': (_) => const PatientRouter(),
        '/documents': (_) => const DocumentsPage(),
        '/documents/scan': (_) => const DocumentsScanPage(),
        '/documents/scan/confirm': (_) => const DocumentsScanConfirmPage(),
        '/done': (_) => const DonePage(),
      };
}
