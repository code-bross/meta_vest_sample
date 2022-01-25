class ApiResponse<T> {
  Status status;
  T? res; //dynamic
  String loadingMessage = 'loading....';
  late GeneralError error;

  ApiResponse.init() : status = Status.Init;

  ApiResponse.loading(this.loadingMessage) : status = Status.Loading;

  ApiResponse.success(this.res) : status = Status.Success;

  ApiResponse.error(this.error) : status = Status.Error;


  @override
  String toString() {
    return "Status : $status \n Message : $loadingMessage \n Data : $res";
  }
}

abstract class GeneralError{

}

enum Status {
  Init,
  Loading,
  Success,
  Error,
}