import 'rest.dart';
import '../models/member.dart';

class MemberService {
  static Future<Member> getMemberByLoginAndPassword(
      {String email, String password}) async {
        final member = await Rest.get('member?email=$email&password=$password');
        if(member.length != 0){
          return Member.fromJson(member[0]);
        }
        return null;
      }
}
