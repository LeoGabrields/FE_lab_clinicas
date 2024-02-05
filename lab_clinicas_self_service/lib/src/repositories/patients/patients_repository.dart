import 'package:lab_clinicas_core/lab_clinicas_core.dart';

import '../../models/patient_model.dart';

abstract interface class PatientsRepository {
  Future<Either<RepositoryException, PatientModel?>> findPatientByDocument(
      String document);
}
