-- Add a new title field to the bookmarks table in both the bookmark_manager database and the bookmark_manager_test database
ALTER TABLE bookmarks ADD COLUMN title VARCHAR(60);
