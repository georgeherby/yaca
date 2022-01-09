// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:equatable/equatable.dart';

class AthDate extends Equatable {
  final String aed;
  final String ars;
  final String aud;
  final String bch;
  final String bdt;
  final String bhd;
  final String bmd;
  final String bnb;
  final String brl;
  final String btc;
  final String cad;
  final String chf;
  final String clp;
  final String cny;
  final String czk;
  final String dkk;
  final String dot;
  final String eos;
  final String eth;
  final String eur;
  final String gbp;
  final String hkd;
  final String huf;
  final String idr;
  final String ils;
  final String inr;
  final String jpy;
  final String krw;
  final String kwd;
  final String lkr;
  final String ltc;
  final String mmk;
  final String mxn;
  final String myr;
  final String ngn;
  final String nok;
  final String nzd;
  final String php;
  final String pkr;
  final String pln;
  final String rub;
  final String sar;
  final String sek;
  final String sgd;
  final String thb;
  final String tTry;
  final String twd;
  final String uah;
  final String usd;
  final String vef;
  final String vnd;
  final String xag;
  final String xau;
  final String xdr;
  final String xlm;
  final String xrp;
  final String yfi;
  final String zar;
  final String bits;
  final String link;
  final String sats;
  const AthDate({
    required this.aed,
    required this.ars,
    required this.aud,
    required this.bch,
    required this.bdt,
    required this.bhd,
    required this.bmd,
    required this.bnb,
    required this.brl,
    required this.btc,
    required this.cad,
    required this.chf,
    required this.clp,
    required this.cny,
    required this.czk,
    required this.dkk,
    required this.dot,
    required this.eos,
    required this.eth,
    required this.eur,
    required this.gbp,
    required this.hkd,
    required this.huf,
    required this.idr,
    required this.ils,
    required this.inr,
    required this.jpy,
    required this.krw,
    required this.kwd,
    required this.lkr,
    required this.ltc,
    required this.mmk,
    required this.mxn,
    required this.myr,
    required this.ngn,
    required this.nok,
    required this.nzd,
    required this.php,
    required this.pkr,
    required this.pln,
    required this.rub,
    required this.sar,
    required this.sek,
    required this.sgd,
    required this.thb,
    required this.tTry,
    required this.twd,
    required this.uah,
    required this.usd,
    required this.vef,
    required this.vnd,
    required this.xag,
    required this.xau,
    required this.xdr,
    required this.xlm,
    required this.xrp,
    required this.yfi,
    required this.zar,
    required this.bits,
    required this.link,
    required this.sats,
  });

  AthDate copyWith({
    String? aed,
    String? ars,
    String? aud,
    String? bch,
    String? bdt,
    String? bhd,
    String? bmd,
    String? bnb,
    String? brl,
    String? btc,
    String? cad,
    String? chf,
    String? clp,
    String? cny,
    String? czk,
    String? dkk,
    String? dot,
    String? eos,
    String? eth,
    String? eur,
    String? gbp,
    String? hkd,
    String? huf,
    String? idr,
    String? ils,
    String? inr,
    String? jpy,
    String? krw,
    String? kwd,
    String? lkr,
    String? ltc,
    String? mmk,
    String? mxn,
    String? myr,
    String? ngn,
    String? nok,
    String? nzd,
    String? php,
    String? pkr,
    String? pln,
    String? rub,
    String? sar,
    String? sek,
    String? sgd,
    String? thb,
    String? tTry,
    String? twd,
    String? uah,
    String? usd,
    String? vef,
    String? vnd,
    String? xag,
    String? xau,
    String? xdr,
    String? xlm,
    String? xrp,
    String? yfi,
    String? zar,
    String? bits,
    String? link,
    String? sats,
  }) {
    return AthDate(
      aed: aed ?? this.aed,
      ars: ars ?? this.ars,
      aud: aud ?? this.aud,
      bch: bch ?? this.bch,
      bdt: bdt ?? this.bdt,
      bhd: bhd ?? this.bhd,
      bmd: bmd ?? this.bmd,
      bnb: bnb ?? this.bnb,
      brl: brl ?? this.brl,
      btc: btc ?? this.btc,
      cad: cad ?? this.cad,
      chf: chf ?? this.chf,
      clp: clp ?? this.clp,
      cny: cny ?? this.cny,
      czk: czk ?? this.czk,
      dkk: dkk ?? this.dkk,
      dot: dot ?? this.dot,
      eos: eos ?? this.eos,
      eth: eth ?? this.eth,
      eur: eur ?? this.eur,
      gbp: gbp ?? this.gbp,
      hkd: hkd ?? this.hkd,
      huf: huf ?? this.huf,
      idr: idr ?? this.idr,
      ils: ils ?? this.ils,
      inr: inr ?? this.inr,
      jpy: jpy ?? this.jpy,
      krw: krw ?? this.krw,
      kwd: kwd ?? this.kwd,
      lkr: lkr ?? this.lkr,
      ltc: ltc ?? this.ltc,
      mmk: mmk ?? this.mmk,
      mxn: mxn ?? this.mxn,
      myr: myr ?? this.myr,
      ngn: ngn ?? this.ngn,
      nok: nok ?? this.nok,
      nzd: nzd ?? this.nzd,
      php: php ?? this.php,
      pkr: pkr ?? this.pkr,
      pln: pln ?? this.pln,
      rub: rub ?? this.rub,
      sar: sar ?? this.sar,
      sek: sek ?? this.sek,
      sgd: sgd ?? this.sgd,
      thb: thb ?? this.thb,
      tTry: tTry ?? this.tTry,
      twd: twd ?? this.twd,
      uah: uah ?? this.uah,
      usd: usd ?? this.usd,
      vef: vef ?? this.vef,
      vnd: vnd ?? this.vnd,
      xag: xag ?? this.xag,
      xau: xau ?? this.xau,
      xdr: xdr ?? this.xdr,
      xlm: xlm ?? this.xlm,
      xrp: xrp ?? this.xrp,
      yfi: yfi ?? this.yfi,
      zar: zar ?? this.zar,
      bits: bits ?? this.bits,
      link: link ?? this.link,
      sats: sats ?? this.sats,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'aed': aed,
      'ars': ars,
      'aud': aud,
      'bch': bch,
      'bdt': bdt,
      'bhd': bhd,
      'bmd': bmd,
      'bnb': bnb,
      'brl': brl,
      'btc': btc,
      'cad': cad,
      'chf': chf,
      'clp': clp,
      'cny': cny,
      'czk': czk,
      'dkk': dkk,
      'dot': dot,
      'eos': eos,
      'eth': eth,
      'eur': eur,
      'gbp': gbp,
      'hkd': hkd,
      'huf': huf,
      'idr': idr,
      'ils': ils,
      'inr': inr,
      'jpy': jpy,
      'krw': krw,
      'kwd': kwd,
      'lkr': lkr,
      'ltc': ltc,
      'mmk': mmk,
      'mxn': mxn,
      'myr': myr,
      'ngn': ngn,
      'nok': nok,
      'nzd': nzd,
      'php': php,
      'pkr': pkr,
      'pln': pln,
      'rub': rub,
      'sar': sar,
      'sek': sek,
      'sgd': sgd,
      'thb': thb,
      'try': tTry,
      'twd': twd,
      'uah': uah,
      'usd': usd,
      'vef': vef,
      'vnd': vnd,
      'xag': xag,
      'xau': xau,
      'xdr': xdr,
      'xlm': xlm,
      'xrp': xrp,
      'yfi': yfi,
      'zar': zar,
      'bits': bits,
      'link': link,
      'sats': sats,
    };
  }

