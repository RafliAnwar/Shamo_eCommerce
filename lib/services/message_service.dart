import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo_ecommerce/model/product_model.dart';
import 'package:shamo_ecommerce/model/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addMessage(
      {UserModel user,
      bool isFromUser,
      String message,
      ProductModel product}) async {
    try {
      firestore.collection('meesages').add({
        'userId': user.id,
        'userName': user.name,
        'userImage': user.profilePhotoUrl,
        'isFromUser': true,
        'message': message,
        'product': product is UninitializedProductModel ? {} : product.toJson(),
        'createdAt': DateTime.now().toString(),
        'updateAt': DateTime.now().toString(),
      }).then(
        (value) => print('Pesan berhasil dikirim !'),
      );
    } catch (e) {
      throw Exception('Pesan gagal dikirim !');
    }
  }
}
