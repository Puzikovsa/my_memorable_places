class LocationHelper {
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    return 'https://static-maps.yandex.ru/1.x/?ll=$longitude,$latitude&size=450,450&z=14&l=map&pt=$longitude,$latitude,comma';
  }
}
