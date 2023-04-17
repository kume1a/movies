import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controllers/stream/player_controls_controller.dart';
import '../../../controllers/stream/stream_controller.dart';
import '../../../controllers/stream/subtitle_controller.dart';
import '../../../core/enums/language.dart';
import '../../../core/enums/quality.dart';
import '../../../core/helpers/enum_helpers/language_helper.dart';
import '../../../core/helpers/enum_helpers/quality_helper.dart';
import '../../../l10n/translation_keys.dart';
import '../values/colors.dart';

const double _headerSpacing = 8;
const double _spacing = 36;

class StreamSettingsDialog extends StatelessWidget {
  const StreamSettingsDialog({super.key});

  SubtitlesController get subtitlesController => Get.find();

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

    const TextStyle headerTextStyle =
        TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: colorTextSecondary);

    return Dialog(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      insetPadding: mediaQueryData.orientation == Orientation.portrait
          ? EdgeInsets.only(top: mediaQueryData.size.height * .5)
          : EdgeInsets.only(left: mediaQueryData.size.width * .5),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          children: <Widget>[
            Text(
              trStreamSettingsHeaderQuality.tr,
              style: headerTextStyle,
            ).paddingSymmetric(horizontal: 16),
            const SizedBox(height: _headerSpacing),
            const Align(
              alignment: Alignment.centerLeft,
              child: _QualityTabs(),
            ).paddingSymmetric(horizontal: 16),
            const SizedBox(height: _spacing),
            Text(
              trStreamSettingsHeaderLanguage.tr,
              style: headerTextStyle,
            ).paddingSymmetric(horizontal: 16),
            const SizedBox(height: _headerSpacing),
            const Align(
              alignment: Alignment.centerLeft,
              child: _LanguageTabs(),
            ).paddingSymmetric(horizontal: 16),
            const SizedBox(height: _spacing),
            Text(
              trStreamSettingsHeaderPlaybackSpeed.tr,
              style: headerTextStyle,
            ).paddingSymmetric(horizontal: 16),
            const SizedBox(height: _headerSpacing),
            const Align(
              alignment: Alignment.centerLeft,
              child: _PlaybackSpeedTabs(),
            ).paddingSymmetric(horizontal: 16),

            // const SizedBox(height: _spacing),
            // Text(
            //   trStreamSettingsHeaderZoom.tr,
            //   style: headerTextStyle,
            // ),
            // const SizedBox(height: _headerSpacing),
            // const ZoomTypeSelector(),

            const SizedBox(height: _spacing),
            Text(
              trStreamSettingsHeaderSubtitles.tr,
              style: headerTextStyle,
            ).paddingSymmetric(horizontal: 16),
            const SizedBox(height: _headerSpacing),
            const Align(
              alignment: Alignment.centerLeft,
              child: ButtonImportSubtitles(),
            ).paddingSymmetric(horizontal: 16),
            _showIfSubtitlesShowing(const SizedBox(height: _spacing)),
            _showIfSubtitlesShowing(
              Text(
                trStreamSettingsHeaderSubtitlesOffset.tr,
                style: headerTextStyle,
              ).paddingSymmetric(horizontal: 16),
            ),
            _showIfSubtitlesShowing(const SizedBox(height: _headerSpacing)),
            _showIfSubtitlesShowing(
              const Align(
                alignment: Alignment.centerLeft,
                child: SubtitleOffsetSelector(),
              ).paddingSymmetric(horizontal: 16),
            ),

            _showIfSubtitlesShowing(const SizedBox(height: _spacing)),
            _showIfSubtitlesShowing(
              Text(
                trStreamSettingsHeaderSubtitleTextSize.tr,
                style: headerTextStyle,
              ).paddingSymmetric(horizontal: 16),
            ),
            _showIfSubtitlesShowing(const SizedBox(height: _headerSpacing)),
            _showIfSubtitlesShowing(const SubtitleTextSizeSelector().paddingSymmetric(horizontal: 16)),

            _showIfSubtitlesShowing(const SizedBox(height: _spacing)),
            _showIfSubtitlesShowing(
              Text(
                trStreamSettingsHeaderSubtitleSpacingFromBottom.tr,
                style: headerTextStyle,
              ).paddingSymmetric(horizontal: 16),
            ),
            _showIfSubtitlesShowing(const SizedBox(height: _headerSpacing)),
            _showIfSubtitlesShowing(
                const SubtitleSpacingFromBottomSelector().paddingSymmetric(horizontal: 16)),

            _showIfSubtitlesShowing(const SizedBox(height: _spacing)),
            _showIfSubtitlesShowing(
              Text(
                trStreamSettingsHeaderSubtitleTextColor.tr,
                style: headerTextStyle,
              ).paddingSymmetric(horizontal: 16),
            ),
            _showIfSubtitlesShowing(const SizedBox(height: _headerSpacing)),
            _showIfSubtitlesShowing(const SubtitleTextColorSelector()),

            _showIfSubtitlesShowing(const SizedBox(height: _spacing)),
            _showIfSubtitlesShowing(
              Text(
                trStreamSettingsHeaderSubtitleBorderThickness.tr,
                style: headerTextStyle,
              ).paddingSymmetric(horizontal: 16),
            ),
            _showIfSubtitlesShowing(const SizedBox(height: _headerSpacing)),
            _showIfSubtitlesShowing(const SubtitleBorderThicknessSelector().paddingSymmetric(horizontal: 16)),

            _showIfSubtitlesShowing(const SizedBox(height: _spacing)),
            _showIfSubtitlesShowing(
              Text(
                trStreamSettingsHeaderSubtitleBorderColor.tr,
                style: headerTextStyle,
              ).paddingSymmetric(horizontal: 16),
            ),
            _showIfSubtitlesShowing(const SizedBox(height: _headerSpacing)),
            _showIfSubtitlesShowing(const SubtitleBorderColorSelector()),
          ],
        ),
      ),
    );
  }

  Widget _showIfSubtitlesShowing(Widget child) =>
      Obx(() => subtitlesController.showingSubtitles.value ? child : const SizedBox.shrink());
}

