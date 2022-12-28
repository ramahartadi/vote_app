import 'package:cloud_firestore/cloud_firestore.dart';

class Vote {
  final String? id;
  final String? email;
  final String? value;
  Vote({this.id, this.email, this.value});
}
