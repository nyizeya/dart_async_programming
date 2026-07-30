import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class AdviceApiClient {
  Future<String> getAdvice() async {
    return await Future.delayed(
      const Duration(seconds: 2),
      () => "Smoke weed everyday",
    );
  }
}

class AdviceRepository {
  final AdviceApiClient apiClient;
  AdviceRepository(this.apiClient);
}

void configureDependencies() {
  getIt.registerSingleton<AdviceApiClient>(AdviceApiClient());
  getIt.registerLazySingleton<AdviceRepository>(
    () => AdviceRepository(getIt<AdviceApiClient>()),
  );
}

void main(List<String> args) async {
  configureDependencies();

  print("***** Starting ******");
  final advice = await getIt<AdviceRepository>().apiClient.getAdvice();

  print("Today advice [$advice]");
  print("I hope it's helpful");
}
