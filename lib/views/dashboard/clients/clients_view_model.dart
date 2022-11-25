import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_optipets_webapp/app/app.locator.dart';
import 'package:flutter_optipets_webapp/utils/constants.dart';
import 'package:flutter_optipets_webapp/views/application/application_view_model.dart';
import 'package:stacked/stacked.dart';

class ClientsViewModel extends BaseViewModel {
  final ApplicationViewModel applicationViewModel =
      locator<ApplicationViewModel>();

  List<Map<String, dynamic>> clientList = [];

  // get list of users
  Stream<QuerySnapshot> clientListStream() => userRef.snapshots();

  bool load = true;
  List<DocumentSnapshot> clients = [];
  bool moreClients = true;
  bool gettingMoreClients = false;
  DocumentSnapshot? lastDocument;
  getClients() async {
    Query q = userRef.limit(20);
    setBusy(true);
    QuerySnapshot querySnapshot = await q.get();
    clients = querySnapshot.docs;
    lastDocument = querySnapshot.docs[querySnapshot.docs.length -1];
    setBusy(false);
  }

  getNextPage() async {
    if(moreClients == false){
      return;
    }
    if(gettingMoreClients == true){
      return;
    }
    gettingMoreClients = true;
    Query q = userRef.startAfter([lastDocument!.data()]).limit(20);
    QuerySnapshot querySnapshot = await q.get();
    if(querySnapshot.docs.length < 20){
      moreClients = false;
    }
    lastDocument = querySnapshot.docs[querySnapshot.docs.length -1];
    clients.addAll(querySnapshot.docs);
    gettingMoreClients = false;
    notifyListeners();
  }
}
