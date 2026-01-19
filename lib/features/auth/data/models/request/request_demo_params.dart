class RequestDemoParams {
  final String? email;
  final String? name;
  final String? job;
  final String? phone;
  final String? companyName;
  final String? companySize;
  final String? token;

  RequestDemoParams({
    this.email,
    this.name,
    this.job,
    this.phone,
    this.companyName,
    this.companySize,
    this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'job_title': job,
      'phone': phone,
      'company_name': companyName,
      'company_size': companySize,
      'token': token,
    };
  }

  RequestDemoParams copyWith({
    String? email,
    String? name,
    String? job,
    String? phone,
    String? companyName,
    String? companySize,
    String? token,
  }) {
    return RequestDemoParams(
      email: email ?? this.email,
      name: name ?? this.name,
      job: job ?? this.job,
      phone: phone ?? this.phone,
      companyName: companyName ?? this.companyName,
      companySize: companySize ?? this.companySize,
      token: token ?? this.token,
    );
  }
}
