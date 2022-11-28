import 'package:flutter/material.dart';
import 'package:flutter_optipets_webapp/views/dashboard/clients/clients_view_model.dart';
import 'package:flutter_optipets_webapp/views/dashboard/clients/data_source.dart';
import 'package:flutter_optipets_webapp/views/widgets/loader.dart';
import 'package:stacked/stacked.dart';

class ClientsView extends StatelessWidget {
  const ClientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClientsViewModel>.reactive(
      viewModelBuilder: () => ClientsViewModel(),
      onModelReady: (model) => model.getClients(),
      builder: (context, model, child) {
        final DataTableSource data = DataSource(data: model.names);
        return model.isBusy
            ? const Loader()
            : SingleChildScrollView(
                child: model.clients.isEmpty
                    ? const Center(child: Text('No data found'))
                    : Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.4), //color of shadow
                              blurRadius: 8, // blur radius
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: PaginatedDataTable(
                          sortColumnIndex: 0,
                          headingRowHeight: 32,
                          dataRowHeight: 24,
                          sortAscending: model.sort,
                          showCheckboxColumn: false,
                          showFirstLastButtons: true,
                          header: Container(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(4)),
                            child: TextField(
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(8),
                                  icon: Icon(
                                    textDirection: TextDirection.rtl,
                                    Icons.search,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                  isDense: true,
                                  hintText: "Search"),
                              onChanged: (value) {
                                model.filter(value);
                              },
                            ),
                          ),
                          onPageChanged: (value) => model.getNextPage(),
                          columns: [
                            DataColumn(
                              label: header('Name'),
                            ),
                            DataColumn(label: header('Adress')),
                            DataColumn(label: header('Contacts')),
                            DataColumn(label: header('Pets')),
                            DataColumn(
                                label: header(
                                  'Added On',
                                ),
                                onSort: (columnIndex, ascending) {
                                  model.onsortColum(columnIndex, ascending);
                                }),
                          ],
                          source: data,
                          rowsPerPage: model.names.length < model.rows &&
                                  model.names.isNotEmpty
                              ? model.names.length
                              : model.names.isEmpty
                                  ? 1
                                  : model.rows,
                          // columnSpacing: 8,
                        ),
                      ));
      },
    );
  }

  Widget header(String text) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
          child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      )),
    );
  }
}
