// import 'package:flutter/material.dart';
// import 'package:honeywell_scanner_example/model/entity/malzeme_model.dart';
// import 'package:honeywell_scanner_example/view/screens/fixed_receipt/get_amount_page.dart';
// import 'package:honeywell_scanner_example/view/screens/fixed_receipt/line_selection_page.dart';

// import '../../entity/fixed_receipt_order_model.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoutes(RouteSettings settings,
//       MalzemeModel malzeme, List<FixedReceiptOrderModel> productList) {
//     switch (settings.name) {
//       case '/getAmountPage':
//         return MaterialPageRoute(
//             builder: (context) => GetAmountPage(malzeme: malzeme));
//       case '/lineSelectionPage':
//         return MaterialPageRoute(
//             builder: (context) => LineSelectionPage(productList: productList));

//       default:
//         return MaterialPageRoute(
//             builder: (context) => Scaffold(
//                   body: Center(
//                     child: Text("Not found ${settings.name}"),
//                   ),
//                 ));
//     }
//   }
// }
