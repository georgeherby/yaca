import 'package:crypto_app/old/api/assets_api.dart';
import 'package:crypto_app/old/api/gloabal_stats.dart';
import 'package:crypto_app/old/models/asset_list_startup.dart';
import 'package:crypto_app/old/models/assets.dart';
import 'package:crypto_app/old/models/market_details.dart';
import 'package:http/http.dart' as http;

Future<AssetListStartup> fetchAssetListStartup(
  http.Client client,
) async {
  Assets _assets = await fetchAssetsList(client);
  MarketDetails _marketDetails = await fetchMarketDetails(client);

  return AssetListStartup(assets: _assets, marketDetails: _marketDetails);
}
