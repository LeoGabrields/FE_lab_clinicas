import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/models/self_service_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../models/patient_model.dart';

enum FormStpes {
  none,
  whoIAm,
  findPatient,
  patient,
  documents,
  done,
  restart,
}

class SelfServiceController with MessageStateMixin {
  final _step = ValueSignal(FormStpes.none);
  var _model = const SelfServiceModel();

  SelfServiceModel get model => _model;
  FormStpes get step => _step.value;

  void startProcess() {
    _step.forceUpdate(FormStpes.whoIAm);
  }

  void setWhoIAmDataStepAndNext(String name, String lastName) {
    _model = _model.copyWith(name: () => name, lastName: () => lastName);
    _step.forceUpdate(FormStpes.findPatient);
  }

  void clearForm() {
    _model = _model.clear();
  }

  void goToFormPatient(PatientModel? patient) {
    _model = _model.copyWith(patient: () => patient);
    _step.forceUpdate(FormStpes.patient);
  }

  void restartProcess() {
    _step.forceUpdate(FormStpes.restart);
    clearForm();
  }
}