class _QualityTabs extends GetView<StreamController> {
  const _QualityTabs();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      color: colorPrimary,
      child: DecoratedBox(
        decoration: BoxDecoration(color: colorPrimaryLight, borderRadius: BorderRadius.circular(21)),
        child: Obx(
          () {
            final RxList<Quality> qualities = controller.availableQualities;

            return DefaultTabController(
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
            );
          },
        ),
      ),
    );
  }
}

class _LanguageTabs extends GetView<StreamController> {
  const _LanguageTabs();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      color: colorPrimary,
      child: DecoratedBox(
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

class _PlaybackSpeedTabs extends GetView<PlayerControlsController> {
  const _PlaybackSpeedTabs();

  static const List<double> playbackSpeeds = <double>[.25, .5, 1, 1.25, 1.5, 1.75, 2];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      color: colorPrimary,
      child: DecoratedBox(
        decoration: BoxDecoration(color: colorPrimaryLight, borderRadius: BorderRadius.circular(21)),
        child: Obx(
          () {
            return DefaultTabController(
              length: playbackSpeeds.length,
              initialIndex: playbackSpeeds.indexOf(controller.playbackSpeed.value),
              child: TabBar(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(borderRadius: BorderRadius.circular(21), color: colorAccent),
                isScrollable: true,
                onTap: (int index) {
                  final double playbackSpeed = playbackSpeeds[index];
                  controller.onPlaybackSpeedChanged(playbackSpeed);
                },
                tabs: playbackSpeeds.map((double e) => Tab(text: e.toStringAsFixed(2))).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ButtonImportSubtitles extends GetView<SubtitlesController> {
  const ButtonImportSubtitles({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: controller.onImportSubtitlesPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorAccent),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10, horizontal: 12)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      label: Text(trStreamSettingsButtonImportSubtitles.tr),
      icon: SvgPicture.asset('assets/subtitles.svg'),
    );
  }
}

class SubtitleOffsetSelector extends GetView<SubtitlesController> {
  const SubtitleOffsetSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: controller.onSubtitleOffsetMinusPressed,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              border: Border.all(
                color: colorAccent,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: const Icon(
              Icons.remove,
              size: 20,
              color: colorAccent,
            ),
          ),
        ),
        const SizedBox(width: 18),
        Obx(
          () => Text(
            controller.subtitleOffset.value.toString(),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(width: 18),
        GestureDetector(
          onTap: controller.onSubtitleOffsetPlusPressed,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              border: Border.all(
                color: colorAccent,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: const Icon(
              Icons.add,
              size: 20,
              color: colorAccent,
            ),
          ),
        ),
      ],
    );
  }
}

class SubtitleTextSizeSelector extends GetView<SubtitlesController> {
  const SubtitleTextSizeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Slider(
        value: controller.subtitleTextSize.value,
        onChanged: controller.onSubtitleTextSizeChanged,
        min: 12,
        max: 28,
        divisions: 28,
      ),
    );
  }
}

class SubtitleSpacingFromBottomSelector extends GetView<SubtitlesController> {
  const SubtitleSpacingFromBottomSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Slider(
        value: controller.subtitleSpacingFromBottom.value,
        onChanged: controller.onSubtitleSpacingFromBottomChanged,
        max: 52,
        divisions: 52,
      ),
    );
  }
}

