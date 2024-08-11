class AppUtils {
  AppUtils._();

  static String clearSecrets(Object object) {
    return object.toString().replaceAllMapped(
          RegExp('(appid=)([a-z0-9]+)'),
          (match) => 'appid=*****',
        );
  }
}
