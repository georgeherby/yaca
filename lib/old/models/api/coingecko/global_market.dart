class GlobalMarket {
  late GlobalMarketData data;

  GlobalMarket({required this.data});

  GlobalMarket.fromJson(Map<String, dynamic> json) {
    data = GlobalMarketData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data.toJson();

    return data;
  }
}

class GlobalMarketData {
  late int activeCryptocurrencies;
  late int upcomingIcos;
  late int ongoingIcos;
  late int endedIcos;
  late int markets;
  late TotalMarketCap totalMarketCap;
  late TotalVolume totalVolume;
  late MarketCapPercentage marketCapPercentage;
  late double marketCapChangePercentage24hUsd;
  late int updatedAt;

  GlobalMarketData({
    required this.activeCryptocurrencies,
    required this.upcomingIcos,
    required this.ongoingIcos,
    required this.endedIcos,
    required this.markets,
    required this.totalMarketCap,
    required this.totalVolume,
    required this.marketCapPercentage,
    required this.marketCapChangePercentage24hUsd,
    required this.updatedAt,
  });

  GlobalMarketData.fromJson(Map<String, dynamic> json) {
    activeCryptocurrencies = json['active_cryptocurrencies'];
    upcomingIcos = json['upcoming_icos'];
    ongoingIcos = json['ongoing_icos'];
    endedIcos = json['ended_icos'];
    markets = json['markets'];
    totalMarketCap = TotalMarketCap.fromJson(json['total_market_cap']);
    totalVolume = TotalVolume.fromJson(json['total_volume']);
    marketCapPercentage = MarketCapPercentage.fromJson(json['market_cap_percentage']);
    marketCapChangePercentage24hUsd = json['market_cap_change_percentage_24h_usd'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active_cryptocurrencies'] = this.activeCryptocurrencies;
    data['upcoming_icos'] = this.upcomingIcos;
    data['ongoing_icos'] = this.ongoingIcos;
    data['ended_icos'] = this.endedIcos;
    data['markets'] = this.markets;
    data['total_market_cap'] = this.totalMarketCap.toJson();
    data['total_volume'] = this.totalVolume.toJson();

    data['market_cap_percentage'] = this.marketCapPercentage.toJson();
    data['market_cap_change_percentage_24h_usd'] = this.marketCapChangePercentage24hUsd;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class TotalMarketCap {
  late double btc;
  // double eth;
  // double ltc;
  // double bch;
  // double bnb;
  // double eos;
  // double xrp;
  // double xlm;
  // double link;
  // double dot;
  // double yfi;
  late double usd;
  // double aed;
  // double ars;
  // double aud;
  // double bdt;
  // double bhd;
  // double bmd;
  // double brl;
  // double cad;
  // double chf;
  // double clp;
  // double cny;
  // double czk;
  // double dkk;
  late double eur;
  late double gbp;
  // double hkd;
  // double huf;
  // int idr;
  // double ils;
  // double inr;
  // double jpy;
  // double krw;
  // double kwd;
  // double lkr;
  // double mmk;
  // double mxn;
  // double myr;
  // double ngn;
  // double nok;
  // double nzd;
  // double php;
  // double pkr;
  // double pln;
  // double rub;
  // double sar;
  // double sek;
  // double sgd;
  // double thb;
  // double try;
  // double twd;
  // double uah;
  // double vef;
  // double vnd;
  // double zar;
  // double xdr;
  // double xag;
  // double xau;

  TotalMarketCap({
    required this.btc,
    // this.eth, this.ltc, this.bch, this.bnb, this.eos, this.xrp, this.xlm, this.link, this.dot, this.yfi,
    required this.usd,
    //  this.aed, this.ars, this.aud, this.bdt, this.bhd, this.bmd, this.brl, this.cad, this.chf, this.clp, this.cny, this.czk, this.dkk,
    required this.eur,
    required this.gbp,
    //  this.hkd, this.huf, this.idr, this.ils, this.inr, this.jpy, this.krw, this.kwd, this.lkr, this.mmk, this.mxn, this.myr, this.ngn, this.nok, this.nzd, this.php, this.pkr, this.pln, this.rub, this.sar, this.sek, this.sgd, this.thb, this.try, this.twd, this.uah, this.vef, this.vnd, this.zar, this.xdr, this.xag, this.xau
  });

  TotalMarketCap.fromJson(Map<String, dynamic> json) {
    btc = json['btc'];
    // eth = json['eth'];
    // ltc = json['ltc'];
    // bch = json['bch'];
    // bnb = json['bnb'];
    // eos = json['eos'];
    // xrp = json['xrp'];
    // xlm = json['xlm'];
    // link = json['link'];
    // dot = json['dot'];
    // yfi = json['yfi'];
    usd = json['usd'];
    // aed = json['aed'];
    // ars = json['ars'];
    // aud = json['aud'];
    // bdt = json['bdt'];
    // bhd = json['bhd'];
    // bmd = json['bmd'];
    // brl = json['brl'];
    // cad = json['cad'];
    // chf = json['chf'];
    // clp = json['clp'];
    // cny = json['cny'];
    // czk = json['czk'];
    // dkk = json['dkk'];
    eur = json['eur'];
    gbp = json['gbp'];
    // hkd = json['hkd'];
    // huf = json['huf'];
    // idr = json['idr'];
    // ils = json['ils'];
    // inr = json['inr'];
    // jpy = json['jpy'];
    // krw = json['krw'];
    // kwd = json['kwd'];
    // lkr = json['lkr'];
    // mmk = json['mmk'];
    // mxn = json['mxn'];
    // myr = json['myr'];
    // ngn = json['ngn'];
    // nok = json['nok'];
    // nzd = json['nzd'];
    // php = json['php'];
    // pkr = json['pkr'];
    // pln = json['pln'];
    // rub = json['rub'];
    // sar = json['sar'];
    // sek = json['sek'];
    // sgd = json['sgd'];
    // thb = json['thb'];
    // try = json['try'];
    // twd = json['twd'];
    // uah = json['uah'];
    // vef = json['vef'];
    // vnd = json['vnd'];
    // zar = json['zar'];
    // xdr = json['xdr'];
    // xag = json['xag'];
    // xau = json['xau'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['btc'] = this.btc;
    // data['eth'] = this.eth;
    // data['ltc'] = this.ltc;
    // data['bch'] = this.bch;
    // data['bnb'] = this.bnb;
    // data['eos'] = this.eos;
    // data['xrp'] = this.xrp;
    // data['xlm'] = this.xlm;
    // data['link'] = this.link;
    // data['dot'] = this.dot;
    // data['yfi'] = this.yfi;
    data['usd'] = this.usd;
    // data['aed'] = this.aed;
    // data['ars'] = this.ars;
    // data['aud'] = this.aud;
    // data['bdt'] = this.bdt;
    // data['bhd'] = this.bhd;
    // data['bmd'] = this.bmd;
    // data['brl'] = this.brl;
    // data['cad'] = this.cad;
    // data['chf'] = this.chf;
    // data['clp'] = this.clp;
    // data['cny'] = this.cny;
    // data['czk'] = this.czk;
    // data['dkk'] = this.dkk;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    // data['hkd'] = this.hkd;
    // data['huf'] = this.huf;
    // data['idr'] = this.idr;
    // data['ils'] = this.ils;
    // data['inr'] = this.inr;
    // data['jpy'] = this.jpy;
    // data['krw'] = this.krw;
    // data['kwd'] = this.kwd;
    // data['lkr'] = this.lkr;
    // data['mmk'] = this.mmk;
    // data['mxn'] = this.mxn;
    // data['myr'] = this.myr;
    // data['ngn'] = this.ngn;
    // data['nok'] = this.nok;
    // data['nzd'] = this.nzd;
    // data['php'] = this.php;
    // data['pkr'] = this.pkr;
    // data['pln'] = this.pln;
    // data['rub'] = this.rub;
    // data['sar'] = this.sar;
    // data['sek'] = this.sek;
    // data['sgd'] = this.sgd;
    // data['thb'] = this.thb;
    // data['try'] = this.try;
    // data['twd'] = this.twd;
    // data['uah'] = this.uah;
    // data['vef'] = this.vef;
    // data['vnd'] = this.vnd;
    // data['zar'] = this.zar;
    // data['xdr'] = this.xdr;
    // data['xag'] = this.xag;
    // data['xau'] = this.xau;
    return data;
  }
}

class TotalVolume {
  late double btc;
  // double eth;
  // double ltc;
  // double bch;
  // double bnb;
  // double eos;
  // double xrp;
  // double xlm;
  // double link;
  // double dot;
  // double yfi;
  late double usd;
  // double aed;
  // double ars;
  // double aud;
  // double bdt;
  // double bhd;
  // double bmd;
  // double brl;
  // double cad;
  // double chf;
  // double clp;
  // double cny;
  // double czk;
  // double dkk;
  late double eur;
  late double gbp;
  // double hkd;
  // double huf;
  // double idr;
  // double ils;
  // double inr;
  // double jpy;
  // double krw;
  // double kwd;
  // double lkr;
  // double mmk;
  // double mxn;
  // double myr;
  // double ngn;
  // double nok;
  // double nzd;
  // double php;
  // double pkr;
  // double pln;
  // double rub;
  // double sar;
  // double sek;
  // double sgd;
  // double thb;
  // double try;
  // double twd;
  // double uah;
  // double vef;
  // int vnd;
  // double zar;
  // double xdr;
  // double xag;
  // double xau;

  TotalVolume({
    required this.btc,
    // this.eth, this.ltc, this.bch, this.bnb, this.eos, this.xrp, this.xlm, this.link, this.dot, this.yfi,
    required this.usd,
    //  this.aed, this.ars, this.aud, this.bdt, this.bhd, this.bmd, this.brl, this.cad, this.chf, this.clp, this.cny, this.czk, this.dkk,
    required this.eur,
    required this.gbp,
    //  this.hkd, this.huf, this.idr, this.ils, this.inr, this.jpy, this.krw, this.kwd, this.lkr, this.mmk, this.mxn, this.myr, this.ngn, this.nok, this.nzd, this.php, this.pkr, this.pln, this.rub, this.sar, this.sek, this.sgd, this.thb, this.try, this.twd, this.uah, this.vef, this.vnd, this.zar, this.xdr, this.xag, this.xau
  });

  TotalVolume.fromJson(Map<String, dynamic> json) {
    btc = json['btc'];
    // eth = json['eth'];
    // ltc = json['ltc'];
    // bch = json['bch'];
    // bnb = json['bnb'];
    // eos = json['eos'];
    // xrp = json['xrp'];
    // xlm = json['xlm'];
    // link = json['link'];
    // dot = json['dot'];
    // yfi = json['yfi'];
    usd = json['usd'];
    // aed = json['aed'];
    // ars = json['ars'];
    // aud = json['aud'];
    // bdt = json['bdt'];
    // bhd = json['bhd'];
    // bmd = json['bmd'];
    // brl = json['brl'];
    // cad = json['cad'];
    // chf = json['chf'];
    // clp = json['clp'];
    // cny = json['cny'];
    // czk = json['czk'];
    // dkk = json['dkk'];
    eur = json['eur'];
    gbp = json['gbp'];
    // hkd = json['hkd'];
    // huf = json['huf'];
    // idr = json['idr'];
    // ils = json['ils'];
    // inr = json['inr'];
    // jpy = json['jpy'];
    // krw = json['krw'];
    // kwd = json['kwd'];
    // lkr = json['lkr'];
    // mmk = json['mmk'];
    // mxn = json['mxn'];
    // myr = json['myr'];
    // ngn = json['ngn'];
    // nok = json['nok'];
    // nzd = json['nzd'];
    // php = json['php'];
    // pkr = json['pkr'];
    // pln = json['pln'];
    // rub = json['rub'];
    // sar = json['sar'];
    // sek = json['sek'];
    // sgd = json['sgd'];
    // thb = json['thb'];
    // try = json['try'];
    // twd = json['twd'];
    // uah = json['uah'];
    // vef = json['vef'];
    // vnd = json['vnd'];
    // zar = json['zar'];
    // xdr = json['xdr'];
    // xag = json['xag'];
    // xau = json['xau'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['btc'] = this.btc;
    // data['eth'] = this.eth;
    // data['ltc'] = this.ltc;
    // data['bch'] = this.bch;
    // data['bnb'] = this.bnb;
    // data['eos'] = this.eos;
    // data['xrp'] = this.xrp;
    // data['xlm'] = this.xlm;
    // data['link'] = this.link;
    // data['dot'] = this.dot;
    // data['yfi'] = this.yfi;
    data['usd'] = this.usd;
    // data['aed'] = this.aed;
    // data['ars'] = this.ars;
    // data['aud'] = this.aud;
    // data['bdt'] = this.bdt;
    // data['bhd'] = this.bhd;
    // data['bmd'] = this.bmd;
    // data['brl'] = this.brl;
    // data['cad'] = this.cad;
    // data['chf'] = this.chf;
    // data['clp'] = this.clp;
    // data['cny'] = this.cny;
    // data['czk'] = this.czk;
    // data['dkk'] = this.dkk;
    data['eur'] = this.eur;
    data['gbp'] = this.gbp;
    // data['hkd'] = this.hkd;
    // data['huf'] = this.huf;
    // data['idr'] = this.idr;
    // data['ils'] = this.ils;
    // data['inr'] = this.inr;
    // data['jpy'] = this.jpy;
    // data['krw'] = this.krw;
    // data['kwd'] = this.kwd;
    // data['lkr'] = this.lkr;
    // data['mmk'] = this.mmk;
    // data['mxn'] = this.mxn;
    // data['myr'] = this.myr;
    // data['ngn'] = this.ngn;
    // data['nok'] = this.nok;
    // data['nzd'] = this.nzd;
    // data['php'] = this.php;
    // data['pkr'] = this.pkr;
    // data['pln'] = this.pln;
    // data['rub'] = this.rub;
    // data['sar'] = this.sar;
    // data['sek'] = this.sek;
    // data['sgd'] = this.sgd;
    // data['thb'] = this.thb;
    // data['try'] = this.try;
    // data['twd'] = this.twd;
    // data['uah'] = this.uah;
    // data['vef'] = this.vef;
    // data['vnd'] = this.vnd;
    // data['zar'] = this.zar;
    // data['xdr'] = this.xdr;
    // data['xag'] = this.xag;
    // data['xau'] = this.xau;
    return data;
  }
}

class MarketCapPercentage {
  late double btc;
  late double eth;
  late double usdt;
  // late double xrp;
  // late double ltc;
  // late double ada;
  // late double dot;
  // late double bch;
  // late double xlm;
  late double bnb;

  MarketCapPercentage(
      {required this.btc,
      required this.eth,
      required this.usdt,
      // required this.xrp,
      // required this.ltc,
      // required this.ada,
      // required this.dot,
      // required this.bch,
      // required this.xlm,
      required this.bnb});

  MarketCapPercentage.fromJson(Map<String, dynamic> json) {
    btc = json['btc'];
    eth = json['eth'];
    usdt = json['usdt'];
    // xrp = json['xrp'];
    // ltc = json['ltc'];
    // ada = json['ada'];
    // dot = json['dot'];
    // bch = json['bch'];
    // xlm = json['xlm'];
    bnb = json['bnb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['btc'] = this.btc;
    data['eth'] = this.eth;
    data['usdt'] = this.usdt;
    // data['xrp'] = this.xrp;
    // data['ltc'] = this.ltc;
    // data['ada'] = this.ada;
    // data['dot'] = this.dot;
    // data['bch'] = this.bch;
    // data['xlm'] = this.xlm;
    data['bnb'] = this.bnb;
    return data;
  }
}
