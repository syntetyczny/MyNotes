## Google Coral ##
### Flask Camera sever ###
We can use ready git repo:
```
git clone https://github.com/Danny-Dasilva/Google-Coral-Flask-Server.git
```
and install
```
sh install.sh
```
In test.py change type stream video to *Image = camera(Empty.AI())*. It might be that camera will be not find. Thats why because in *EmptyGstreamer.py* is set wrong video source. In *app/EmptyGstreamer.py* change *video1* to *video0*. And then
```
python3 test.py
```
### Bibliography ###
* https://github.com/Danny-Dasilva/Google-Coral-Flask-Server
* https://blog.miguelgrinberg.com/post/video-streaming-with-flask
* https://github.com/miguelgrinberg/flask-video-streaming/tree/v1