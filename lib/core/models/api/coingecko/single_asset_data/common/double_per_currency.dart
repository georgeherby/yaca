// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:equatable/equatable.dart';

class DoublePerCurrency extends Equatable {
  // final double? aed;
  // final double? ars;
  // final double? aud;
  // final double? bch;
  // final double? bdt;
  // final double? bhd;
  // final double? bmd;
  // final double? bnb;
  // final double? brl;
  final double? btc;
  // final double? cad;
  // final double? chf;
  // final double? clp;
  // final double? cny;
  // final double? czk;
  // final double? dkk;
  // final double? dot;
  // final double? eos;
  final double? eth;
  final double? eur;
  final double? gbp;
  // final double? hkd;
  // final double? huf;
  // final double? idr;
  // final double? ils;
  // final double? inr;
  // final double? jpy;
  // final double? krw;
  // final double? kwd;
  // final double? lkr;
  final double? ltc;
  // final double? mmk;
  // final double? mxn;
  // final double? myr;
  // final double? ngn;
  // final double? nok;
  // final double? nzd;
  // final double? php;
  // final double? pkr;
  // final double? pln;
  // final double? rub;
  // final double? sar;
  // final double? sek;
  // final double? sgd;
  // final double? thb;
  // final double? tTry;
  // final double? twd;
  // final double? uah;
  final double? usd;
  // final double? vef;
  // final double? vnd;
  // final double? xag;
  // final double? xau;
  // final double? xdr;
  // final double? xlm;
  // final double? xrp;
  // final double? yfi;
  // final double? zar;
  // final double? bits;
  // final double? link;
  // final double? sats;
  const DoublePerCurrency({
    // required this.aed,
    // required this.ars,
    // required this.aud,
    // required this.bch,
    // required this.bdt,
    // required this.bhd,
    // required this.bmd,
    // required this.bnb,
    // required this.brl,
    required this.btc,
    // required this.cad,
    // required this.chf,
    // required this.clp,
    // required this.cny,
    // required this.czk,
    // required this.dkk,
    // required this.dot,
    // required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    // required this.hkd,
    // required this.huf,
    // required this.idr,
    // required this.ils,
    // required this.inr,
    // required this.jpy,
    // required this.krw,
    // required this.kwd,
    // required this.lkr,
    required this.ltc,
    // required this.mmk,
    // required this.mxn,
    // required this.myr,
    // required this.ngn,
    // required this.nok,
    // required this.nzd,
    // required this.php,
    // required this.pkr,
    // required this.pln,
    // required this.rub,
    // required this.sar,
    // required this.sek,
    // required this.sgd,
    // required this.thb,
    // required this.tTry,
    // required this.twd,
    // required this.uah,
    required this.usd,
    // required this.vef,
    // required this.vnd,
    // required this.xag,
    // required this.xau,
    // required this.xdr,
    // required this.xlm,
    // required this.xrp,
    // required this.yfi,
    // required this.zar,
    // required this.bits,
    // required this.link,
    // required this.sats,
  });

