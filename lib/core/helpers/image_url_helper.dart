import '../constant/api.dart';

String getProductImageUrl(String? url) {
  if (url == null) return '';
  return url.replaceFirst('localhost', LOCAL_IP);
}
