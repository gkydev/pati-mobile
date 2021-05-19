import 'package:pati_mobile/results/DataResult.dart';

class ErrorDataResult<T> extends DataResult<T>{
  ErrorDataResult(T data, String message) : super(data,message,false);
}