import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/models/user_object.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';

class DataSource extends DataTableSource {
  // final List<DocumentSnapshot<Object?>> data;
  final List<UserObject> data;

  DataSource({required this.data});

  get getContext => null;

  @override
  DataRow? getRow(int index) {
    final val = data[index];
    return DataRow(onSelectChanged: (value) => showDialog(), cells: [
      DataCell(
        Center(
          child: Row(
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)]),
                child: val.displayImage == null
                    ? Center(
                        child: Text(
                          val.firstName![0].toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      )
                    : ImageNetwork(
                        image: val.displayImage!,
                        height: 20,
                        width: 20,
                        onError: cell(val.firstName![0]),
                        borderRadius: BorderRadius.circular(70),
                      ),
              ),
              const SizedBox(
                width: 16,
              ),
              cell('${val.firstName.toString()} ${val.lastName.toString()}'),
            ],
          ),
        ),
      ),
      DataCell(
        cell(val.address.toString()),
      ),
      DataCell(
        cell(val.contacts.toString()),
      ),
      DataCell(
        cell(val.pets.toString().isEmpty ? '' : val.pets.toString()),
      ),
      DataCell(
        cell(val.createdAt.toString()),
      ),
    ]);
  }

  Widget cell(String text) {
    return Text(text,
    style: const TextStyle(
      fontSize: 12
    ),);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  // edit modal
  showDialog() {
    Get.dialog(const AlertDialog(
      title: ImageNetwork(
          image:
              'https://124135-361502-raikfcquaxqncofqfm.stackpathdns.com/asset/img/cartoon/authorized_personnel_only-1.png',
          height: 400,
          width: 400),
    ));
  }
}
