import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:image_network/image_network.dart';

class DataSource extends DataTableSource {
  // final List<QueryDocumentSnapshot<Object?>> data;
  final List<DocumentSnapshot<Object?>> data;
  int pets = 0;

  DataSource({required this.data});

  Future<AggregateQuery Function()> petCount(int index) async {
    final val = data[index].data() as Map<String, dynamic>;
    return petRef.where('owner', isEqualTo: val['uid']).count;
  }

  void countPets(int index) async {
    pets = (await petCount(index)) as int;
  }

  @override
  DataRow? getRow(int index) {
    final val = data[index].data() as Map<String, dynamic>;
    // countPets(index);
    return DataRow(cells: [
      DataCell(Row(
        children: [
          val['displayImage'] == null
              ? const Icon(
                  Icons.account_circle,
                  size: 32,
                )
              : Container(
                  height: 32,
                  width: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ImageNetwork(
                    image: val['displayImage'],
                    height: 32,
                    width: 32,
                    onError: const Icon(Icons.account_circle),
                    borderRadius: BorderRadius.circular(70),
                  ),
                ),
          const SizedBox(
            width: 16,
          ),
          Text('${val['firstName'].toString()} ${val['lastName'].toString()}'),
        ],
      )),
      DataCell(Text(val['address'].toString())),
      DataCell(Text(val['contacts'].toString())),
      DataCell(Text(pets.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
