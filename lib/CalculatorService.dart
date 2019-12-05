
import 'calc.dart';

class ChatMessageSnapshot
{
  ChatMessageSnapshot(this.is_system_user, this.created_time, this.message);
  bool is_system_user = false;
  DateTime created_time = DateTime.now();
  String message;
}

class CalculatorService
{
  Calculator calculator;
  CalculatorService(){
    this.calculator = new Calculator();
    var chatMsg = ChatMessageSnapshot(true, DateTime.now(), "Welcome!");
    this.messages = new List<ChatMessageSnapshot>();
    this.messages.add(chatMsg);
    if(OnAdd != null)
      this.OnAdd();
  }

  List <ChatMessageSnapshot> messages;

  Function OnAdd;
  int sendMessage(String msg){
    var chatMsg = ChatMessageSnapshot(false, DateTime.now(), msg);
    this.messages.insert(0, chatMsg);
    if(OnAdd != null)
      this.OnAdd();
    String result = calculator.calculate(msg);
    chatMsg = ChatMessageSnapshot(true, DateTime.now(), result);
    this.messages.insert(0, chatMsg);
    if(OnAdd != null)
      this.OnAdd();
  }

  ChatMessageSnapshot getMessage(int i){
    return messages[i];
  }
}

