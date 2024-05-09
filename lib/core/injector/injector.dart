import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zelenbank/authentication/data/datasources/change_user_theme_datasource.dart';
import 'package:zelenbank/authentication/data/datasources/check_user_auth_status_datasource.dart';
import 'package:zelenbank/authentication/data/datasources/get_current_user_datasource.dart';
import 'package:zelenbank/authentication/data/datasources/get_user_theme_datasource.dart';
import 'package:zelenbank/authentication/data/datasources/local/change_user_theme_local_datasource_impl.dart';
import 'package:zelenbank/authentication/data/datasources/local/get_user_theme_local_datasource_impl.dart';
import 'package:zelenbank/authentication/data/datasources/remote/check_user_auth_status_datasource_impl.dart';
import 'package:zelenbank/authentication/data/datasources/remote/get_current_user_datasource_impl.dart';
import 'package:zelenbank/authentication/data/datasources/remote/sign_in_with_google_datasource_impl.dart';
import 'package:zelenbank/authentication/data/datasources/remote/sign_out_google_datasource_impl.dart';
import 'package:zelenbank/authentication/data/datasources/sign_in_with_google_datasource.dart';
import 'package:zelenbank/authentication/data/datasources/sign_out_google_datasource.dart';
import 'package:zelenbank/authentication/data/repositories/change_user_theme_repository_impl.dart';
import 'package:zelenbank/authentication/data/repositories/check_user_auth_status_repository_impl.dart';
import 'package:zelenbank/authentication/data/repositories/get_current_user_repository_impl.dart';
import 'package:zelenbank/authentication/data/repositories/get_user_theme_repository_impl.dart';
import 'package:zelenbank/authentication/data/repositories/sign_in_with_google_repository_impl.dart';
import 'package:zelenbank/authentication/data/repositories/sign_out_google_repository_impl.dart';
import 'package:zelenbank/authentication/domain/repositories/change_user_theme_repository.dart';
import 'package:zelenbank/authentication/domain/repositories/check_user_auth_status_repository.dart';
import 'package:zelenbank/authentication/domain/repositories/get_current_user_repository.dart';
import 'package:zelenbank/authentication/domain/repositories/get_user_theme_repository.dart';
import 'package:zelenbank/authentication/domain/repositories/sign_in_with_google_repository.dart';
import 'package:zelenbank/authentication/domain/repositories/sign_out_google_repository.dart';
import 'package:zelenbank/authentication/domain/usecases/change_user_theme/change_user_theme_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/change_user_theme/change_user_theme_usecase_impl.dart';
import 'package:zelenbank/authentication/domain/usecases/check_user_auth_status/check_user_auth_status_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/check_user_auth_status/check_user_auth_status_usecase_impl.dart';
import 'package:zelenbank/authentication/domain/usecases/get_current_user/get_current_user_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/get_current_user/get_current_user_usecase_impl.dart';
import 'package:zelenbank/authentication/domain/usecases/get_user_theme/get_user_theme_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/get_user_theme/get_user_theme_usecase_impl.dart';
import 'package:zelenbank/authentication/domain/usecases/sign_in_with_google/sign_in_with_google_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/sign_in_with_google/sign_in_with_google_usecase_impl.dart';
import 'package:zelenbank/authentication/domain/usecases/sign_out/sign_out_google_usecase.dart';
import 'package:zelenbank/authentication/domain/usecases/sign_out/sign_out_google_usecase_impl.dart';
import 'package:zelenbank/authentication/presentation/controllers/auth_controller.dart';
import 'package:zelenbank/core/firebase/notification/firebase_notification_service.dart';
import 'package:zelenbank/core/firebase/notification/notification_service.dart';
import 'package:zelenbank/core/http_client/http_client.dart';
import 'package:zelenbank/core/http_client/http_client_interface.dart';
import 'package:zelenbank/layers/data/datasources/change_balance_visibility_datasource.dart';
import 'package:zelenbank/layers/data/datasources/get_balance_visibility_datasource.dart';
import 'package:zelenbank/layers/data/datasources/get_current_balance_datasource.dart';
import 'package:zelenbank/layers/data/datasources/get_transaction_by_id_datasource.dart';
import 'package:zelenbank/layers/data/datasources/get_transaction_list_datasource.dart';
import 'package:zelenbank/layers/data/datasources/local/change_balance_visibility_local_datasource_impl.dart';
import 'package:zelenbank/layers/data/datasources/local/get_balance_visibility_local_datasource_impl.dart';
import 'package:zelenbank/layers/data/datasources/remote/get_current_balance_remote_datasource_impl.dart';
import 'package:zelenbank/layers/data/datasources/remote/get_transaction_by_id_remote_datasource_impl.dart';
import 'package:zelenbank/layers/data/datasources/remote/get_transaction_list_remote_datasource_impl.dart';
import 'package:zelenbank/layers/data/repositories/change_balance_visibility_repository_impl.dart';
import 'package:zelenbank/layers/data/repositories/get_balance_visibility_resository_impl.dart';
import 'package:zelenbank/layers/data/repositories/get_current_balance_repository_impl.dart';
import 'package:zelenbank/layers/data/repositories/get_transaction_by_id_repository_impl.dart';
import 'package:zelenbank/layers/data/repositories/get_transaction_list_repository_impl.dart';
import 'package:zelenbank/layers/domain/repositories/change_balance_visibility_repository.dart';
import 'package:zelenbank/layers/domain/repositories/get_balance_visibility_resository.dart';
import 'package:zelenbank/layers/domain/repositories/get_current_balance_repository.dart';
import 'package:zelenbank/layers/domain/repositories/get_transaction_by_id_repository.dart';
import 'package:zelenbank/layers/domain/repositories/get_transaction_list_repository.dart';
import 'package:zelenbank/layers/domain/usecases/change_balance_visibility/change_balance_visibility_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/change_balance_visibility/change_balance_visibility_usecase_impl.dart';
import 'package:zelenbank/layers/domain/usecases/get_balance_visibility/get_balance_visibility_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_balance_visibility/get_balance_visibility_usecase_impl.dart';
import 'package:zelenbank/layers/domain/usecases/get_current_balance_usecase/get_current_balance_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_current_balance_usecase/get_current_balance_usecase_impl.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_by_id/get_transaction_by_id_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_by_id/get_transaction_by_id_usecase_impl.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_list/get_transaction_list_usecase.dart';
import 'package:zelenbank/layers/domain/usecases/get_transaction_list/get_transaction_list_usecase_impl.dart';
import 'package:zelenbank/layers/presentation/controllers/transaction_controller.dart';
import 'package:http/http.dart' as http;

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  // TRANSACTIONS ---------------------------------------------------

  // Usecases
  serviceLocator.registerLazySingleton<GetCurrentBalanceUsecase>(
      () => GetCurrentBalanceUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetTransactionByIdUsecase>(
      () => GetTransactionByIdUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetTransactionListUsecase>(
      () => GetTransactionListUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ChangeBalanceVisibilityUsecase>(
      () => ChangeBalanceVisibilityUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetBalanceVisibilityUsecase>(
      () => GetBalanceVisibilityUsecaseImpl(serviceLocator()));

  // Repositories
  serviceLocator.registerLazySingleton<GetCurrentBalanceRepository>(
      () => GetCurrentBalanceRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetTransactionByIdRepository>(
      () => GetTransactionByIdRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetTransactionListRepository>(
      () => GetTransactionListRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ChangeBalanceVisibilityRepository>(
      () => ChangeBalanceVisibilityRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetBalanceVisibilityRepository>(
      () => GetBalanceVisibilityRepositoryImpl(serviceLocator()));

  // Datasources
  serviceLocator.registerLazySingleton<GetCurrentBalanceDatasource>(
      () => GetCurrentBalanceRemoteDatasourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetTransactionByIdDatasource>(
      () => GetTransactionByIdRemoteDatasourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetTransactionListDatasource>(
      () => GetTransactionListRemoteDatasourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ChangeBalanceVisibilityDatasource>(
      () => ChangeBalanceVisibilityLocalDatasourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetBalanceVisibilityDatasource>(
      () => GetBalanceVisibilityDatasourceImpl(serviceLocator()));

  // Controllers
  serviceLocator.registerLazySingleton<TransactionController>(
    () => TransactionController(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );

  // Remote
  serviceLocator.registerLazySingleton<http.Client>(
    () => http.Client(),
  );
  serviceLocator.registerLazySingleton<IHttpClient>(
    () => HttpClient(serviceLocator()),
  );

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // Local
  serviceLocator
      .registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // AUTHENTICATION ----------------------------------------------------------

  // Usecases
  serviceLocator.registerLazySingleton<CheckUserAuthStatusUsecase>(
      () => CheckUserAuthStatusUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<SignInWithGoogleUsecase>(
      () => SignInWithGoogleUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<SignOutGoogleUsecase>(
      () => SignOutGoogleUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetCurrentUserUsecase>(
      () => GetCurrentUserUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetUserThemeUsecase>(
      () => GetUserThemeUsecaseImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ChangeUserThemeUsecase>(
      () => ChangeUserThemeUsecaseImpl(serviceLocator()));

  // Repositories
  serviceLocator.registerLazySingleton<CheckUserAuthStatusRepository>(
      () => CheckUserAuthStatusRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<SignInWithGoogleRepository>(
      () => SignInWithGoogleRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<SignOutGoogleRepository>(
      () => SignOutGoogleRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetCurrentUserRepository>(
      () => GetCurrentUserRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetUserThemeRepository>(
      () => GetUserThemeRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ChangeUserThemeRepository>(
      () => ChangeUserThemeRepositoryImpl(serviceLocator()));

  // Datasources
  serviceLocator.registerLazySingleton<CheckUserAuthStatusDatasource>(
      () => CheckUserAuthStatusDatasourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<SignInWithGoogleDatasource>(
      () => SignInWithGoogleDatasourceImpl(serviceLocator(), serviceLocator()));
  serviceLocator.registerLazySingleton<SignOutGoogleDatasource>(
      () => SignOutGoogleDatasourceImpl(serviceLocator(), serviceLocator()));
  serviceLocator.registerLazySingleton<GetCurrentUserDatasource>(
      () => GetCurrentUserDatasourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<GetUserThemeDatasource>(
      () => GetUserThemeLocalDatasourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ChangeUserThemeDatasource>(
      () => ChangeUserThemeLocalDatasourceImpl(serviceLocator()));

  // Controllers
  serviceLocator.registerLazySingleton<AuthController>(() => AuthController(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ));

  // Firebase
  serviceLocator
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  serviceLocator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  serviceLocator.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  serviceLocator.registerLazySingleton<FirebaseMessagingService>(
      () => FirebaseMessagingService(NotificationService()));
}
