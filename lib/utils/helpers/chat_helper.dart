
import 'package:flutter_api/utils/helpers/user_helper.dart';

class ChatRoomHelper {
  static String roomId(String uid, List<String> rooms) {
    final contributor = "$uid-WITH-${AuthHelper.uid}";
    final admin = "${AuthHelper.uid}-WITH-$uid";
    if (rooms.contains(contributor)) {
      return contributor;
    } else {
      return admin;
    }
  }

  static String roomingUid({
    required String owner,
    required String contributor,
  }) {
    if (owner == AuthHelper.uid) {
      return contributor;
    } else {
      return owner;
    }
  }

  static bool isRoomingUid(String roomId) => roomId.contains(AuthHelper.uid);

  static bool isRoomCreated(String roomId, List<String> rooms) {
    return rooms.contains(roomId);
  }

  static bool isSeen(
    String sender, {
    bool isSeen = false,
    List<String>? views,
  }) {
    final uid = AuthHelper.uid;
    final list = views ?? [];
    return uid == sender || isSeen || list.contains(uid);
  }

  static bool isSeenPermissioned(String sender, [List<String>? views]) {
    final uid = AuthHelper.uid;
    final list = views ?? [];
    return uid != sender && !list.contains(uid);
  }
}
