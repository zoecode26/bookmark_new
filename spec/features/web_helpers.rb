def empty
  DatabaseConnection.setup('bookmark_manager_test')
  DatabaseConnection.query("TRUNCATE TABLE bookmarks;")
end
