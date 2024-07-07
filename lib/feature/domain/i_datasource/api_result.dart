abstract class ApiResult<T> {
  const ApiResult();
}

class Success<T> extends ApiResult<T> {
  final T data;

  const Success(this.data);
}

class Failed<T> extends ApiResult<T> {
  final Exception error;

  const Failed(this.error);
}