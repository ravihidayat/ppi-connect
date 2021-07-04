import 'rest.dart';
import '../models/member.dart';

class MemberService {
  static Future<Member> getMemberByLoginAndPassword(
      {String email, String password}) async {
        Map<String, dynamic> d = {'email' : email, 'password': password};
        final member = await Rest.post('member', data: d);
        if(member.length != 0){
          if(member[0] != null) { return Member.fromJson(member[0]); }
          else if(member['matrix_card'] != null) return Member.fromJson(member);
        }
        return null;
      }
}
