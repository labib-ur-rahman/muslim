import 'package:dartz/dartz.dart';
import 'package:shirahsoft_muslim/core/errors/failures.dart';
import 'package:shirahsoft_muslim/features/quran/data/repositories/voice_ayah_by_ayah_impl.dart';
import 'package:shirahsoft_muslim/features/quran/domain/repositories/voice_ayah_by_ayah_repo.dart';

class GetVoiceAyahByAyah {
  final VoiceAyahByAyahImpl voiceAyahByAyahImpl;
  GetVoiceAyahByAyah(this.voiceAyahByAyahImpl);
  Either<Failure, String> call({
    required AyahVoiceParameter ayahVoiceParameter,
  }) {
    return voiceAyahByAyahImpl.getAyahVoice(ayahVoiceParameter);
  }
}
