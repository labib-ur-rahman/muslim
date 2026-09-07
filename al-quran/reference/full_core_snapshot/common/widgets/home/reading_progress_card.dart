import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shirahsoft_muslim/core/constants/surah_names.dart';
import 'package:shirahsoft_muslim/core/l10n/app_localizations.dart';
import 'package:shirahsoft_muslim/features/quran/data/models/mark.dart';
import 'package:shirahsoft_muslim/features/quran/presentation/providers/mark.dart';

/// بطاقة واحدة تجمع متابعة القراءة وتقدم الختمة، وتعرض دعوة بداية عند غياب
/// علامة قراءة محفوظة.
class ReadingProgressCard extends ConsumerStatefulWidget {
  const ReadingProgressCard({super.key, required this.onTap});

  static const int totalPages = 604;
  final ValueChanged<Mark?> onTap;

  @override
  ConsumerState<ReadingProgressCard> createState() =>
      _ReadingProgressCardState();
}

class _ReadingProgressCardState extends ConsumerState<ReadingProgressCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final mark = ref.watch(latestReadingMarkProvider);
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentPage = mark?.pageNumber.clamp(
      1,
      ReadingProgressCard.totalPages,
    );
    final progress = currentPage == null
        ? 0.0
        : currentPage / ReadingProgressCard.totalPages;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      child: AnimatedScale(
        scale: _isPressed ? 0.985 : 1,
        duration: const Duration(milliseconds: 130),
        curve: Curves.easeOutCubic,
        child: Material(
          color: scheme.surface,
          elevation: isDark ? 0 : 3,
          shadowColor: Colors.black.withValues(alpha: .18),
          borderRadius: BorderRadius.circular(22.r),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              HapticFeedback.lightImpact();
              widget.onTap(mark);
            },
            onHighlightChanged: (value) {
              if (_isPressed == value) return;
              setState(() => _isPressed = value);
            },
            child: Ink(
              padding: EdgeInsets.all(18.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.r),
                border: Border.all(
                  color: isDark
                      ? scheme.primary.withValues(alpha: 0.18)
                      : scheme.outline.withValues(alpha: 0.34),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Header(mark: mark, progress: progress),
                  SizedBox(height: 16.h),
                  if (mark != null) ...[
                    _Progress(progress: progress),
                    SizedBox(height: 13.h),
                    _ReadingDetails(mark: mark),
                    SizedBox(height: 14.h),
                  ] else ...[
                    Text(
                      l10n.home_reading_empty_body,
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 12.sp,
                        height: 1.65,
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(height: 14.h),
                  ],
                  _ContinueAction(hasReading: mark != null),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.mark, required this.progress});

  final Mark? mark;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final surahNumber = mark?.surahNumber ?? 1;

    return Row(
      children: [
        Container(
          width: 48.r,
          height: 48.r,
          decoration: BoxDecoration(
            color: scheme.primaryContainer,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Icon(
            Icons.menu_book_rounded,
            size: 25.sp,
            color: scheme.onPrimaryContainer,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mark == null
                    ? l10n.home_reading_start_title
                    : l10n.home_reading_continue_title,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w800,
                  color: scheme.onSurface,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                mark == null
                    ? l10n.home_reading_start_subtitle
                    : _readingPositionSubtitle(l10n, surahNumber, mark!),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: scheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        if (mark != null)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: scheme.primaryContainer,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              '${(progress * 100).toStringAsFixed(1)}٪',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w800,
                color: scheme.onPrimaryContainer,
              ),
            ),
          ),
      ],
    );
  }
}

class _Progress extends StatelessWidget {
  const _Progress({required this.progress});
  final double progress;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    return Semantics(
      label: l10n.home_reading_progress_semantics((progress * 100).round()),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: LinearProgressIndicator(
          value: progress,
          minHeight: 9.h,
          backgroundColor: scheme.surfaceContainerHighest,
          color: scheme.primary,
        ),
      ),
    );
  }
}

class _ReadingDetails extends StatelessWidget {
  const _ReadingDetails({required this.mark});
  final Mark mark;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final remaining = ReadingProgressCard.totalPages - mark.pageNumber;

    return Wrap(
      spacing: 16.w,
      runSpacing: 6.h,
      children: [
        _Detail(
          icon: Icons.bookmark_rounded,
          text: mark.ayahNumber == null
              ? l10n.home_reading_position_page(mark.pageNumber)
              : l10n.home_reading_position_ayah_page(
                  mark.ayahNumber!,
                  mark.pageNumber,
                ),
          color: scheme.primary,
        ),
        _Detail(
          icon: Icons.flag_outlined,
          text: l10n.home_reading_remaining_pages(remaining),
          color: scheme.tertiary,
        ),
      ],
    );
  }
}

class _Detail extends StatelessWidget {
  const _Detail({required this.icon, required this.text, required this.color});
  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 17.sp, color: color),
        SizedBox(width: 5.w),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _ContinueAction extends StatelessWidget {
  const _ContinueAction({required this.hasReading});
  final bool hasReading;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Text(
          hasReading
              ? l10n.home_reading_continue_action
              : l10n.home_reading_start_action,
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 12.sp,
            fontWeight: FontWeight.w800,
            color: scheme.primary,
          ),
        ),
        SizedBox(width: 5.w),
        Icon(Icons.arrow_forward_rounded, size: 18.sp, color: scheme.primary),
      ],
    );
  }
}

String _readingPositionSubtitle(
  AppLocalizations l10n,
  int surahNumber,
  Mark mark,
) {
  final surahName = SurahNames.getFormattedName(surahNumber);
  if (mark.ayahNumber == null) {
    return l10n.home_reading_surah_page(surahName, mark.pageNumber);
  }

  return l10n.home_reading_surah_ayah_page(
    surahName,
    mark.ayahNumber!,
    mark.pageNumber,
  );
}
