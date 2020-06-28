//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:rcs_mobile/model/recycled_item_model.dart';
//import 'package:rcs_mobile/model/recycle_center_model.dart';
//
//class DatabaseService {
//
//  final String uid;
//  DatabaseService({this.uid});
//
//  // collection reference
//  final CollectionReference recyclingQueriesCollection = Firestore.instance.collection('recycling_queries');
//  final CollectionReference userCollection = Firestore.instance.collection('users');
//  final CollectionReference itemsCollection = Firestore.instance.collection('recycledItems');
//
//  Future updateUserData(String name) async {
//    return await userCollection.document(uid).setData({
//      'name': name,
//    });
//  }
//
//  Future updateRecycledItem(RecycledItem item) async {
//    return await userCollection.document(uid).setData({
//      'description': item.description,
//
//    });
//  }
//
//  // brew list from snapshot
//  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
//    return snapshot.documents.map((doc){
//      return Brew(
//          name: doc.data['name'] ?? '',
//          strength: doc.data['strength'] ?? 0,
//          sugars: doc.data['sugars'] ?? '0'
//      );
//    }).toList();
//  }
//
//  //userData from snapshot
//
//  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
//    return UserData(
//        uid: uid,
//        name: snapshot.data['name'],
//        sugars: snapshot.data['sugars'],
//        strength: snapshot.data['strength']
//    );
//  }
//
//  Future<List<T>> getData({limit=25}) async {
//    print('db.getData $path');
//    var snapshots = await ref.limit(limit).getDocuments();
//    return snapshots.documents.map((doc) => Global.models[T](doc.data) as T ).toList();
//  }
//
//
//  // get brews stream
//  Stream<List<Brew>> get brews {
//    return brewCollection.snapshots()
//        .map(_brewListFromSnapshot);
//  }
//
//  Stream<UserData> get userData {
//    return brewCollection.document(uid).snapshots()
//        .map(_userDataFromSnapshot);
//  }
//
//}