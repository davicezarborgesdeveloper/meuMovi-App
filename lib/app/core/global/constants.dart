enum SharedStoreKeys {
  authAccess('authAccess'),
  accessToken('accessToken'),
  keepLogged('keepLogged');

  final String key;

  const SharedStoreKeys(this.key);
}
