import 'package:aciste/converters/timestamp_converter.dart';
import 'package:aciste/custom_exception.dart';
import 'package:aciste/models/message.dart';
import 'package:aciste/models/user.dart';
import 'package:aciste/providers.dart';
import 'package:aciste/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aciste/extensions/firebase_firestore_extension.dart';

abstract class BaseMessageRepository {
  Future<Message> retrieveMessage({required String userId, required String messageId});
  Future<Message> createMessage({required String userId, required CreateMessageParams createMessageParams});
  Future<Message> updateMessage({required String userId, required Message message});
}

final messageRepositoryProvider = Provider<MessageRepository>((ref) => MessageRepository(ref.read));

class MessageRepository implements BaseMessageRepository {
  final Reader _read;

  const MessageRepository(this._read);

  Future<Message> _fillUser({required Message message, required String userId}) async {
    final user = await _read(userRepositoryProvider).getUser(userId: userId);
    return message.copyWith(createdBy: user);
  }

  @override
  Future<Message> retrieveMessage({required String userId, required String messageId}) async {
    try {
      final doc = await _read(firebaseFirestoreProvider)
        .messagesRef()
        .doc(messageId)
        .get();
      
      final message = Message.fromDocumentSnapshot(doc);
      return _fillUser(message: message, userId: userId);
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Message> createMessage({required String userId, required CreateMessageParams createMessageParams}) async {
    final text = createMessageParams.message;

    final message = Message.empty().copyWith(
      createdBy: User.empty().copyWith(id: userId),
      text: text
    );

    final docRef = await _read(firebaseFirestoreProvider)
      .messagesRef()
      .add(message.toDocument());
    
    return _fillUser(
      message: message.copyWith(id: docRef.id),
      userId: userId
    );
  }

  @override
  Future<Message> updateMessage({required userId, required message}) async {
    await _read(firebaseFirestoreProvider)
      .messagesRef()
      .doc(message.id!)
      .update(message.toDocument());
    
    return message;
  }
}