class FirestorePaths {
  static String getNotes() => 'notes/';
  static String addNotes(String id) => 'notes/$id';
  static String deleteNotes(String id) => 'notes/$id';
  static String updateNotes(String id) => 'notes/$id';
  static String addFavorite(String id) => 'notes/$id/favorite/$id';
  static String getFavorite(String id) => 'notes/$id/favorite/';
}