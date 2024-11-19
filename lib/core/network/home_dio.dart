import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

mixin HomeDio {
  Future<Dio> getDio() async {
    BaseOptions options = BaseOptions(
        baseUrl: 'https://api.zippopotam.us/',
        contentType: Headers.jsonContentType);
    final Dio dio = Dio(options);

    dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          enabled: true,
        ),
      ),
    );
    return dio;
  }
}
