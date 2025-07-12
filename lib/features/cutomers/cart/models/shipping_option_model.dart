class ShippingOptionModel {
  final int id;
  final String name;
  final String description;
  final int fee;
  final String estimatedDays;

  ShippingOptionModel({
    required this.id,
    required this.name,
    required this.description,
    required this.fee,
    required this.estimatedDays,
  });

  factory ShippingOptionModel.fromMap(Map<String, dynamic> map) {
    return ShippingOptionModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      fee: map['fee'],
      estimatedDays: map['estimatedDays'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'fee': fee,
      'estimatedDays': estimatedDays,
    };
  }
}
