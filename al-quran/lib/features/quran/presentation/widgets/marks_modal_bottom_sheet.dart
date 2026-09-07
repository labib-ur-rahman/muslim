import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shirahsoft_muslim/core/extensions/color_ext.dart';
import 'package:shirahsoft_muslim/core/l10n/app_localizations.dart';
import 'package:shirahsoft_muslim/features/quran/data/models/mark.dart';
import 'package:shirahsoft_muslim/features/quran/presentation/pages/quran_pages.dart';
import 'package:shirahsoft_muslim/features/quran/presentation/providers/mark.dart';

class MarksModalBottomSheet extends ConsumerWidget {
  const MarksModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marks = ref.watch(marksProvder);
    final primaryColor = context.color.primary;
    final l10n = AppLocalizations.of(context)!;

    final pageMarks = marks.where((m) => m.ayahNumber == null).toList();
    final ayahMarks = marks.where((m) => m.ayahNumber != null).toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: context.color.surfaceContainerLowest,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            // Handle
            Container(
              margin: EdgeInsets.symmetric(vertical: 12.h),
              height: 4.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: context.color.outlineVariant,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),

            Text(
              l10n.quran_saved_bookmarks,
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold,
                color: context.color.onSurface,
              ),
            ),
            SizedBox(height: 10.h),

            // TabBar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  color: context.color.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: context.color.outlineVariant),
                ),
                child: TabBar(
                  splashBorderRadius: BorderRadius.circular(12.r),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.r),
                    color: context.color.surface,
                  ),
                  labelColor: primaryColor,
                  unselectedLabelColor: context.color.onSurfaceVariant,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.bold,
                  ),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cairo",
                    fontSize: 15.sp,
                  ),
                  tabs: [
                    Tab(text: l10n.quran_pages_tab),
                    Tab(text: l10n.quran_ayahs_tab),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10.h),

            Expanded(
              child: TabBarView(
                children: [
                  _MarkListView(
                    marks: pageMarks,
                    primaryColor: primaryColor,
                    isAyahList: false,
                  ),
                  _MarkListView(
                    marks: ayahMarks,
                    primaryColor: primaryColor,
                    isAyahList: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MarkListView extends ConsumerWidget {
  final List<Mark> marks;
  final Color primaryColor;
  final bool isAyahList;

  const _MarkListView({
    required this.marks,
    required this.primaryColor,
    required this.isAyahList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (marks.isEmpty) {
      final l10n = AppLocalizations.of(context)!;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark_outline_rounded,
              size: 60.sp,
              color: context.color.onTertiaryContainer,
            ),
            SizedBox(height: 10.h),
            Text(
              l10n.quran_no_saved_bookmarks,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: "Cairo",
                color: context.color.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      itemCount: marks.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final mark = marks[index];
        final l10n = AppLocalizations.of(context)!;
        final formattedDate =
            "${mark.date.year}/${mark.date.month}/${mark.date.day}";

        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          decoration: BoxDecoration(
            color: context.color.surface,
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: context.color.outlineVariant),
            boxShadow: [
              BoxShadow(
                color: context.color.shadow.withValues(alpha: .04),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            leading: CircleAvatar(
              backgroundColor: context.color.tertiaryContainer,
              radius: 22.r,
              child: Icon(
                isAyahList
                    ? Icons.menu_book_rounded
                    : Icons.my_library_books_rounded,
                color: context.color.onTertiaryContainer,
                size: 20.sp,
              ),
            ),
            title: Text(
              l10n.quran_surah_label(mark.surahName),
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: context.color.onSurface,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4.h),
                Text(
                  isAyahList
                      ? l10n.quran_ayah_page_label(
                          mark.ayahNumber ?? 0,
                          mark.pageNumber,
                        )
                      : l10n.quran_page_number(mark.pageNumber),
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: "Cairo",
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  l10n.quran_saved_date(formattedDate),
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: "Cairo",
                    color: context.color.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              tooltip: l10n.quran_delete_bookmark,
              icon: Icon(
                Icons.delete_outline_rounded,
                color: context.color.error,
              ),
              onPressed: () async {
                final notifier = ref.read(marksProvder.notifier);
                if (isAyahList) {
                  await notifier.removeAyahMark(
                    mark.surahNumber!,
                    mark.ayahNumber!,
                  );
                } else {
                  await notifier.removeMark(mark.pageNumber);
                }
              },
            ),
            onTap: () async {
              final navigator = Navigator.of(context);
              await navigator.maybePop();
              if (!navigator.mounted) return;
              await navigator.pushReplacement(
                MaterialPageRoute(
                  builder: (_) => QuranPages(
                    pageNumber: mark.pageNumber,
                    highlightSurah: mark.surahNumber,
                    highlightVerse: mark.ayahNumber,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
