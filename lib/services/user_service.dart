import 'rest.dart';
import '../models/user.dart';

class UserService {
  static Future<User> getUserByLoginAndPassword(
      {String login, String password}) async {
        final user = await Rest.get('users?login=$login&password=$password');
        if(user.length != 0){
          return User.fromJson(user[0]);
        }
        return null;
      }
}
