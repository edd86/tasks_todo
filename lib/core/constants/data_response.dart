class DataResponse<T> {
  final T? data;
  final String? message;
  final bool isLoading;
  final bool isError;
  final bool isSuccess;

  DataResponse({
    required this.data,
    required this.message,
    required this.isLoading,
    required this.isError,
    required this.isSuccess,
  });

  factory DataResponse.success(T data, String message) {
    return DataResponse(
      data: data,
      message: message,
      isLoading: false,
      isError: false,
      isSuccess: true,
    );
  }

  factory DataResponse.error(String message) {
    return DataResponse(
      data: null,
      message: message,
      isLoading: false,
      isError: true,
      isSuccess: false,
    );
  }

  factory DataResponse.loading() {
    return DataResponse(
      data: null,
      message: null,
      isLoading: true,
      isError: false,
      isSuccess: false,
    );
  }
}
