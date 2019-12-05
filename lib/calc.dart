import 'dart:math';
class Calculator
{
  String input;
  Calculator(this.input);
  int index = 0;

  double calculate() {
    double result = this.addsub();
    return result;
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
    else {
      var sb = new StringBuffer("");
      while(index < input.length && "0123456789.".indexOf(input[index]) > -1){
        sb.write(input[index]);
        index += 1;
      }
      var numStr = sb.toString();
      var result = double.parse(numStr);
      return result;
    }
  }

}

main()
{
  var c = new Calculator("5*(2*2+5*(3+3))-10");
  print("======");
  print(c.calculate());
}
