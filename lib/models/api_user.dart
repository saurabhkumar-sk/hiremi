class ApiUser {
  final int id;
  final String fullName;
  final String fatherName;
  final String gender;
  final String email;
  final String dateOfBirth;
  final String birthPlace;
  final String phoneNumbar;
  final String whatsappNumber;
  final String collegeState;
  final String collegeName;
  final String branchName;
  final int passingYear;
  final String password;
  final bool internship;
  final bool freshers;
  final int experience;
  final bool mentroship;
  final String status;

  ApiUser({
    required this.id,
    required this.fullName,
    required this.fatherName,
    required this.gender,
    required this.email,
    required this.dateOfBirth,
    required this.birthPlace,
    required this.phoneNumbar,
    required this.whatsappNumber,
    required this.collegeState,
    required this.collegeName,
    required this.branchName,
    required this.passingYear,
    required this.password,
    required this.internship,
    required this.freshers,
    required this.experience,
    required this.mentroship,
    required this.status,
  });

  factory ApiUser.fromJson(Map<String, dynamic> json) {
    return ApiUser(
      id: json['id'] as int,
      fullName: json['full_name'],
      fatherName: json['father_name'],
      gender: json['gender'],
      email: json['email'],
      dateOfBirth: json['date_of_birth'],
      birthPlace: json['birth_place'],
      phoneNumbar: json['phone_number'],
      whatsappNumber: json['whatsapp_number'],
      collegeState: json['college_state'],
      collegeName: json['college_name'],
      branchName: json['branch_name'],
      passingYear: json['passing_year'] as int,
      password: json['password'],
      internship: json['internship'] as bool,
      freshers: json['freshers'] as bool,
      experience: json['experience'] as int,
      mentroship: json['mentroship'] as bool,
      status: json['status'],
    );
  }
}
