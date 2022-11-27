import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/add_new_view_model.dart';
import 'package:flutter_optipets_webapp/views/dashboard/new/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class PetSection extends ViewModelWidget<AddNewViewModel> {
  const PetSection({super.key});

  final thisLabelStyle = const TextStyle(fontSize: 12);

  @override
  Widget build(BuildContext context, AddNewViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fieldLabel(label: 'Pet\'s Name:', fieldWidth: 80),
                textField(
                    label: 'Pet\'s Name',
                    maxWidth: 160,
                    textEditingController: viewModel.petName),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fieldLabel(label: 'Specie:', fieldWidth: 48),
                textField(
                    label: 'Specie',
                    maxWidth: 184,
                    textEditingController: viewModel.specie),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fieldLabel(label: 'Breed:', fieldWidth: 80),
                textField(
                    label: 'Breed',
                    maxWidth: 160,
                    textEditingController: viewModel.breed),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fieldLabel(label: 'Color:', fieldWidth: 48),
                textField(
                    label: 'Color',
                    maxWidth: 184,
                    textEditingController: viewModel.color),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fieldLabel(label: 'Birthday:', fieldWidth: 80),
                textField(
                    label: DateFormat('MMM dd, yyyy').format(DateTime.now()),
                    textEditingController: viewModel.birthDay,
                    maxWidth: 160,
                    function: viewModel.pickDate),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fieldLabel(label: 'Sex:', fieldWidth: 48),
                Row(
                  children: [
                    Radio(
                        groupValue: viewModel.sex,
                        value: 'Male',
                        onChanged: viewModel.radioValueChanges),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      'Male',
                      style: thisLabelStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Row(
                  children: [
                    Radio(
                        groupValue: viewModel.sex,
                        value: 'Female',
                        onChanged: viewModel.radioValueChanges),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      'Female',
                      style: thisLabelStyle,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            fieldLabel(label: 'Weight:', fieldWidth: 80),
            textField(
                label: 'Weight in kg',
                maxWidth: 160,
                textEditingController: viewModel.weight),
          ],
        ),
      ],
    );
  }
}
