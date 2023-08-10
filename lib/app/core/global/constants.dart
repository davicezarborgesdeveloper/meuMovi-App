enum SessionStorageKeys {
  accessToken('/ACCESS_TOKEN/'),
  keepLogged('/KEEP_LOGGED/');

  final String key;

  const SessionStorageKeys(this.key);
}