class SubtitleTextColorSelector extends GetView<SubtitlesController> {
  const SubtitleTextColorSelector({super.key});

  static final List<Color> colors = <Color>[
    Colors.black,
    Colors.white,
    Colors.red.shade500,
    Colors.pink.shade500,
    Colors.purple.shade500,
    Colors.deepPurple.shade500,
    Colors.indigo.shade500,
    Colors.blue.shade500,
    Colors.lightBlue.shade500,
    Colors.cyan.shade500,
    Colors.teal.shade500,
    Colors.green.shade500,
    Colors.lightGreen.shade500,
    Colors.lime.shade500,
    Colors.yellow.shade500,
    Colors.amber.shade500,
    Colors.orange.shade500,
    Colors.deepOrange.shade500,
    Colors.brown.shade500,
    Colors.grey.shade500,
    Colors.blueGrey.shade500,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 13),
        itemBuilder: (BuildContext context, int index) {
          final Color color = colors[index];

          return GestureDetector(
            onTap: () => controller.onSubtitleTextColorChanged(color),
            child: Obx(
              () => AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                duration: const Duration(milliseconds: 200),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                  border: controller.subtitleTextColor.value == color
                      ? Border.all(color: colorAccent, width: 2)
                      : null,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SubtitleBorderThicknessSelector extends GetView<SubtitlesController> {
  const SubtitleBorderThicknessSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Slider(
        value: controller.subtitleBorderThickness.value,
        onChanged: controller.onSubtitleBorderThicknessChanged,
        max: 4,
        divisions: 16,
      ),
    );
  }
}

class SubtitleBorderColorSelector extends GetView<SubtitlesController> {
  const SubtitleBorderColorSelector({super.key});

  static final List<Color> colors = <Color>[
    Colors.black,
    Colors.white,
    Colors.red.shade500,
    Colors.pink.shade500,
    Colors.purple.shade500,
    Colors.deepPurple.shade500,
    Colors.indigo.shade500,
    Colors.blue.shade500,
    Colors.lightBlue.shade500,
    Colors.cyan.shade500,
    Colors.teal.shade500,
    Colors.green.shade500,
    Colors.lightGreen.shade500,
    Colors.lime.shade500,
    Colors.yellow.shade500,
    Colors.amber.shade500,
    Colors.orange.shade500,
    Colors.deepOrange.shade500,
    Colors.brown.shade500,
    Colors.grey.shade500,
    Colors.blueGrey.shade500,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 13),
        itemBuilder: (BuildContext context, int index) {
          final Color color = colors[index];

          return GestureDetector(
            onTap: () => controller.onSubtitleBorderColorChanged(color),
            child: Obx(
              () => AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                duration: const Duration(milliseconds: 200),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                  border: controller.subtitleBorderColor.value == color
                      ? Border.all(color: colorAccent, width: 2)
                      : null,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
