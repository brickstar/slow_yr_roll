

```
### post login workflow
authorized user signs in with google
user should land on show page for Song.first
it should have an embedded player with/play/pause ff/rw and playback rate controls for this song
it should have links by title for all songs associated with current user
click link to song title should land on show for this song
should see links to all other songs
embedded player now functions for this song

### upload workflow
logged in user
should see a form to upload a song with a field to add a title (validated)
after clicking on 'Add Song', should land on song_path for this song and see uploaded title
embedded audio player should function for this song
(check read access)

### logout workflow
logged in user should see logout button in upper right
clicks on logout and should land on welcome index
should not see logout button
should see link to sign in with google

### save s3 link to pg
not sure how to test this - maybe tested in validation of path attribute on songs table that holds s3 links?

### playback rate
logged in user
should see a dial (maybe fa buttons or slider?)
should be able adjust audio playback rate from 10% - 100% while audio playback is active

### update
logged in user
should see a link to 'change song title' (font awesome thumbnail prob)
clicks link should see a form to edit the song title
clicks 'save title' should land on song show
should see new title
should not see old title

### delete
logged in user
should see button to 'remove this song' (font awesome thumbnail prob)
clicks button should stay on show
should not see song

deploy to heroku
```
