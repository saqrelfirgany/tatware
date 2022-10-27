import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tatware/core/utils/app_constants.dart';
import 'package:tatware/core/utils/helper.dart';

import 'getsnack_bars.dart';

// import 'package:egystore/Controllers/lang_controller.dart';
// import 'package:get/get.dart' as getx;

class DioHelper {
  static Dio? dio;

  /// Auto show errors
  static bool isAutoShowErrors = true;

  /// Set user auth token
  static var userAuthenticationToken;

  /// Initialize dio
  static Future init() async {
    /// Get user language code from storage
    // String userLocale = getx.Get.find<LangController>().selectedLang;

    /// Get user auth token
    // userAuthenticationToken = await Helper.getUserTokenInSharedPreferences();

    /// Set headers
    var headers = {
      "Accept": "application/json",
      // "lang": '$userLocale',
      // "Authorization": "Bearer ${Helper.token}",
    };

    /// Set dio
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        followRedirects: true,
        receiveDataWhenStatusError: true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        headers: headers,
        connectTimeout: 10 * 1000,
        // 60 seconds
        receiveTimeout: 10 * 1000,
        // 60 seconds
        validateStatus: (status) {
          return status! < 800;
        },
      ),
    );
  }

  /// Handle response
  static handleResponse(response) async {
    try {
      /// Convert response form json
      response = jsonDecode(response.toString());

      /// Handle errors
      if (response['status'] == false) {
        /// Check authentication errors
        if (response['statusCode'] == 401) {
          /// User unauthenticated
          await Helper.saveUserTokenInSharedPreferences('');
        }

        /// If any errors returned
        if (isAutoShowErrors == true &&
            response['data']?['errors'] != null &&
            response['data']?['errors'].length > 0) {
          /// Auto show errors
          // getSnackBar(title: 'error', body: response['errors']);
        }
      }
    } on SocketException {
      // getSnackBar(title: 'error', body: 'error-internet');
      return;
    } catch (e) {
      /// Set response
      response = {'status': false};

      /// Auto show errors
      if (isAutoShowErrors == true) {
        // CSomethingWentWrongDialog();
        // getSnackBar(title: 'error', body: 'someThingWentWrong');
      }

      /// Stop loader

    }

    return response;
  }

  /// Handle data to formData
  static Future dataToFormData({
    files,
    String? fromDataAttributeName,
    Map? data,
  }) async {
    /// If files
    /// Handle if array or file
    if (files is Map && files.isNotEmpty) {
      /// Set attribute name
      fromDataAttributeName = fromDataAttributeName ?? 'files';

      /// Set files data form
      List filesDataForm = [];

      /// Add each file
      for (int key in files.keys) {
        await MultipartFile.fromFile(
          files[key].path,
          filename: files[key].path.split('/').last,
        ).then((fileFromData) {
          /// Set file data form
          filesDataForm.add({
            'file': fileFromData,
          });
        });
      }

      return FormData.fromMap({
        fromDataAttributeName: filesDataForm,
        ...(data ?? {}),
      });
    } else if (files is File) {
      /// Set attribute name
      fromDataAttributeName = fromDataAttributeName ?? 'file';

      return FormData.fromMap({
        fromDataAttributeName: {
          'files': await MultipartFile.fromFile(
            files.path,
            filename: files.path.split('/').last,
          ),
        },
        ...(data ?? {}),
      });
    } else {
      return FormData.fromMap({
        ...(data ?? {}),
      });
    }
  }

  /// GET
  static Future get({
    required String url,
    Map<String, dynamic>? parameters,
    int? page = 1,
    int? limit,
    bool returnRawResponse = false,
    bool applyUserTypeInUrl = false,
  }) async {
    /// Check network connection
    // if (GlobalVariables.isDeviceConnectedToTheInternet.value == false) {
    //   await NetworkHelper.check();
    // }

    /// add user type to the url
    // if (applyUserTypeInUrl == true) {
    //   /// Get fcm token
    //   String userType = await Authentication.getUserType();
    //   url = "$userType/$url";
    // }

    /// Set pagination limit

    // if (parameters != null) {
    //   if (limit != null && limit > 0) {
    //     parameters['limit'] = limit;
    //   }
    //   parameters['page'] = page;
    // } else {
    //   if (limit != null && limit > 0) {
    //     parameters = {
    //       'limit': limit,
    //       'page': page,
    //     };
    //   } else {
    //     parameters = {
    //       'page': page,
    //     };
    //   }
    // }

    ///
    /// Send request
    ///
    try {
      var response = await dio!.get(url);
      // debugPrint('saqr$response');

      dynamic dynamicResponse = await jsonDecode(response.toString());
      if (response.statusCode == 200) {
        return dynamicResponse;
      } else {
        showError(body: dynamicResponse['status_message'].toString());
        return dynamicResponse;
      }
    } on DioError catch (e) {
      if (e.error is SocketException || e.type == DioErrorType.connectTimeout) {
        showError(body: 'error-internet');
        return false;
      }
    } catch (e) {
      showError(body: 'someThingWentWrong');
      return false;
    }

    /// Send request

    // // if (config['isDebugMode']) print("[API] GET: $url");
    // print("[API] GET: $url");
    // print("[API] GET: $response");
    // return (returnRawResponse ? response : await handleResponse(response));
  }

  /// POST
  static Future post({
    url,
    parameters,
    data,
    returnRawResponse = false,
    applyUserTypeInUrl = false,
  }) async {
    ///
    /// Send request
    ///
    try {
      final response = await dio!.post(
        url,
        queryParameters: parameters,
        data: data,
      );
      debugPrint(response.toString());
      dynamic dynamicResponse = await jsonDecode(response.toString());
      if (response.statusCode == 200) {
        return dynamicResponse;
      } else {
        showError(body: dynamicResponse['status_message'].toString());
        return false;
      }
    } on DioError catch (e) {
      if (e.error is SocketException || e.type == DioErrorType.connectTimeout) {
        showError(body: 'error-internet');
        return false;
      }
    } catch (e) {
      showError(body: 'someThingWentWrong');
      return false;
    }
  }

  /// PUT
  static Future put(
    url, {
    parameters,
    data,
    returnRawResponse = false,
    applyUserTypeInUrl = false,
  }) async {
    /// Check network connection
    // if (GlobalVariables.isDeviceConnectedToTheInternet.value == false) {
    //   await NetworkHelper.check();
    // }

    /// add user type to the url
    // if (applyUserTypeInUrl == true) {
    //   /// Get fcm token
    //   String userType = await Authentication.getUserType();
    //   url = "$userType/$url";
    // }

    /// Send request
    var response = await dio?.put(
      url,
      queryParameters: parameters,
      data: data,
    );

    // if (config['isDebugMode']) print("[API] PUT: $url");

    return (returnRawResponse ? response : await handleResponse(response));
  }

  /// PATCH
  static Future patch(
    url, {
    parameters,
    data,
    returnRawResponse = false,
    applyUserTypeInUrl = false,
  }) async {
    /// Check network connection
    // if (GlobalVariables.isDeviceConnectedToTheInternet.value == false) {
    //   await NetworkHelper.check();
    // }

    /// add user type to the url
    // if (applyUserTypeInUrl == true) {
    //   /// Get fcm token
    //   String userType = await Authentication.getUserType();
    //   url = "$userType/$url";
    // }

    /// Send request
    var response = await dio?.patch(
      url,
      queryParameters: parameters,
      data: data,
    );

    // if (config['isDebugMode']) print("[API] PATCH: $url");

    return (returnRawResponse ? response : await handleResponse(response));
  }

  /// DELETE
  static Future delete({
    url,
    parameters,
    returnRawResponse = false,
    applyUserTypeInUrl = false,
  }) async {
    /// Check network connection
    // if (GlobalVariables.isDeviceConnectedToTheInternet.value == false) {
    //   await NetworkHelper.check();
    // }

    /// add user type to the url
    // if (applyUserTypeInUrl == true) {
    //   /// Get fcm token
    //   String userType = await Authentication.getUserType();
    //   url = "$userType/$url";
    // }

    /// Send request
    var response = await dio?.delete(
      url,
      // queryParameters: parameters,
    );
    dynamic dynamicResponse = await jsonDecode(response.toString());
    return dynamicResponse;
    // if (config['isDebugMode']) print("[API] DELETE: $url");

    // return (returnRawResponse ? response : await handleResponse(response));
  }

  /// Download file
// static Future download(
//   String url,
//   String fileName, {
//   Function(int count, int total)? showDownloadProgress,
// }) async {
//   var cancelToken = CancelToken();
//   try {
//     await dio?.download(
//       url,
//       "./${config['cacheSavePath']}/$fileName",
//       onReceiveProgress: showDownloadProgress,
//       cancelToken: cancelToken,
//     );
//   } catch (e) {
//     print(e);
//   }
// }
}
