import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shirahsoft_muslim/core/l10n/app_localizations.dart';
import 'package:shirahsoft_muslim/features/hadith/presentation/providers/hadith_provider.dart';
import 'package:shirahsoft_muslim/features/hadith/presentation/widgets/featured_hadith_tab.dart';
import 'package:shirahsoft_muslim/features/hadith/presentation/widgets/hadith_tab.dart';

class HadithPage extends ConsumerWidget {
  const HadithPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: scheme.surfaceContainerLowest,
        body: SafeArea(
          child: Column(
            children: [
              _HadithHeader(
                onBack: () {
                  ref.read(hadithProvider.notifier).clearFilters();
                  Navigator.pop(context);
                },
              ),
              Container(
                height: 48.h,
                margin: EdgeInsets.fromLTRB(14.w, 8.h, 14.w, 6.h),
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  color: scheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(18.r),
                  border: Border.all(color: scheme.outlineVariant),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  splashBorderRadius: BorderRadius.circular(14.r),
                  indicator: BoxDecoration(
                    color: scheme.surface,
                    borderRadius: BorderRadius.circular(14.r),
                    boxShadow: [
                      BoxShadow(
                        color: scheme.shadow.withValues(alpha: .07),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  labelColor: scheme.primary,
                  unselectedLabelColor: scheme.onSurfaceVariant,
                  labelStyle: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Cairo',
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Cairo',
                  ),
                  tabs: [
                    Tab(
                      child: _TabLabel(
                        icon: Icons.menu_book_rounded,
                        label: l10n.hadith_tab_all,
                      ),
                    ),
                    Tab(
                      child: _TabLabel(
                        icon: Icons.star_rounded,
                        label: l10n.hadith_tab_favorites,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [HadithTab(), FeaturedHadithsTab()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabLabel extends StatelessWidget {
  const _TabLabel({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [Icon(icon, size: 18), const SizedBox(width: 7), Text(label)],
  );
}

class _HadithHeader extends StatelessWidget {
  const _HadithHeader({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 8.h),
      child: Row(
        children: [
          IconButton.filledTonal(
            tooltip: l10n.go_back,
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back_ios_rounded),
          ),
          SizedBox(width: 10.w),
          Container(
            width: 46.r,
            height: 46.r,
            decoration: BoxDecoration(
              color: scheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Icon(
              Icons.auto_stories_rounded,
              color: scheme.onTertiaryContainer,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 11.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.hadith_header_title,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                    color: scheme.onSurface,
                  ),
                ),
                Text(
                  l10n.hadith_header_subtitle,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 10.5.sp,
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
