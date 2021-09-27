import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/stream/stream_controller.dart';
import '../../../core/enums/language.dart';
import '../../../core/enums/quality.dart';
import '../../../core/helpers/language_helper.dart';
import '../../../core/helpers/quality_helper.dart';
import '../../../l10n/translation_keys.dart';
import '../values/colors.dart';

const double _headerSpacing = 8;
const double _spacing = 36;

class StreamSettingsDialog extends StatelessWidget {
  const StreamSettingsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = context.mediaQuery;

    final BorderRadius borderRadius = mediaQueryData.orientation == Orientation.portrait
        ? const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          );

    const TextStyle headerTextStyle = TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: colorTextSecondary);

    return Dialog(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      insetPadding: mediaQueryData.orientation == Orientation.portrait
          ? EdgeInsets.only(top: mediaQueryData.size.height * .5)
          : EdgeInsets.only(left: mediaQueryData.size.width * .5),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          children: <Widget>[
            Text(
              trStreamSettingsHeaderQuality.tr,
              style: headerTextStyle,
            ),
            const SizedBox(height: _headerSpacing),
            const Align(
              alignment: Alignment.centerLeft,
              child: _QualityTabs(),
            ),
            const SizedBox(height: _spacing),
            Text(
              trStreamSettingsHeaderLanguage.tr,
              style: headerTextStyle,
            ),
            const SizedBox(height: _headerSpacing),
            const Align(
              alignment: Alignment.centerLeft,
              child: _LanguageTabs(),
            ),
            const SizedBox(height: _spacing),
            Text(
              trStreamSettingsHeaderPlaybackSpeed.tr,
              style: headerTextStyle,
            ),
            const SizedBox(height: _headerSpacing),
            const Align(
              alignment: Alignment.centerLeft,
              child: _PlaybackSpeedTabs(),
            ),
            // const SizedBox(height: _spacing),
            // Text(
            //   trStreamSettingsHeaderZoom.tr,
            //   style: headerTextStyle,
            // ),
            // const SizedBox(height: _headerSpacing),
            // const SizedBox(height: _spacing),
            // Text(
            //   trStreamSettingsHeaderSubtitles.tr,
            //   style: headerTextStyle,
            // ),
          ],
        ),
      ),
    );
  }
}

class _QualityTabs extends GetView<StreamController> {
  const _QualityTabs({Key? key}) : super(key: key);

  static const List<Quality> qualities = Quality.values;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      color: colorPrimary,
      child: Container(
        decoration: BoxDecoration(color: colorPrimaryLight, borderRadius: BorderRadius.circular(21)),
        child: Obx(
            () => DefaultTabController(
            initialIndex: qualities.indexOf(controller.quality.value),
            length: qualities.length,
            child: TabBar(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(borderRadius: BorderRadius.circular(21), color: colorAccent),
              isScrollable: true,
              onTap: (int index) => controller.onQualityChanged(qualities[index]),
              tabs: qualities.map((Quality e) => Tab(text: QualityHelper.convertToString(e))).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageTabs extends GetView<StreamController> {
  const _LanguageTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      color: colorPrimary,
      child: Container(
        decoration: BoxDecoration(color: colorPrimaryLight, borderRadius: BorderRadius.circular(21)),
        child: Obx(
          () {
            final List<Language> languages = controller.availableLanguages;

            return DefaultTabController(
              initialIndex: languages.indexOf(controller.language.value),
              length: languages.length,
              child: TabBar(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(borderRadius: BorderRadius.circular(21), color: colorAccent),
                isScrollable: true,
                onTap: (int index) => controller.onLanguageChanged(languages[index]),
                tabs: languages.map((Language e) => Tab(text: LanguageHelper.convertToString(e))).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PlaybackSpeedTabs extends GetView<StreamController> {
  const _PlaybackSpeedTabs({Key? key}) : super(key: key);

  static const List<double> playbackSpeeds = <double>[.25, .5, 1, 1.25, 1.5, 1.75, 2];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      color: colorPrimary,
      child: Container(
        decoration: BoxDecoration(color: colorPrimaryLight, borderRadius: BorderRadius.circular(21)),
        child: DefaultTabController(
          length: playbackSpeeds.length,
          child: TabBar(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(borderRadius: BorderRadius.circular(21), color: colorAccent),
            isScrollable: true,
            onTap: (int index) {},
            tabs: playbackSpeeds.map((double e) => Tab(text: e.toStringAsFixed(2))).toList(),
          ),
        ),
      ),
    );
  }
}
