class WhaleTransactionResults {
  late String result;
  late String cursor;
  late int count;
  late List<WhaleTransaction> transactions;

  WhaleTransactionResults(
      {required this.result,
      required this.cursor,
      required this.count,
      required this.transactions});

  WhaleTransactionResults.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    cursor = json['cursor'];
    count = json['count'];
    if (json['transactions'] != null) {
      transactions = <WhaleTransaction>[];
      json['transactions'].forEach((v) {
        transactions.add(WhaleTransaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['result'] = result;
    data['cursor'] = cursor;
    data['count'] = count;
    data['transactions'] = transactions.map((v) => v.toJson()).toList();

    return data;
  }
}

class WhaleTransaction {
  late String blockchain;
  late String symbol;
  late String id;
  late String transactionType;
  late String hash;
  late Wallet from;
  late Wallet to;
  late int timestamp;
  late double amount;
  late double amountUsd;
  late int transactionCount;

  WhaleTransaction(
      {required this.blockchain,
      required this.symbol,
      required this.id,
      required this.transactionType,
      required this.hash,
      required this.from,
      required this.to,
      required this.timestamp,
      required this.amount,
      required this.amountUsd,
      required this.transactionCount});

  WhaleTransaction.fromJson(Map<String, dynamic> json) {
    blockchain = json['blockchain'];
    symbol = json['symbol'];
    id = json['id'];
    transactionType = json['transaction_type'];
    hash = json['hash'];
    from = Wallet.fromJson(json['from']);
    // from = json['from'] != null ? new From.fromJson(json['from']) : null;
    to = Wallet.fromJson(json['to']);
    // to = json['to'] != null ? new From.fromJson(json['to']) : null;
    timestamp = json['timestamp'];
    amount = json['amount'].toDouble();
    amountUsd = json['amount_usd'].toDouble();
    transactionCount = json['transaction_count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['blockchain'] = blockchain;
    data['symbol'] = symbol;
    data['id'] = id;
    data['transaction_type'] = transactionType;
    data['hash'] = hash;
    data['from'] = from.toJson();

    data['to'] = to.toJson();

    data['timestamp'] = timestamp;
    data['amount'] = amount;
    data['amount_usd'] = amountUsd;
    data['transaction_count'] = transactionCount;
    return data;
  }
}

class Wallet {
  late String address;
  late String ownerType;
  late String? owner;

  Wallet({required this.address, required this.ownerType, required this.owner});

  Wallet.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    ownerType = json['owner_type'];
    owner = json['owner'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['address'] = address;
    data['owner_type'] = ownerType;
    data['owner'] = owner;
    return data;
  }
}
