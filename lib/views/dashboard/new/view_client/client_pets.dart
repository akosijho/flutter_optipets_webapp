// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_optipets_webapp/models/pet_object.dart';
import 'package:flutter_optipets_webapp/views/dashboard/clients/data_source.dart';
import 'package:image_network/image_network.dart';

class ClientPets extends DataTableSource {
  ClientPets({
    required this.pets,
  });

  List<PetObject> pets;

  @override
  DataRow? getRow(int index) {
    final val = pets[index];
    return DataRow(cells: [
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
                          val.name![0].toUpperCase(),
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
                        onError: DataSource.cell(val.name![0]),
                        borderRadius: BorderRadius.circular(70),
                      ),
              ),
              const SizedBox(
                width: 16,
              ),
              DataSource.cell(val.name!),
            ],
          ),
        ),
      ),
      DataCell(
        DataSource.cell(val.breed!),
      ),
      DataCell(
        DataSource.cell(val.weight == null ? '' : '${val.weight} kg'),
      ),
      DataCell(
        DataSource.cell(val.sex!),
      ),
      DataCell(
        DataSource.cell(val.birthday!),
      ),
      DataCell(
        DataSource.cell(val.createdAt!),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => pets.length;

  @override
  int get selectedRowCount => 0;
}
