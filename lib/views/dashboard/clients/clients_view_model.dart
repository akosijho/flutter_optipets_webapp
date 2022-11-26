import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/models/user_object.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/views/application/application_view_model.dart';
import 'package:stacked/stacked.dart';

class ClientsViewModel extends BaseViewModel {
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();

  List<Map<String, dynamic>> clientList = [];
  // rows per page
  int rows = 20;
  // get list of users
  Stream<QuerySnapshot> clientListStream() => userRef.snapshots();

  // filter data on text change
  List<UserObject> filterData = [];

  bool load = true, sort = false;
  List<DocumentSnapshot> clients = [];

  List<UserObject> names = [];

  bool moreClients = true;
  bool gettingMoreClients = false;
  DocumentSnapshot? lastDocument;
  getClients() async {
    Query q = userRef.limit(rows);
    setBusy(true);
    QuerySnapshot querySnapshot = await q.get();

    names = querySnapshot.docs
        .map((e) => UserObject.fromJson(e.data() as Map<String, dynamic>))
        .toList()
        .cast();

    clients = querySnapshot.docs;
    lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
    filterData = names;
    setBusy(false);
  }

  getNextPage() async {
    if (moreClients == false) {
      return;
    }
    if (gettingMoreClients == true) {
      return;
    }
    gettingMoreClients = true;
    Query q = userRef.startAfter([lastDocument!.data()]).limit(rows);
    QuerySnapshot querySnapshot = await q.get();
    if (querySnapshot.docs.length < rows) {
      moreClients = false;
    }
    lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];

    names.addAll(querySnapshot.docs
        .map((e) => UserObject.fromJson(e.data() as Map<String, dynamic>))
        .toList()
        .cast());

    clients.addAll(querySnapshot.docs);

    gettingMoreClients = false;
    notifyListeners();
  }

  filter(String text) {
    names = filterData
        .where((element) => '${element.firstName!}${element.lastName!}'
            .toLowerCase()
            .contains(text))
        .toList();
    notifyListeners();
  }

  onsortColum(int columnIndex, bool ascending) {
    sort = false;
    if (columnIndex == 0) {
      if (ascending) {
        filterData.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
      } else {
        filterData.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      }
    }
    notifyListeners();
  }
}
