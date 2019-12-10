class User {
  String name;
  double salary;
  int salaryDate;
  String gender;
  String location;
  String email;
  String phone;
  String profession;

  bool hasAvatar = false;
  String avatarUrl;

  bool isRemind;
  String remindTime;
  String remindType;
  String remindSound;

  String language; // in development

  User({
    this.name,
    this.salary,
    this.salaryDate,
    this.gender,
    this.location,
    this.email,
    this.phone,
    this.profession,
    this.avatarUrl,
    this.isRemind,
    this.remindTime,
    this.remindType,
    this.remindSound,
    this.language,
    this.hasAvatar,
  });
}

// User user = User();

User user = User(
  name: 'REGISTRATIONEXAMPLE',
  salary: 1000.0,
  salaryDate: 1,
  gender: 'Male',
  location: 'Russia',
  email: 'the1ime@yandex.ru',
  phone: '+79345578561',
  profession: 'Photographer',
  avatarUrl: 'ava.jpg',
  isRemind: true,
  remindTime: '1d',
  remindType: 'Phone Notification',
  remindSound: 'Basic',
  language: 'English',
);

// mike.hasAvatar = true;
