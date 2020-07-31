import 'package:sih/taxi/models/payment_method.dart';

class PaymentMethodController {
  static Future<List<PaymentMethod>> getMethods() async {
    return [
      PaymentMethod(
          title: "One Wallet",
          description: "Default",
          id: "1",
          icon:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ83FQH0ZRzjr5Rz9BOHnK4ghBtfsvOF79aTg&usqp=CAU"),
      PaymentMethod(
          title: "Cash",
          description: "Local Payment",
          id: "2",
          icon:
              "https://cdn4.iconfinder.com/data/icons/aiga-symbol-signs/612/aiga_cashier_bg-512.png"),
      PaymentMethod(
          title: "Master Card",
          description: "**** **** **** 4863",
          id: "3",
          icon:
              "https://icon-library.net/images/mastercard-icon-png/mastercard-icon-png-28.jpg")
    ];
  }
}
