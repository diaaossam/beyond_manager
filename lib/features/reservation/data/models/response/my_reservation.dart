class MyReservation {
  MyReservation(
      {this.branchName,
        this.dateOfBirth,
        this.doctorName,
        this.email,
        this.fatherName,
        this.firstName,
        this.gender,
        this.grandFatherName,
        this.hospitalName,
        this.id,
        this.lastName,
        this.manager,
        this.name,
        this.phone,
        this.reservationDate,
        this.state,
        this.reservationTime,
        this.specialityName,
        this.time});

  MyReservation.fromJson(dynamic json) {
    branchName = json['branch_name'];
    dateOfBirth = json['date_of_birth'];
    doctorName = json['doctor_name'];
    email = json['email'];
    fatherName = json['father_name'];
    firstName = json['first_name'];
    gender = json['gender'];
    grandFatherName = json['grand_father_name'];
    hospitalName = json['hospital_name'];
    id = json['id'];
    lastName = json['last_name'];
    manager = json['manager'];
    name = json['name'];
    phone = json['phone'];
    reservationDate = json['reservation_date'];
    reservationTime = json['reservation_time'];
    specialityName = json['speciality_name'];
    state = json['state'];
    time = json['time'];
  }

  String? branchName;
  String? dateOfBirth;
  String? doctorName;
  String? email;
  String? fatherName;
  String? firstName;
  String? gender;
  String? grandFatherName;
  String? hospitalName;
  num? id;
  String? lastName;
  String? manager;
  String? name;
  String? phone;
  String? reservationDate;
  String? reservationTime;
  String? specialityName;
  String? state;
  String? time;
}
