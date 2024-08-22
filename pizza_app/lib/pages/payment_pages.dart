import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:pizza_app/components/my_button.dart';
import 'package:pizza_app/pages/delivery_progress_page.dart';
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String cardNumber = '';

  String expiryDate = '';

  String cardHolderName = '';

  String cvvCode = '';

  bool isCvvFocused = false;
  void _userTappedPay(){
    if(formkey.currentState!.validate()){
      // only shows when form is valid
      showDialog(
          context: context,
          builder: (context)=>  AlertDialog(
            title: Text("Confirm Payment"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text('Card Number: $cardNumber'),
                  Text('Expiry Date: $expiryDate'),
                  Text('Card HolderName: $cardHolderName'),
                  Text('CVV: $cvvCode'),
                ],
              ),
            ),
            actions: [
              // cancel button
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  child: Text("Cancel")
              ),
              // accept button
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> DeliveryProgressPage(),
                    ));
                  },
                  child: Text("Yes")
              ),
            ],
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Checkout",style: TextStyle(
          fontSize: 20
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // credit card with package
            CreditCardWidget(
              cardNumber:cardNumber,
              expiryDate:expiryDate,
              cardHolderName:cardHolderName,
              cvvCode:cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0){},
            ),
            // credit card form
            CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data){
                 setState(() {
                   cardNumber = data.cardNumber;
                   expiryDate = data.expiryDate;
                   cardHolderName = data.cardHolderName;
                   cvvCode = data.cvvCode;
                 });
                },
                formKey: formkey,
            ),
            SizedBox(height: 150,),
            // // button to pay
            MyButton(
                text: "Pay Now",
              onTap: (){
                _userTappedPay();
              },
            ),
            SizedBox(height: 25,)
          ],
        ),
      ),
    );
  }
}
