import 'package:http/http.dart' as http;

class SendMessaging {
  
  Future<void> sendMessage(String token, String data) async{
    final http.Response response = await http.post("https://fcm.googleapis.com/fcm/send", body: data, headers: {
      "Content-Type": "application/json",
      "Authorization": "key=\"$token\""
    });
     if (response.statusCode == 201 || response.statusCode == 200) {
       print(response);
     }else {
       print(response.body);
       print("Failed send message");
     }
  }

}
