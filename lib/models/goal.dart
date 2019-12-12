class Goal {
  int id;
  String type;
  int goalAmount;
  String saveType;
  double saveAmount;
  int savePercentage;

  Goal({
    this.id,
    this.type,
    this.goalAmount,
    this.saveType,
    this.saveAmount,
    this.savePercentage,
  });

  // int get id => id;
  // String get type => type;
  // int get goalAmount => goalAmount;
  // String get saveType => saveType;
  // double get saveAmount => saveAmount;
  // int savePercentage => savePercentage;
  // DateTime date => date;

  factory Goal.fromJson(Map<String, dynamic> data) => new Goal(
        id: data["id"],
        type: data['type'],
        goalAmount: data['goalAmount'],
        saveType: data['saveType'],
        saveAmount: data['saveAmount'],
        savePercentage: data['savePercentage'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "goalAmount": goalAmount,
        "saveType": saveType,
        "saveAmount": saveAmount,
        "savePercentage": savePercentage,
      };
}

Goal newGoalModel = Goal();

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
}
