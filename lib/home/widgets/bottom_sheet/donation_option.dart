import 'package:charity_app/core/extensions/context_extensions.dart';
import 'package:charity_app/home/cubits/donationCubit/modal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DonationOptions extends StatelessWidget {
  final List<int> donationOptions = [100, 200, 400, 500];

   DonationOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final donationCubit = context.read<ModalCubit>();
        final colorScheme = context.colorScheme;

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: donationOptions.map((amount) {
        return OutlinedButton(
          onPressed: () {
            donationCubit.selectAmount(amount.toString());
          },
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: colorScheme.primary),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            foregroundColor: colorScheme.primary,
          ),
          child: Text("\$$amount"),
        );
      }).toList(),
    );
  }
}