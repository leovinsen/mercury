import 'package:flutter_test/flutter_test.dart';
import 'package:mercury/secret/secret_loader.dart';

void main() {
  test('Ensure API Key is loaded', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    String apiKey = await getApiKey();
    print(apiKey);
    expect(apiKey, isNotNull);
  });
}
