import 'package:pos/data/datasource/remote/common_api.dart';
import 'package:pos/data/model/response.dart';

class CommonRepository {
  final CommonApi api;

  CommonRepository(this.api);

  Future<BaseResponse> getCommonData() async {
    return await api.getCommon();
  }
}