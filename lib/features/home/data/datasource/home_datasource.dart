import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:localfix/features/home/data/model/search_result_model.dart';
import 'package:localfix/features/home/data/model/service_category_model.dart';

class HomeDatasource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  HomeDatasource(this.firestore, this.firebaseAuth);

  String? get currentUser => firebaseAuth.currentUser?.uid;

  CollectionReference<Map<String, dynamic>> get user =>
      firestore.collection('user');

  DocumentReference<Map<String, dynamic>> userDoc(String uid) {
    return user.doc(uid);
  }

  CollectionReference<Map<String, dynamic>> serviceCategoryDoc() {
    return firestore.collection('service_categories');
  }

  CollectionReference<Map<String,dynamic>> servviceDoc(){
    return firestore.collection('services');
  }

  Future<List<SearchResultModel>> searchService(String query) async {
    final result = await servviceDoc()
        .where('isActive', isEqualTo: true)
        .orderBy('name')
        .startAt([query])
        .endAt(['$query\uf8ff'])
        .get();

    return result.docs.map((result) {
      final service = ServiceCategoryModel.fromMap(result.data());
      return SearchResultModel.fromCategory(service);
    },).toList();
  }

    Future<List<SearchResultModel>> searchCategory(String query) async {
    final result = await serviceCategoryDoc()
        .where('isActive', isEqualTo: true)
        .orderBy('name')
        .startAt([query])
        .endAt(['$query\uf8ff'])
        .get();

    return result.docs.map((result) {
      final category = ServiceCategoryModel.fromMap(result.data());

      return SearchResultModel.fromCategory(category);
    },).toList();
  }

  Future<List<SearchResultModel>> allSearch(String query) async{
    final searchResult = query.trim().toLowerCase();

    if(searchResult.isEmpty){
      return [];
    }

    final result = await Future.wait([
      searchCategory(query),
      searchService(query),
    ]);
    return result.expand((items) => items).toList();
  }

  Future<void> setDefaultServiceCategories() async {
    final categories = [
      ServiceCategoryModel(
        categoryId: 'plumbing',
        name: 'Plumbing',
        icon: 'plumbing',
        description: 'Pipe and water system repairs',
        isActive: true,
        sortOrder: 1,
      ),
      ServiceCategoryModel(
        categoryId: 'electrical',
        name: 'Electrical',
        icon: 'electrical',
        description: 'Electrical installation and repairs',
        isActive: true,
        sortOrder: 2,
      ),
      ServiceCategoryModel(
        categoryId: 'carpentry',
        name: 'Carpentry',
        icon: 'carpentry',
        description: 'Furniture and woodwork repairs',
        isActive: true,
        sortOrder: 3,
      ),
      ServiceCategoryModel(
        categoryId: 'painting',
        name: 'Painting',
        icon: 'painting',
        description: 'Interior and exterior painting',
        isActive: true,
        sortOrder: 4,
      ),
      ServiceCategoryModel(
        categoryId: 'appliance_repair',
        name: 'Appliance Repair',
        icon: 'appliance_repair',
        description: 'Household appliance repairs',
        isActive: true,
        sortOrder: 5,
      ),
    ];

    for (var category in categories) {
      await serviceCategoryDoc().doc(category.categoryId).set(category.toMap());
    }
  }

  Future<List<ServiceCategoryModel>> getActiveServiceCategories() async {
    final snapshot = await serviceCategoryDoc()
        .where('isActive', isEqualTo: true)
        .orderBy('sortOrder')
        .get();

    return snapshot.docs.map((category) {
      return ServiceCategoryModel.fromMap(category.data());
    }).toList();
  }
}
