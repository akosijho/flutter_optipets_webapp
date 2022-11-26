import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';

class DataSource extends DataTableSource {
  // final List<QueryDocumentSnapshot<Object?>> data;
  final List<DocumentSnapshot<Object?>> data;

  DataSource({required this.data});

  get getContext => null;

  @override
  DataRow? getRow(int index) {
    final val = data[index].data() as Map<String, dynamic>;
    // countPets(index);
    return DataRow(
      onLongPress: () => showDialog(),
      cells: [
      DataCell(
          Row(
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
              Text(
                  '${val['firstName'].toString()} ${val['lastName'].toString()}'),
            ],
          ),
          onTap: () => showDialog()
                  ),
      DataCell(Text(val['address'].toString()),
          onTap: () => showDialog()),
      DataCell(Text(val['contacts'].toString()),
          onTap: () => showDialog()),
      DataCell(
          Text(val['pets'].toString().isEmpty ? '' : val['pets'].toString()),
          onTap: () => showDialog()),
      DataCell(Text(val['createdAt'].toString()),
          onTap: () => showDialog()),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  // edit modal
  showDialog(){
    Get.dialog(
             const AlertDialog(
                    title: ImageNetwork(
                        image:
                            'https://124135-361502-raikfcquaxqncofqfm.stackpathdns.com/asset/img/cartoon/authorized_personnel_only-1.png',
                        height: 400,
                        width: 400),
                  )
          );
  }
}
