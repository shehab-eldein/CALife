import '../Helper/Constants.dart';
import '../Managers/NetworkManager.dart';
import '../Models/User.dart';
import '../Models/Notification.dart';

class UserController {
  final _networkManager = NetworkManager();

  Future<String?> users() async {
    try {
      final res = await _networkManager.getRequest(
        endpoint: Constant.user,
        body: null,
        fromJson: (dynamic res) {
          return res;
        },
      );
      print(res);
      return res;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AppNotification>> getUserNotifications(int userId) async {
    try {
      final List<AppNotification> res = await _networkManager.getRequest(
        endpoint: '${Constant.user}GetNotificationsByUserID?userID=$userId',
        body: null,
        fromJson: (json) => List<AppNotification>.from(
          json.map(
            (item) => AppNotification.fromJson(item),
          ),
        ),
      );
      print(res.toString());

      return res;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> notify(int notificationID) async {
    try {
      final res = await _networkManager.postRequest(
        endpoint: '${Constant.user}Notify?notificationID=$notificationID',
        body: null,
        fromJson: (dynamic res) {
          return res;
        },
      );
      print(res);
      return res;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String?> deleteUser(String userId) async {
    try {
      final res = await _networkManager.postRequest(
        endpoint: '${Constant.user}DeleteUser?userId=$userId',
        body: null,
        fromJson: (dynamic res) {
          return res;
        },
      );
      print(res);
      return res;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> isActive(String userId) async {
    try {
      final res = await _networkManager.postRequest(
        endpoint: '${Constant.user}GetIsActive?userId=$userId',
        body: null,
        fromJson: (dynamic res) {
          return res;
        },
      );
      print(res);
      return res;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> blockUser(String userId, isActive) async {
    try {
      final res = await _networkManager.postRequest(
        endpoint: '${Constant.user}BlockUser?userId=$userId&isActive=$isActive',
        body: null,
        fromJson: (dynamic res) {
          return res;
        },
      );
      print(res);
      return res;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> loginById(int userId) async {
    try {
      User user = await _networkManager.postRequest(
        endpoint: '${Constant.user}LoginById?userId=$userId',
        body: null,
        fromJson: (json) => User.fromJson(json),
      );
      print(user);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> loginByG(String userName) async {
    try {
      User user = await _networkManager.postRequest(
        endpoint: '${Constant.user}LoginByGoogle?userId=$userName',
        body: null,
        fromJson: (json) => User.fromJson(json),
      );
      print(user);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> loginByUserPassword(String userName, String password) async {
    try {
      User user = await _networkManager.postRequest(
        endpoint:
            '${Constant.user}LoginByUserPassword?userId=$userName&password=$password',
        body: null,
        fromJson: (json) => User.fromJson(json),
      );
      print(user.toString());
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> addUser(int userId, String displayName, String fullName,
      String email, String password, String phone) async {
    User newUser = User(
        displayName: displayName,
        fullName: fullName,
        email: email,
        password: password,
        phone: phone,
        id: userId,
        deviceToken: '',
        lastLoginDate: '2023-01-01',
        registerationDate: '2023-01-01',
        userType: UserData.isInCanada == true ? 0 : 1,
        isActive: true,
        userImage: 'userImage');
    try {
      final User user = await _networkManager.postRequest(
        endpoint: '${Constant.user}AddUser',
        body: newUser.toJson(),
        fromJson: (json) => User.fromJson(json),
      );
      print(user);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> editUser(
      int userId,
      String displayName,
      String fullName,
      String email,
      String password,
      String phone,
      int userType,
      String? userImage) async {
    User userBody = User(
        displayName: displayName,
        fullName: fullName,
        email: email,
        password: password,
        phone: phone,
        id: userId,
        deviceToken: '',
        lastLoginDate: '2023-01-01',
        registerationDate: '2023-01-01',
        userType: userType,
        isActive: true,
        userImage: userImage);
    try {
      User user = await _networkManager.postRequest(
        endpoint: '${Constant.user}EditUser',
        body: userBody.toJson(),
        fromJson: (json) => User.fromJson(json),
      );
      print(user);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
