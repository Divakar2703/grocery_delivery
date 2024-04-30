abstract class BaseApiServices{
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic>  getPostApiResponse(String url ,dynamic data);
  Future<dynamic>  getPostApiFoodResponse(String url ,dynamic data);
}