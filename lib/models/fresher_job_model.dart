class FresherJobModel {
  int? id;
  String? jobProfile;
  String? jobLocation;
  String? jobCodeRequired;
  int? jobCode;
  String? companyName;
  String? jobCtc;
  String? education;
  String? skillsRequired;
  String? jobDescription;
  String? termsAndConditions;

  FresherJobModel(
      {this.id,
      this.jobProfile,
      this.jobLocation,
      this.jobCodeRequired,
      this.jobCode,
      this.companyName,
      this.jobCtc,
      this.education,
      this.skillsRequired,
      this.jobDescription,
      this.termsAndConditions});

  FresherJobModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobProfile = json['job_profile'];
    jobLocation = json['job_location'];
    jobCodeRequired = json['job_code_required'];
    jobCode = json['job_code'];
    companyName = json['company_name'];
    jobCtc = json['job_ctc'];
    education = json['education'];
    skillsRequired = json['skills_required'];
    jobDescription = json['job_description'];
    termsAndConditions = json['terms_and_conditions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job_profile'] = this.jobProfile;
    data['job_location'] = this.jobLocation;
    data['job_code_required'] = this.jobCodeRequired;
    data['job_code'] = this.jobCode;
    data['company_name'] = this.companyName;
    data['job_ctc'] = this.jobCtc;
    data['education'] = this.education;
    data['skills_required'] = this.skillsRequired;
    data['job_description'] = this.jobDescription;
    data['terms_and_conditions'] = this.termsAndConditions;
    return data;
  }
}