  factory AthDate.fromMap(Map<String, dynamic> map) {
    return AthDate(
      aed: map['aed'],
      ars: map['ars'],
      aud: map['aud'],
      bch: map['bch'],
      bdt: map['bdt'],
      bhd: map['bhd'],
      bmd: map['bmd'],
      bnb: map['bnb'],
      brl: map['brl'],
      btc: map['btc'],
      cad: map['cad'],
      chf: map['chf'],
      clp: map['clp'],
      cny: map['cny'],
      czk: map['czk'],
      dkk: map['dkk'],
      dot: map['dot'],
      eos: map['eos'],
      eth: map['eth'],
      eur: map['eur'],
      gbp: map['gbp'],
      hkd: map['hkd'],
      huf: map['huf'],
      idr: map['idr'],
      ils: map['ils'],
      inr: map['inr'],
      jpy: map['jpy'],
      krw: map['krw'],
      kwd: map['kwd'],
      lkr: map['lkr'],
      ltc: map['ltc'],
      mmk: map['mmk'],
      mxn: map['mxn'],
      myr: map['myr'],
      ngn: map['ngn'],
      nok: map['nok'],
      nzd: map['nzd'],
      php: map['php'],
      pkr: map['pkr'],
      pln: map['pln'],
      rub: map['rub'],
      sar: map['sar'],
      sek: map['sek'],
      sgd: map['sgd'],
      thb: map['thb'],
      tTry: map['try'],
      twd: map['twd'],
      uah: map['uah'],
      usd: map['usd'],
      vef: map['vef'],
      vnd: map['vnd'],
      xag: map['xag'],
      xau: map['xau'],
      xdr: map['xdr'],
      xlm: map['xlm'],
      xrp: map['xrp'],
      yfi: map['yfi'],
      zar: map['zar'],
      bits: map['bits'],
      link: map['link'],
      sats: map['sats'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AthDate.fromJson(String source) =>
      AthDate.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      aed,
      ars,
      aud,
      bch,
      bdt,
      bhd,
      bmd,
      bnb,
      brl,
      btc,
      cad,
      chf,
      clp,
      cny,
      czk,
      dkk,
      dot,
      eos,
      eth,
      eur,
      gbp,
      hkd,
      huf,
      idr,
      ils,
      inr,
      jpy,
      krw,
      kwd,
      lkr,
      ltc,
      mmk,
      mxn,
      myr,
      ngn,
      nok,
      nzd,
      php,
      pkr,
      pln,
      rub,
      sar,
      sek,
      sgd,
      thb,
      tTry,
      twd,
      uah,
      usd,
      vef,
      vnd,
      xag,
      xau,
      xdr,
      xlm,
      xrp,
      yfi,
      zar,
      bits,
      link,
      sats,
    ];
  }
}
