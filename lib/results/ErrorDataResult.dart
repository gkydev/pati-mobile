import 'package:pati_mobile/results/DataResult.dart';

class ErrorDataResult<T> extends DataResult<T>{

  ErrorDataResult(String message) : super(null,message,false);
  
}