import 'dart:collection';
import 'dart:math';

class Calculator
{
  String input;

  int index = 0;
  var p = new RegExp(r'^[a-zA-Z]+[0-9a-zA-Z]*$');
  var vartable = new HashMap<String, double>();
  bool isValidVar(String str){
    return str.indexOf(p) > -1;
  }
  String calculate(String expression) {
    this.input = expression;
    this.index = 0;
    var eqIdx = input.indexOf('=');
    if(eqIdx > -1) {
      var variable = input.substring(0, eqIdx).trim();
      index = eqIdx + 1;
      double result = this.addsub();
      vartable[variable] = result;
      return "";
    }
    double result = this.addsub();
    return result.toString();
  }

  double addsub(){
    double result = this.multiplyDivide();
    while(index < input.length){
      if(input[index] == ' ' || input[index] == '\t') {
        index += 1;
      }
      else if (input[index] == '+' || input[index] == '-' ){
        bool pos = true;
        if(input[index] == '-')
        {
          pos = false;
        }
        index += 1;
        num result1 = this.multiplyDivide();
        if(pos){
          result += result1;
        }
        else{
          result -= result1;
        }
      }
      else {
//        print("Expecting +/- but got " + input[index]);
        break;
      }
    }
    return result;
  }

  double multiplyDivide() {
    double result = this.exp();
    while(index < input.length){
      if(input[index] == ' ' || input[index] == '\t') {
        index += 1;
      }
      else if (input[index] == '*' || input[index] == '/' ){
        bool mul = true;
        if(input[index] == '/')
        {
          mul = false;
        }
        index += 1;
        num result1 = this.exp();
        if(mul){
          result *= result1;
        }
        else{
          result /= result1;
        }
      }
      else {
//        print("Expecting *// but got " + input[index]);
        break;
      }
    }
    return result;
  }

  double exp() {
    double result = this.atom();
    while(index < input.length){
      if(input[index] == ' ' || input[index] == '\t') {
        index += 1;
      }
      else if (input[index] == '^'){
        index += 1;
        num result1 = this.atom();
        return pow(result, result1);
      }
      else {
//        print("Expecting *// but got " + input[index]);
        break;
      }
    }
    return result;
  }
  void consumespace()
  {
    while(input[index] == ' ' || input[index] == '\t') {
      index += 1;
    }
  }
  double atom()
  {
    consumespace();

    if(input[index] == '('){
      index += 1;
      num result = this.addsub();
      consumespace();
      if(input[index] == ')') {
        index += 1;
        return result;
      }
      else {
        print("Looks like there is some error in expression.");
        return 0.0;
      }
    }
    else if("0123456789.".indexOf(input[index]) > -1){
      var sb = new StringBuffer("");
      while(index < input.length && "0123456789.".indexOf(input[index]) > -1){
        sb.write(input[index]);
        index += 1;
      }
      var numStr = sb.toString();
      var result = double.parse(numStr);
      return result;
    }
    else {
      var sb = new StringBuffer("");
      var newindex = input.indexOf(new RegExp('[^a-zA-Z0-9]+'), index);
      var varname = input.substring(index, newindex);
      index = newindex;
      if(vartable.containsKey(varname)){
        return vartable[varname];
      }
      else {
        print("Invalid variable name: " + varname);
        return 0.0;
      }
    }
  }

}

//TODO: Exception handling
main()
{
  var c = new Calculator();
  print("======");
  print(c.calculate("5"));
  print(c.calculate("y = 50"));
  print(c.calculate("x*y+10"));

}
