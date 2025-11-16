import 'package:fruits_store/core/repos/product_repo.dart';
import 'package:fruits_store/core/repos/product_repo_impl.dart';
import 'package:fruits_store/core/services/data_service.dart';
import 'package:fruits_store/core/services/firebase_auth_service.dart';
import 'package:fruits_store/core/services/firestore_service.dart';
import 'package:fruits_store/features/auth/data/repos/auth_repo_imp.dart';
import 'package:fruits_store/features/auth/domain/repos/auth_repor.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIT() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DataService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      dataService: getIt<DataService>(),
    ),
  );

  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(dataService: getIt<DataService>()),
  );
}
