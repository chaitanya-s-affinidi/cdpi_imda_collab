import 'package:job_portal/features/affinidi-login/data/data_sources/affinidi_auth_api.dart';
import 'package:job_portal/features/affinidi-login/data/repositories/affinidi_auth_repo_impl.dart';
import 'package:job_portal/features/affinidi-login/domain/repositories/affinidi_auth_repo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:job_portal/features/affinidi_tdk_integration/data/data_sources/backend_iota_api.dart';
import 'package:job_portal/features/affinidi_tdk_integration/data/repositories/affinidi_redirect_flow_repo_impl.dart';
import 'package:job_portal/features/affinidi_tdk_integration/data/repositories/affinidi_verification_repo_impl.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/repositories/affinidi_redirect_flow_repository.dart';
import 'package:job_portal/features/affinidi_tdk_integration/domain/repositories/affinidi_verification_repository.dart';
import 'package:job_portal/features/inji_oid4vp/data/repositories/oid4vp_websocket_repo_impl.dart';
import 'package:job_portal/features/inji_oid4vp/domain/repositories/oid4vp_websocket_repo.dart';
import 'package:job_portal/features/inji_oid4vp/domain/usecases/handle_event_data_from_web_socket.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceRegistry {
  static registerAll() {
    final getIt = GetIt.instance;
    getIt.registerLazySingleton<AffinidiAuthApi>(
      () => AffinidiAuthApi(
        ServiceRegistry.get<Dio>(),
        baseUrl: dotenv.env["AUTH_BACKEND_URL"]!,
      ),
    );
    getIt.registerLazySingleton<BackendIotaApi>(
      () => BackendIotaApi(
        ServiceRegistry.get<Dio>(),
        baseUrl: dotenv.env["BACKEND_URL"]!,
      ),
    );

    getIt.registerLazySingleton<Oid4vpWebsocketRepo>(
      () => Oid4vpWebsocketRepoImpl(),
    );

    getIt.registerLazySingleton<AffinidiRedirectFlowRepo>(
      () => RetrofitAffinidiRedirectFlowRepositoryImpl(
        remoteDataSource: ServiceRegistry.get<BackendIotaApi>(),
        prefs: ServiceRegistry.get<SharedPreferences>(),
      ),
    );

    getIt.registerLazySingleton<AffinidiVerificationRepo>(
      () => RetrofitAffinidiVerificationRepositoryImpl(
        remoteDataSource: ServiceRegistry.get<BackendIotaApi>(),
      ),
    );

    getIt.registerLazySingleton<AffinidiAuthRepo>(
      () => RetrofitAffinidiAuthRepositoryImpl(
        remoteDataSource: ServiceRegistry.get<AffinidiAuthApi>(),
      ),
    );
    // External libraries
    final defaultdio = Dio(
      BaseOptions(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    defaultdio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

    getIt.registerLazySingleton<Dio>(
      () => defaultdio,
    );

    getIt.registerSingletonAsync<SharedPreferences>(() async {
      return SharedPreferences.getInstance();
    });
  }

  static T get<T extends Object>() {
    return GetIt.instance.get<T>();
  }
}
