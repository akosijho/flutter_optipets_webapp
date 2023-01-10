import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';

class AppointmentList extends StatelessWidget {
  AppointmentList({Key? key}) : super(key: key);

  final TextStyle? _defTextStyle =
      Theme.of(getContext).textTheme.subtitle1?.copyWith(
            color: Colors.white,
          );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 840,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF2A2D3E),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Appointments", style: _defTextStyle),
          Flexible(
            child: DataTable2(
              columnSpacing: 16,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: label("Owner"),
                ),
                DataColumn(
                  label: label("Pet"),
                ),
                DataColumn(
                  label: label("Appointment"),
                ),
                DataColumn(
                  label: label("Date"),
                ),
              ],
              rows: List.generate(
                2,
                (index) => recentFileDataRow(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Creates rows in table
  DataRow recentFileDataRow() {
    return DataRow(
      cells: [
        DataCell(
          label("Jhobert Panerio"),
        ),
        DataCell(label("Zz")),
        DataCell(label("Vaccination")),
        DataCell(label("01/01/2023")),
      ],
    );
  }

  Text label(String text) {
    return Text(
      text,
      style: _defTextStyle,
    );
  }
}
