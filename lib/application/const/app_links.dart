class AppLinks {
  const AppLinks._();

  static const _weatherDoc = 'PackRuble/public_doc/main/weather_today_doc';

  static final privacyPolicyUrl = Uri.https(
    'raw.githubusercontent.com',
    '$_weatherDoc/privacy_policy.md',
  );

  static final termsOfUseAppUrl = Uri.https(
    'raw.githubusercontent.com',
    '$_weatherDoc/terms_of_use_app.md',
  );

  static final termsAndConditionsUrl = Uri.https(
    'raw.githubusercontent.com',
    '$_weatherDoc/terms&conditions.md',
  );
}
