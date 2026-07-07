import 'package:flutter/material.dart';

class BankCard {
  final String id;
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;
  final String bankName;
  final bool isDefault;

  BankCard({
    required this.id,
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
    required this.bankName,
    this.isDefault = false,
  });

  String get last4Digits => cardNumber.substring(cardNumber.length - 4);
}

class CardService extends ChangeNotifier {
  final List<BankCard> _cards = [];

  List<BankCard> get cards => _cards;

  CardService() {
    _initCards();
  }

  void _initCards() {
    _cards.add(BankCard(
      id: 'card_1',
      cardNumber: '4242424242424242',
      cardHolder: 'A. NURTILEK',
      expiryDate: '12/27',
      bankName: 'Tinkoff',
      isDefault: true,
    ));
    _cards.add(BankCard(
      id: 'card_2',
      cardNumber: '5555555555554444',
      cardHolder: 'A. NURTILEK',
      expiryDate: '08/26',
      bankName: 'Sberbank',
    ));
  }

  void addCard(BankCard card) {
    _cards.add(card);
    notifyListeners();
  }

  void removeCard(String id) {
    _cards.removeWhere((card) => card.id == id);
    notifyListeners();
  }

  void setDefault(String id) {
    for (var card in _cards) {
      card = BankCard(
        id: card.id,
        cardNumber: card.cardNumber,
        cardHolder: card.cardHolder,
        expiryDate: card.expiryDate,
        bankName: card.bankName,
        isDefault: card.id == id,
      );
    }
    notifyListeners();
  }
}