  DoublePerCurrency copyWith({
    // double? aed,
    // double? ars,
    // double? aud,
    // double? bch,
    // double? bdt,
    // double? bhd,
    // double? bmd,
    // double? bnb,
    // double? brl,
    double? btc,
    // double? cad,
    // double? chf,
    // double? clp,
    // double? cny,
    // double? czk,
    // double? dkk,
    // double? dot,
    // double? eos,
    double? eth,
    double? eur,
    double? gbp,
    // double? hkd,
    // double? huf,
    // double? idr,
    // double? ils,
    // double? inr,
    // double? jpy,
    // double? krw,
    // double? kwd,
    // double? lkr,
    double? ltc,
    // double? mmk,
    // double? mxn,
    // double? myr,
    // double? ngn,
    // double? nok,
    // double? nzd,
    // double? php,
    // double? pkr,
    // double? pln,
    // double? rub,
    // double? sar,
    // double? sek,
    // double? sgd,
    // double? thb,
    // double? tTry,
    // double? twd,
    // double? uah,
    double? usd,
    // double? vef,
    // double? vnd,
    // double? xag,
    // double? xau,
    // double? xdr,
    // double? xlm,
    // double? xrp,
    // double? yfi,
    // double? zar,
    // double? bits,
    // double? link,
    // double? sats,
  }) {
    return DoublePerCurrency(
      // aed: aed ?? this.aed,
      // ars: ars ?? this.ars,
      // aud: aud ?? this.aud,
      // bch: bch ?? this.bch,
      // bdt: bdt ?? this.bdt,
      // bhd: bhd ?? this.bhd,
      // bmd: bmd ?? this.bmd,
      // bnb: bnb ?? this.bnb,
      // brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      // cad: cad ?? this.cad,
      // chf: chf ?? this.chf,
      // clp: clp ?? this.clp,
      // cny: cny ?? this.cny,
      // czk: czk ?? this.czk,
      // dkk: dkk ?? this.dkk,
      // dot: dot ?? this.dot,
      // eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      // hkd: hkd ?? this.hkd,
      // huf: huf ?? this.huf,
      // idr: idr ?? this.idr,
      // ils: ils ?? this.ils,
      // inr: inr ?? this.inr,
      // jpy: jpy ?? this.jpy,
      // krw: krw ?? this.krw,
      // kwd: kwd ?? this.kwd,
      // lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      // mmk: mmk ?? this.mmk,
      // mxn: mxn ?? this.mxn,
      // myr: myr ?? this.myr,
      // ngn: ngn ?? this.ngn,
      // nok: nok ?? this.nok,
      // nzd: nzd ?? this.nzd,
      // php: php ?? this.php,
      // pkr: pkr ?? this.pkr,
      // pln: pln ?? this.pln,
      // rub: rub ?? this.rub,
      // sar: sar ?? this.sar,
      // sek: sek ?? this.sek,
      // sgd: sgd ?? this.sgd,
      // thb: thb ?? this.thb,
      // tTry: tTry ?? this.tTry,
      // twd: twd ?? this.twd,
      // uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      // vef: vef ?? this.vef,
      // vnd: vnd ?? this.vnd,
      // xag: xag ?? this.xag,
      // xau: xau ?? this.xau,
      // xdr: xdr ?? this.xdr,
      // xlm: xlm ?? this.xlm,
      // xrp: xrp ?? this.xrp,
      // yfi: yfi ?? this.yfi,
      // zar: zar ?? this.zar,
      // bits: bits ?? this.bits,
      // link: link ?? this.link,
      // sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'aed': aed,
      // 'ars': ars,
      // 'aud': aud,
      // 'bch': bch,
      // 'bdt': bdt,
      // 'bhd': bhd,
      // 'bmd': bmd,
      // 'bnb': bnb,
      // 'brl': brl,
      'btc': btc,
      // 'cad': cad,
      // 'chf': chf,
      // 'clp': clp,
      // 'cny': cny,
      // 'czk': czk,
      // 'dkk': dkk,
      // 'dot': dot,
      // 'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      // 'hkd': hkd,
      // 'huf': huf,
      // 'idr': idr,
      // 'ils': ils,
      // 'inr': inr,
      // 'jpy': jpy,
      // 'krw': krw,
      // 'kwd': kwd,
      // 'lkr': lkr,
      'ltc': ltc,
      // 'mmk': mmk,
      // 'mxn': mxn,
      // 'myr': myr,
      // 'ngn': ngn,
      // 'nok': nok,
      // 'nzd': nzd,
      // 'php': php,
      // 'pkr': pkr,
      // 'pln': pln,
      // 'rub': rub,
      // 'sar': sar,
      // 'sek': sek,
      // 'sgd': sgd,
      // 'thb': thb,
      // 'try': tTry,
      // 'twd': twd,
      // 'uah': uah,
      'usd': usd,
      // 'vef': vef,
      // 'vnd': vnd,
      // 'xag': xag,
      // 'xau': xau,
      // 'xdr': xdr,
      // 'xlm': xlm,
      // 'xrp': xrp,
      // 'yfi': yfi,
      // 'zar': zar,
      // 'bits': bits,
      // 'link': link,
      // 'sats': sats,
    };
  }

