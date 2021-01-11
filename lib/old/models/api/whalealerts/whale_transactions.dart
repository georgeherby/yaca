class WhaleTransactions {
  late String result;
  late String cursor;
  late int count;
  late List<Transactions> transactions;

  WhaleTransactions(
      {required this.result,
      required this.cursor,
      required this.count,
      required this.transactions});

  WhaleTransactions.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    cursor = json['cursor'];
    count = json['count'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['cursor'] = this.cursor;
    data['count'] = this.count;
    data['transactions'] = this.transactions.map((v) => v.toJson()).toList();

    return data;
  }
}

class Transactions {
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

  Transactions(
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

  Transactions.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blockchain'] = this.blockchain;
    data['symbol'] = this.symbol;
    data['id'] = this.id;
    data['transaction_type'] = this.transactionType;
    data['hash'] = this.hash;
    data['from'] = this.from.toJson();

    data['to'] = this.to.toJson();

    data['timestamp'] = this.timestamp;
    data['amount'] = this.amount;
    data['amount_usd'] = this.amountUsd;
    data['transaction_count'] = this.transactionCount;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['owner_type'] = this.ownerType;
    data['owner'] = this.owner;
    return data;
  }
}
