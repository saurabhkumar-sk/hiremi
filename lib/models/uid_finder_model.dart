class UidFinder {
  int? id;
  String? uid;
  String? userEmail;
  String? collegeIdNumber;
  int? communicationSkills;
  String? status;
  String? skills;
  String? scheduleDate;
  String? scheduleTime;

  UidFinder(
      {this.id,
      this.uid,
      this.userEmail,
      this.collegeIdNumber,
      this.communicationSkills,
      this.status,
      this.skills,
      this.scheduleDate,
      this.scheduleTime});

  UidFinder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    userEmail = json['user_email'];
    collegeIdNumber = json['college_id_number'];
    communicationSkills = json['communication_skills'];
    status = json['status'];
    skills = json['skills'];
    scheduleDate = json['schedule_date'];
    scheduleTime = json['schedule_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['user_email'] = this.userEmail;
    data['college_id_number'] = this.collegeIdNumber;
    data['communication_skills'] = this.communicationSkills;
    data['status'] = this.status;
    data['skills'] = this.skills;
    data['schedule_date'] = this.scheduleDate;
    data['schedule_time'] = this.scheduleTime;
    return data;
  }
}
