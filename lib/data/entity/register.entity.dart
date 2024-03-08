class RegisterLocalEntity {
  final AuthEntity auth;
  final ProfileEntity profile;

  RegisterLocalEntity({required this.auth, required this.profile});

  toJson() {
    return {
      "auth": auth.toJson(),
      "profile": profile.toJson()
    };
  }
}

class AuthEntity {
  final String email, password;

  AuthEntity({required this.email, required this.password});

  toJson() {
    return {"email": email, "password": password};
  }
}

class ProfileEntity {
  final String surname, otherNames, phoneNumber, country, dateOfBirth;

  ProfileEntity({
    required this.surname,
    required this.otherNames,
    required this.phoneNumber,
    required this.country,
    required this.dateOfBirth,
  });

  toJson() {
    return {
      "surname": surname,
      "otherNames": otherNames,
      "phoneNumber": phoneNumber,
      "country": country,
      "dateOfBirth": dateOfBirth
    };
  }
}

class SendEmailConfirmationCodeEntity {
  final String email;

  SendEmailConfirmationCodeEntity({ required this.email });

  toJson() {
    return {
      "email": email
    };
  }
}

class ConfirmCodeEntity {
  final String email, code;

  ConfirmCodeEntity({ required this.email, required this.code });

  toJson() {
    return {
      "email": email,
      "code": code
    };
  }
}