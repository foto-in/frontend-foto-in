import 'package:dio/dio.dart';
import 'package:foto_in/core/const/constant.dart';
import 'package:foto_in/core/errors/exceptions.dart';
import 'package:foto_in/core/token/SecureStorage.dart';
import 'package:foto_in/data/photographer/model/PhotographerDetailResponse.dart';
import 'package:foto_in/data/photographer/model/PhotographerListResponse.dart';
import 'package:foto_in/data/photographer/model/PhotographerRequest.dart';
import 'package:foto_in/data/photographer/model/PhotographerResponse.dart';
import 'package:foto_in/data/photographer/model/PortofolioDetailResponse.dart';
import 'package:foto_in/data/photographer/model/PortofolioListResponse.dart';
import 'package:foto_in/data/photographer/model/PortofolioRequest.dart';
import 'package:foto_in/data/photographer/model/PortofolioResponse.dart';

abstract class PhotographerDataSource {
  Future<PhotographerResponse> registerPhotographer(
      {required PhotographerRequest photographerRequest});
  Future<PortofolioResponse> postPortofolio(
      {required PortofolioRequest portofolioRequest});
  Future<PortofolioListResponse> getAllPortofolio(
      {required String photographerId});
  Future<PortofolioDetailResponse> getDetailPortofolio(
      {required String photographerId, required String portofolioId});
  Future<PhotographerListResponse> getAllPhotographer();
  Future<PhotographerDetailResponse> getPhotographer(
      {required String photographerId});
}

class PhotographerDataSourceImpl implements PhotographerDataSource {
  final Dio dio;

  PhotographerDataSourceImpl({required this.dio}) {
    //dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  @override
  Future<PortofolioListResponse> getAllPortofolio(
      {required String photographerId}) async {
    final response =
        await dio.get("$base_url$portofolio_path/$photographerId");

    print(response);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return PortofolioListResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PortofolioDetailResponse> getDetailPortofolio(
      {required String photographerId, required String portofolioId}) async {
    final response = await dio.get(
        "$base_url$portofolio_path/$photographerId/$portofolioId");

    print(response);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return PortofolioDetailResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PortofolioResponse> postPortofolio(
      {required PortofolioRequest portofolioRequest}) async {
    final token = await SecureStorage().readSecureData('token');

    final response = await dio.post(
      base_url + portofolio_path,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
      data: {
        "title": portofolioRequest.title,
        "description": portofolioRequest.description,
        "photos": portofolioRequest.photos,
      },
    );

    print(response);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return PortofolioResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PhotographerResponse> registerPhotographer(
      {required PhotographerRequest photographerRequest}) async {
    final token = await SecureStorage().readSecureData('token');

    try {
      final response = await dio.post(base_url + photographer_path,
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: photographerRequest.toJson());

      if (response.statusCode == 200) {
        return PhotographerResponse.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
      throw ServerException();
    }
  }

  @override
  Future<PhotographerListResponse> getAllPhotographer() async {
    final token = await SecureStorage().readSecureData('token');

    try {
      final response = await dio.get(
        base_url + get_photographer_path,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        return PhotographerListResponse.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
      throw ServerException();
    }
  }

  @override
  Future<PhotographerDetailResponse> getPhotographer(
      {required String photographerId}) async {
    final token = await SecureStorage().readSecureData('token');

    try {
      final response = await dio.get(
        "$base_url$get_photographer_by_id_path/$photographerId",
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      print(response);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final x = PhotographerDetailResponse.fromJson(response.data);
        return x;
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
      throw ServerException();
    } catch (e) {
      print("Exception: $e");
      throw ServerException();
    }
  }
}
