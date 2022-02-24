
import 'package:equatable/equatable.dart';

class Package extends Equatable{
    const Package({
      required this.minutes,
      required this.offerName,
      required this.sellCost,
    });

    final int minutes;
    final String offerName;
    final double sellCost;

  @override
  List<Object> get props => [
    minutes,
    offerName,
    sellCost
  ];

}
