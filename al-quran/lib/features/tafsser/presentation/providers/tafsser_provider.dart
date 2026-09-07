import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shirahsoft_muslim/core/di/injection_container.dart';
import 'package:shirahsoft_muslim/features/tafsser/domain/entities/tafsser_entities.dart';
import 'package:shirahsoft_muslim/features/tafsser/domain/usecases/get_ayah_tafsser_usecase.dart';

final ayahTafsserProvider =
    FutureProvider.family<
      AyahTafsserEntity?,
      ({String tafsserId, int surahNumber, int ayahNumber})
    >((ref, arg) async {
      final getAyahTafsser = sl<GetAyahTafsserUseCase>();
      final result = await getAyahTafsser(
        tafsserId: arg.tafsserId,
        surahNumber: arg.surahNumber,
        ayahNumber: arg.ayahNumber,
      );
      return result.fold((failure) => null, (entity) => entity);
    });
