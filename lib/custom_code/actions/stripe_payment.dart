// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import "dart:convert";
import "package:http/http.dart" as http;

Future<ResponsePaymentStruct> stripePayment(
    String cardToken, double amount, String email) async {
  ResponsePaymentStruct responsePayment = ResponsePaymentStruct();
  try {
    final url = 'https://api.stripe.com/v1/payment_intents';
    final apiKey =
        'sk_test_51OEYGsDppmqoYi72sTPDaRvTeDkKrQzWzAw02d7m8YIL8yz5iIF9uYwrCTLahQdSP7b33ywsMlPniex2vyt9K5XU00Ex3FOZ1k';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $apiKey',
      },
      body: {
        'amount': (amount * 100).toInt().toString(), // O valor em centavos
        'currency': 'brl', // Substitua pela sua moeda, se necessário
        'payment_method_options': {"type": "card", "card[token]": cardToken},
        'description':
            'Consulta marcada', // Adicione uma descrição conforme necessário
        'receipt_email': email,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = json.decode(response.body);
      final paymentIntentId = responseData['id'];

      // O pagamento foi bem-sucedido, você pode realizar ações adicionais se necessário

      print(
          'Pagamento concluído com sucesso! PaymentIntent ID: $paymentIntentId');
      responsePayment = ResponsePaymentStruct(
          status: 200,
          message: "Pagamento concluído com sucesso",
          paymentId: paymentIntentId);
    } else {
      print('Falha no pagamento. Código de resposta: ${response.statusCode}');
      print('Resposta da API da Stripe: ${response.body}');
      responsePayment = ResponsePaymentStruct(
          status: 200,
          message:
              "Falha no pagamento. Código de resposta: ${response.statusCode}",
          paymentId: "");
    }
  } catch (error) {
    print('Erro ao processar pagamento: $error');
    // Trate o erro conforme necessário
    responsePayment = ResponsePaymentStruct(
        status: 500, message: "Erro ao processar pagamento!", paymentId: "");
  }
  return responsePayment;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
