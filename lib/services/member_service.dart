import 'rest.dart';
import '../models/member.dart';

class MemberService {
  static Future<Member> getMemberByLoginAndPassword(
      {String email, String password}) async {
        final member = await Rest.get('member?email=$email&password=$password');
        if(member.length != 0){
          if(member[0] != null) { return Member.fromJson(member[0]); }
          else if(member['matrix_card'] != null) return Member.fromJson(member);
        }
        return null;
      }
}