  factory DoublePerCurrency.fromMap(Map<String, dynamic> map) {
    return DoublePerCurrency(
      // aed: map['aed']?.toDouble(),
      // ars: map['ars']?.toDouble(),
      // aud: map['aud']?.toDouble(),
      // bch: map['bch']?.toDouble(),
      // bdt: map['bdt']?.toDouble(),
      // bhd: map['bhd']?.toDouble(),
      // bmd: map['bmd']?.toDouble(),
      // bnb: map['bnb']?.toDouble(),
      // brl: map['brl']?.toDouble(),
      btc: map['btc']?.toDouble(),
      // cad: map['cad']?.toDouble(),
      // chf: map['chf']?.toDouble(),
      // clp: map['clp']?.toDouble(),
      // cny: map['cny']?.toDouble(),
      // czk: map['czk']?.toDouble(),
      // dkk: map['dkk']?.toDouble(),
      // dot: map['dot']?.toDouble(),
      // eos: map['eos']?.toDouble(),
      eth: map['eth']?.toDouble(),
      eur: map['eur']?.toDouble(),
      gbp: map['gbp']?.toDouble(),
      // hkd: map['hkd']?.toDouble(),
      // huf: map['huf']?.toDouble(),
      // idr: map['idr']?.toDouble(),
      // ils: map['ils']?.toDouble(),
      // inr: map['inr']?.toDouble(),
      // jpy: map['jpy']?.toDouble(),
      // krw: map['krw']?.toDouble(),
      // kwd: map['kwd']?.toDouble(),
      // lkr: map['lkr']?.toDouble(),
      ltc: map['ltc']?.toDouble(),
      // mmk: map['mmk']?.toDouble(),
      // mxn: map['mxn']?.toDouble(),
      // myr: map['myr']?.toDouble(),
      // ngn: map['ngn']?.toDouble(),
      // nok: map['nok']?.toDouble(),
      // nzd: map['nzd']?.toDouble(),
      // php: map['php']?.toDouble(),
      // pkr: map['pkr']?.toDouble(),
      // pln: map['pln']?.toDouble(),
      // rub: map['rub']?.toDouble(),
      // sar: map['sar']?.toDouble(),
      // sek: map['sek']?.toDouble(),
      // sgd: map['sgd']?.toDouble(),
      // thb: map['thb']?.toDouble(),
      // tTry: map['try']?.toDouble(),
      // twd: map['twd']?.toDouble(),
      // uah: map['uah']?.toDouble(),
      usd: map['usd']?.toDouble(),
      // vef: map['vef']?.toDouble(),
      // vnd: map['vnd']?.toDouble(),
      // xag: map['xag']?.toDouble(),
      // xau: map['xau']?.toDouble(),
      // xdr: map['xdr']?.toDouble(),
      // xlm: map['xlm']?.toDouble(),
      // xrp: map['xrp']?.toDouble(),
      // yfi: map['yfi']?.toDouble(),
      // zar: map['zar']?.toDouble(),
      // bits: map['bits']?.toDouble(),
      // link: map['link']?.toDouble(),
      // sats: map['sats']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DoublePerCurrency.fromJson(String source) =>
      DoublePerCurrency.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      // aed,
      // ars,
      // aud,
      // bch,
      // bdt,
      // bhd,
      // bmd,
      // bnb,
      // brl,
      btc,
      // cad,
      // chf,
      // clp,
      // cny,
      // czk,
      // dkk,
      // dot,
      // eos,
      eth,
      eur,
      gbp,
      // hkd,
      // huf,
      // idr,
      // ils,
      // inr,
      // jpy,
      // krw,
      // kwd,
      // lkr,
      ltc,
      // mmk,
      // mxn,
      // myr,
      // ngn,
      // nok,
      // nzd,
      // php,
      // pkr,
      // pln,
      // rub,
      // sar,
      // sek,
      // sgd,
      // thb,
      // tTry,
      // twd,
      // uah,
      usd,
      // vef,
      // vnd,
      // xag,
      // xau,
      // xdr,
      // xlm,
      // xrp,
      // yfi,
      // zar,
      // bits,
      // link,
      // sats,
    ];
  }
}
