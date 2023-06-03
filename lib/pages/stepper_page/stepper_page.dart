import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:how_cagri_work_on_flutter/models/kipss_user.dart';
import 'package:how_cagri_work_on_flutter/theming/m_contants.dart';
import 'package:how_cagri_work_on_flutter/theming/m_gap.dart';
import 'package:how_cagri_work_on_flutter/theming/m_size.dart';
import 'package:how_cagri_work_on_flutter/theming/material_colors.dart';

class StepperPage extends HookConsumerWidget {
  const StepperPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mSize = MSize();
    final mGap = MGap();
    final mConstants = MConstants();
    final colorScheme = KipssColors().color!;
    final textTheme = KipssColors().textTheme!;
    final nameTextController = useTextEditingController();
    final surnameTextController = useTextEditingController();
    final birthdayTextController = useTextEditingController();

    final selectedTargetIndexes = useState<List<int>>([]);

    Future<void> onBirthDayTap(BuildContext context) async {
      final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      if (selectedDate != null) {
        birthdayTextController.text =
            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
      } else {}

      return;
    }

    void onChipSelected(
      TargetedDomain selectedTargetIndex, {
      required bool isSelected,
    }) {
      debugPrint(
          'Selected Index: ${TargetedDomain.values.indexOf(selectedTargetIndex)}');
      if (isSelected) {
        selectedTargetIndexes.value
            .add(TargetedDomain.values.indexOf(selectedTargetIndex));
      } else {
        selectedTargetIndexes.value
            .remove(TargetedDomain.values.indexOf(selectedTargetIndex));
      }
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      selectedTargetIndexes.notifyListeners();
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        child: Icon(
          Icons.forward,
          color: colorScheme.onSecondaryContainer,
        ),
      ),
      body: Container(
        height: mSize.height,
        width: mSize.width,
        color: colorScheme.surface,
        child: SafeArea(
          child: Padding(
            padding: mGap.horizontalPadding.padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seni Biraz Tanıyalım...',
                  style: textTheme.headlineMedium,
                ),
                mGap.xLargeGap,
                TextField(
                  controller: nameTextController,
                  decoration: InputDecoration(
                    label: const Text('Adınız'),
                    border: OutlineInputBorder(
                      borderRadius: mConstants.borderMediumRadius,
                    ),
                  ),
                ),
                mGap.largeGap,
                TextField(
                  controller: surnameTextController,
                  decoration: InputDecoration(
                    label: const Text('Soyadınız'),
                    border: OutlineInputBorder(
                      borderRadius: mConstants.borderMediumRadius,
                    ),
                  ),
                ),
                mGap.largeGap,
                SizedBox(
                  width: mSize.width! / 2,
                  child: TextField(
                    controller: birthdayTextController,
                    onTap: () => onBirthDayTap(context),
                    readOnly: true,
                    decoration: InputDecoration(
                      label: const Text('Doğum Tarihiniz'),
                      border: OutlineInputBorder(
                        borderRadius: mConstants.borderMediumRadius,
                      ),
                    ),
                  ),
                ),
                mGap.largeGap,
                Text(
                  'KPSS Alanınız',
                  style: textTheme.titleMedium?.copyWith(),
                ),
                mGap.mediumGap,
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: TargetedDomain.values
                      .map(
                        (d) => FilterChip(
                          label: Text(d.name),
                          selected: selectedTargetIndexes.value
                              .contains(TargetedDomain.values.indexOf(d)),
                          onSelected: (bool value) =>
                              onChipSelected(d, isSelected: value),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
