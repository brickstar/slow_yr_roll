# SlowYrRoll!

#### Application
I first got the idea to build this app during a speech therapy appointment for my daughter. My daughter Pearl has Down Syndrome. While Pearl is thriving - we are always looking for ways to leverage her learning. During this particular therapy appointment, we were working on strengthening Pearl's speech mechanism. Specifically we were working on pronunciation of "D"
and "DOO" sounds. Pearl's amazing therapist Danielle had the perfect song in mind for this - the Baby Shark song by PinkFong. After she got the song queued up, she realized the playback rate was just too fast to accomplish what she had intended. This application allows parents and therapitsts to upload audio files and control the speed of the playback rate. Pearl loves it!

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


