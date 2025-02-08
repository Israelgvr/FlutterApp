import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '';
import 'package:prueba3/data/models/login_request.dart';
import 'package:prueba3/data/models/login_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://localhost:9000/api")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("/login")
  Future<LoginResponse> login(@Body() LoginRequest request);


}
