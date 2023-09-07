import 'package:di/di.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:top_up/src/modules/top_up/data/response/top_up_config_response.dart';
import 'package:top_up/src/modules/top_up/domain/exception/fetch_top_up_config_exception.dart';

@injectable
class RemoteTopUpDataSource {
  final Dio _dio;
  final Dio _secureDio;

  const RemoteTopUpDataSource({
    required Dio dio,
    @secureDio required Dio secureDio,
  })  : _dio = dio,
        _secureDio = secureDio;

  Future<TopUpConfigResponse> getConfig() async {
    await Future.delayed(const Duration(seconds: 4));
    final response = await _dio.get("wallet/topupSuggestions/");
    if (response.statusCode == 200) {
      return TopUpConfigResponse.fromJson(response.data["result"]);
    } else {
      throw const FetchTopUpConfigException();
    }
  }

  Future<void> doPayment() async {
    final response = await _secureDio.get("wallet/topupSuggestions/");
    if (response.statusCode != 200) {
      throw const FetchTopUpConfigException();
    }
  }
}
