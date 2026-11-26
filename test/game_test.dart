import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_masal_kitapligi/oyun_masal_kitapligi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(masalKitapligiConfig.title.length, 33);
    expect(masalKitapligiConfig.tagline.length, 33);
    for (final s in masalKitapligiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(masalKitapligiConfig.gameId, masalKitapligiId);
    expect(masalKitapligiRules.gameId, masalKitapligiId);
    expect(masalKitapligiConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(masalKitapligiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: masalKitapligiId, optionalMechanics: masalKitapligiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(masalKitapligiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
