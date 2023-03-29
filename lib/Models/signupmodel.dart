import 'dart:convert';

class SignupResponseModel {
  final String id;
  final String email;
  SignupResponseModel({
    required this.id,
    required this.email,
  });

  SignupResponseModel copyWith({
    String? id,
    String? email,
  }) {
    return SignupResponseModel(
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
    };
  }

  factory SignupResponseModel.fromMap(Map<String, dynamic> map) {
    return SignupResponseModel(
      id: map['_id'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupResponseModel.fromJson(String source) => SignupResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SignupResponseModel(id: $id, email: $email)';

  @override
  bool operator ==(covariant SignupResponseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode;
}