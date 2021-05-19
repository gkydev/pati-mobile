import 'package:pati_mobile/results/DataResult.dart';

class SuccessDataResult<T> extends DataResult<T>{
  SuccessDataResult(T data) : super(data,"",true);
}