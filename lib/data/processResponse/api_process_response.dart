
import 'package:grocery_delivery_side/data/processResponse/status.dart';

class ApiProcessResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiProcessResponse(this.data, this.message, this.status);

  ApiProcessResponse.loading() : status = Status.LOADING;

  ApiProcessResponse.completed(this.data) : status = Status.COMPLETED;

  ApiProcessResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status :$status  \n Message : $message  \n Data :$data";
  }
}
