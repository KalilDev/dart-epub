class ZipPathUtils {
  static String getDirectoryPath(String filePath) {
    final lastSlashIndex = filePath.lastIndexOf('/');
    if (lastSlashIndex == -1) {
      return '';
    } else {
      return filePath.substring(0, lastSlashIndex);
    }
  }

  static String combine(String directory, String fileName) {
    if (directory == '') {
      return fileName;
    } else {
      return directory + '/' + fileName;
    }
  }
}
