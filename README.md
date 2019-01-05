# SlowYrRoll!

#### About
The mission of this application is to increase the learning capabilities of children with a speech delay.  Often the tempo of music is a little too fast for young children with special needs to be able replicate pronunciation and phonetics.  Slowing the playback rate makes the music more accessible for learning.  This application allows parents and therapitsts to upload audio files and slow down the rate of speed during playback without changing the pitch.  Lyrics are also available to users via IBM Watson's Speech to Text API.  This was a solo project built over 10 days during module 3 at Turing School of Software & Design.

#### See it Live
[SlowYrRoll](https://slow-yr-roll.herokuapp.com) on Heroku

![slow-demo](https://user-images.githubusercontent.com/33355897/50727860-42bd5800-10de-11e9-9048-fe15027d6079.gif)

<img width="1440" alt="screen shot 2018-09-19 at 11 49 44 am" src="https://user-images.githubusercontent.com/33355897/45772631-7b0b5a00-bc05-11e8-8679-bc87c5969592.png">

<img width="1440" alt="screen shot 2018-09-19 at 12 14 26 pm" src="https://user-images.githubusercontent.com/33355897/45772699-a55d1780-bc05-11e8-9564-221fcf31e74f.png">

#### Setup
* Clone this repository and run ``$ bundle``
* To run this application locally you will need to add the following ENV variables to config/application.yml; GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_BUCKET (name of your AWS S3 bucket)
* Run specs with ``$ rspec``
* After signing in with Google, upload an Mp3 and you're ready to go!

#### Versions
* ruby 2.4.1
* Rails/ActiveRecord 5.2.1


