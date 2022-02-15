class Quoter {
  const Quoter({
    required this.items,
  });
  final List<QuoterItem> items;
  // final QuoterInfo info;
  // final Supplier supplier;
  // final Customer customer;

}

// class QuoterInfo {
//   const QuoterInfo({
//     required this.description,
//     required this.number,
//     required this.date,
//     required this.dueDate,
//   });
//   final String description;
//   final String number;
//   final DateTime date;
//   final DateTime dueDate;
// }

class QuoterItem {
  const QuoterItem({
    required this.description,
    required this.price
  });
  final String description;
  final double price;
}