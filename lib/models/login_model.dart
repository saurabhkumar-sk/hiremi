class userModel {
  int? id;
  String? uid;
  String? fullName;
  String? fatherName;
  String? email;
  String? dateOfBirth;
  String? gender;
  String? address;
  String? phoneNumber;
  String? whatsappNumber;
  String? collegeState;
  String? collegeName;
  String? branchName;
  int? passingYear;
  String? password;
  bool? verified;
  String? candidateStatus;
  String? paymentStatus;

  userModel(
      {this.id,
      this.uid,
      this.fullName,
      this.fatherName,
      this.email,
      this.dateOfBirth,
      this.gender,
      this.address,
      this.phoneNumber,
      this.whatsappNumber,
      this.collegeState,
      this.collegeName,
      this.branchName,
      this.passingYear,
      this.password,
      this.verified,
      this.candidateStatus,
      this.paymentStatus});

  userModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    fullName = json['full_name'];
    fatherName = json['father_name'];
    email = json['email'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    whatsappNumber = json['whatsapp_number'];
    collegeState = json['college_state'];
    collegeName = json['college_name'];
    branchName = json['branch_name'];
    passingYear = json['passing_year'];
    password = json['password'];
    verified = json['verified'];
    candidateStatus = json['candidate_status'];
    paymentStatus = json['payment_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['full_name'] = fullName;
    data['father_name'] = fatherName;
    data['email'] = email;
    data['date_of_birth'] = dateOfBirth;
    data['gender'] = gender;
    data['address'] = address;
    data['phone_number'] = phoneNumber;
    data['whatsapp_number'] = whatsappNumber;
    data['college_state'] = collegeState;
    data['college_name'] = collegeName;
    data['branch_name'] = branchName;
    data['passing_year'] = passingYear;
    data['password'] = password;
    data['verified'] = verified;
    data['candidate_status'] = candidateStatus;
    data['payment_status'] = paymentStatus;
    return data;
  }
}
