// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';

import 'package:flutter_optipets_webapp/core/models/pet_object.dart';
import 'package:flutter_optipets_webapp/views/dashboard/clients/data_source.dart';
import 'package:flutter_optipets_webapp/views/dashboard/home_view_mode..dart';
import 'package:image_network/image_network.dart';

class ClientPets extends DataTableSource {
  ClientPets({
    required this.pets,
  });

  List<PetObject> pets;

  final HomeViewModel homeViewModel = locator<HomeViewModel>();

  @override
  DataRow? getRow(int index) {
    final pet = pets[index];
    return DataRow(
      onSelectChanged: (value) {
        homeViewModel.viewPet(pet);
      },
      cells: [
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
                child: pet.displayImage == null
                    ? Center(
                        child: Text(
                          pet.name![0].toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      )
                    : ImageNetwork(
                        image: pet.displayImage!,
                        height: 20,
                        width: 20,
                        onError: DataSource.cell(pet.name![0]),
                        borderRadius: BorderRadius.circular(70),
                      ),
              ),
              const SizedBox(
                width: 16,
              ),
              DataSource.cell(pet.name!),
            ],
          ),
        ),
      ),
      DataCell(
        DataSource.cell(pet.breed!),
      ),
      DataCell(
        DataSource.cell(pet.weight == null ? '' : '${pet.weight} kg'),
      ),
      DataCell(
        DataSource.cell(pet.sex!),
      ),
      DataCell(
        DataSource.cell(pet.birthday!),
      ),
      DataCell(
        DataSource.cell(pet.createdAt!),
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
