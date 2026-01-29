import 'package:bond/core/utils/api_config.dart';

class ReservationParams {
  final int? policyId;
  final String? name;
  final String? phone;
  final String? email;
  final int? mangerId;
  final int? idBranch;
  final String? planningCabinetCode;
  final String? firstName;
  final String? lastName;
  final String? tel;
  final String? fatherName;
  final String? grandFatherName;
  final String? birthDate;
  final String? gender;
  final String? hospitalName;
  final String? branchName;
  final String? doctorName;
  final String? specialityName;
  final String? reservationDate;
  final String? reservationTime;
  final String? celoptraStartDate;
  final String? celoptraEndDate;

  const ReservationParams({
    this.policyId,
    this.name,
    this.phone,
    this.email,
    this.idBranch,
    this.planningCabinetCode,
    this.firstName,
    this.lastName,
    this.tel,
    this.fatherName,
    this.grandFatherName,
    this.birthDate,
    this.gender,
    this.hospitalName,
    this.branchName,
    this.doctorName,
    this.specialityName,
    this.reservationDate,
    this.reservationTime,
    this.mangerId,
    this.celoptraStartDate,
    this.celoptraEndDate,
  });

  ReservationParams copyWith({
    int? mangerId,
    int? idBranch,
    String? planningCabinetCode,
    String? firstName,
    String? lastName,
    String? tel,
    String? fatherName,
    String? grandFatherName,
    String? birthDate,
    String? gender,
    String? email,
    int? managerId,
    String? hospitalName,
    String? branchName,
    String? doctorName,
    String? specialityName,
    String? reservationDate,
    String? reservationTime,
    String? celoptraEndDate,
    String? celoptraStartDate,
  }) {
    return ReservationParams(
      idBranch: idBranch ?? this.idBranch,
      planningCabinetCode: planningCabinetCode ?? this.planningCabinetCode,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      tel: tel ?? this.tel,
      mangerId: mangerId ?? this.mangerId,
      fatherName: fatherName ?? this.fatherName,
      grandFatherName: grandFatherName ?? this.grandFatherName,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      hospitalName: hospitalName ?? this.hospitalName,
      branchName: branchName ?? this.branchName,
      doctorName: doctorName ?? this.doctorName,
      specialityName: specialityName ?? this.specialityName,
      reservationDate: reservationDate ?? this.reservationDate,
      reservationTime: reservationTime ?? this.reservationTime,
      celoptraEndDate: celoptraEndDate ?? this.celoptraEndDate,
      celoptraStartDate: celoptraStartDate ?? this.celoptraStartDate,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'idBranch': idBranch,
      'planningCabinetCode': planningCabinetCode,
      'firstName': firstName,
      'lastName': lastName,
      'tel': tel,
      'fatherName': fatherName,
      'grandFatherName': grandFatherName,
      'birthDate': birthDate,
      'gender': gender,
      'email': email,
      'hospital_name': hospitalName,
      'branch_name': branchName,
      'doctor_name': doctorName,
      'speciality_name': specialityName,
      'reservation_date': reservationDate,
      'reservation_time': reservationTime == "null" ? "" : reservationTime,
      'manager_id': ApiConfig.userId,
      'cleopatra_start_datetime': celoptraStartDate,
      'cleopatra_end_datetime': celoptraEndDate,
    };
    map.removeWhere(
      (key, value) => value == null,
    );
    return map;
  }
}
