import '../enum/mensagem_tipo_enum.dart';
import '../utils/console_log.dart';
import '../utils/shared_preferences_helper.dart';

class MySharedPreferences extends SharedPreferencesHelper {
  Future<void> add({
    required int? id,
    required String? name,
    required String? tokenApi,
  }) async {
    SharedPreferencesHelper prefsHelper = SharedPreferencesHelper();

    await prefsHelper.addUser('userToken', {
      'id': id?.toString() ?? '0',
      'nome': name ?? 'sem-nome',
      'tokenApi': tokenApi ?? '',
    });

    ConsoleLog.mensagem(
      titulo: "shared-preferences",
      mensagem: "shared-preferences-sucedido. Token armazenado. $name",
      tipo: MensagemTipo.SUCESSO,
    );
  }
}
