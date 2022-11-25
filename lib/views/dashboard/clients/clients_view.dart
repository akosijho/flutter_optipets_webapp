import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/views/dashboard/clients/clients_view_model.dart';
import 'package:flutter_optipets_webapp/views/dashboard/clients/data_source.dart';
import 'package:stacked/stacked.dart';

class ClientsView extends StatelessWidget {
  const ClientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClientsViewModel>.reactive(
      viewModelBuilder: () => ClientsViewModel(),
      onModelReady: (model) => model.getClients(),
      builder: (context, model, child) {
        final DataTableSource data = DataSource(data: model.clients);
        return model.isBusy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child:
                    // StreamBuilder<QuerySnapshot>(
                    //     stream: model.clientListStream(),
                    //     builder: (context, snapshot) {
                    //       if (snapshot.hasError) {
                    //         return const Center(child: Text('Something went wrong'));
                    //       }

                    //       if (snapshot.connectionState == ConnectionState.waiting) {
                    //         return const Align(
                    //           alignment: Alignment.center,
                    //           child: CircularProgressIndicator());
                    //       }

                    //       final DataTableSource data =
                    //           DataSource(data: snapshot.data!.docs);
                    //       return PaginatedDataTable(
                    //         columns: const [
                    //           DataColumn(label: Text('Name')),
                    //           DataColumn(label: Text('Adress')),
                    //           DataColumn(label: Text('Contacts')),
                    //           DataColumn(label: Text('Pets')),
                    //         ],
                    //         source: data,
                    //         rowsPerPage: 20,
                    //       );
                    //     }),
                    model.clients.isEmpty
                        ? const Center(child: Text('No data found'))
                        : PaginatedDataTable(
                          onPageChanged: (value) => model.getNextPage(),
                            columns: const [
                              DataColumn(label: Text('Name')),
                              DataColumn(label: Text('Adress')),
                              DataColumn(label: Text('Contacts')),
                              DataColumn(label: Text('Pets')),
                            ],
                            source: data,
                            rowsPerPage: 20,
                          ));
      },
    );
  }
}
