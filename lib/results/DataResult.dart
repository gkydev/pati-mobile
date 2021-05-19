import 'package:pati_mobile/results/Result.dart';

class  DataResult<T> extends Result{

T data;

DataResult(this.data, String message, bool success) : super(success, message);

}