class User {
  String name;
  String gender;
  String location;
  String email;
  String phone;
  String profession;

  String avatarUrl;

  bool isRemind;
  String remindTime;
  String remindType;
  String remindSound;

  String language; // in development

  User({
    this.name,
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
  });
}

User user = User(
  name: 'Mike Johnson',
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
