import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';

class DataSource extends DataTableSource {

  // final List<QueryDocumentSnapshot<Object?>> data;
  final List<DocumentSnapshot<Object?>> data;
  int pets = 0;

  DataSource({required this.data});

  Future<AggregateQuery Function()> petCount(int index) async {
    
    final val = data[index].data() as Map<String, dynamic> ;
    return petRef.where('owner', isEqualTo: val['uid']).count;
  }

  void countPets(int index) async {
      pets = (await petCount(index)) as int;
  }

 @override
  DataRow? getRow(int index)  {
    final val = data[index].data() as Map<String, dynamic> ;
    // countPets(index);
    return DataRow(cells: [
      DataCell(Text('${val['firstName'].toString()} ${val['lastName'].toString()}')),
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
