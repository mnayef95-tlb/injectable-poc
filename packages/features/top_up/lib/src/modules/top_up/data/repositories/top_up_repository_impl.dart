import 'package:injectable/injectable.dart';
import 'package:top_up/src/modules/top_up/data/mapper/top_up_config_mapper.dart';
import 'package:top_up/src/modules/top_up/data/response/top_up_config_response.dart';
import 'package:top_up/src/modules/top_up/data/sources/memory_top_up_data_source.dart';
import 'package:top_up/src/modules/top_up/data/sources/remote_top_up_data_source.dart';
import 'package:top_up/src/modules/top_up/domain/entity/top_up_config.dart';
import 'package:top_up/src/modules/top_up/domain/top_up_repository.dart';

@Injectable(as: TopUpRepository)
class TopUpRepositoryImpl extends TopUpRepository {
  final RemoteTopUpDataSource _remoteDataSource;
  final MemoryTopUpDataSource _memoryDataSource;
  final TopUpConfigMapper _configMapper;

  TopUpRepositoryImpl({
    required RemoteTopUpDataSource remoteDataSource,
    required MemoryTopUpDataSource memoryDataSource,
    required TopUpConfigMapper configMapper,
  })  : _remoteDataSource = remoteDataSource,
        _memoryDataSource = memoryDataSource,
        _configMapper = configMapper;

  @override
  Future<TopUpConfig> getConfig() async {
    final TopUpConfigResponse config;
    if (_memoryDataSource.topUpConfigResponse != null) {
      config = _memoryDataSource.topUpConfigResponse!;
    } else {
      config = await _remoteDataSource.getConfig();
      _memoryDataSource.topUpConfigResponse = config;
    }
    return _configMapper.map(config);
  }
}
