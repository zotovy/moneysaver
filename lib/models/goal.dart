class Goal {
  int id;
  String type;
  int goalAmount;
  String saveType;
  double saveAmount;
  int savePercentage;
  DateTime date;

  Goal(
      {this.id,
      this.type,
      this.goalAmount,
      this.saveType,
      this.saveAmount,
      this.savePercentage,
      this.date});
}

Goal newGoalModel = Goal();
