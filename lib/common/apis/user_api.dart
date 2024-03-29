import 'package:uleaning_app_bloc/common/entities/entities.dart';

import '../utils/http_util.dart';

class UserAPI{
  static login({LoginRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/login',
      queryParameters: params?.toJson()
    );
    print(response);
    return UserLoginResponseEntity.fromJson(response);
  }
}