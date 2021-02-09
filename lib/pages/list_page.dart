import 'package:flutter/material.dart';
import 'package:ostnewmrqueen/core/const.dart';
import 'package:ostnewmrqueen/models/music_model.dart';
import 'package:ostnewmrqueen/widgets/custom_button_widget.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<MusicModel> _list;

  int _playId;

  //we will need some variables
  bool playing = true; // at the begining we are not playing any song
  IconData playBtn = Icons.play_arrow; // the main state of the play button icon
  IconData pauseBtn = Icons.play_arrow; // the main state of the play button icon
  
  //Now let's start by creating our music player
  //first let's declare some object
  AudioPlayer _player;
  AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();


  //we will create a custom slider

  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.blue[800],
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  //let's create the seek function that will allow us to go to a certain position of the music
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    // TODO: implement initState
    _playId = 1;
    _list = MusicModel.list;

    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    super.initState();

     //now let's handle the audioplayer time

    //this function will allow you to get the music duration
    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

    //this function will allow us to move the cursor of the slider while we are playing the song
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.mainColor,
          centerTitle: true,
          title: Text(
            "Mr Queen",
            style: TextStyle(color: AppColors.styleColor),
          )),
      body: Stack(children: <Widget>[
        Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomButtonWidget(
                    child: Icon(Icons.favorite, color: AppColors.styleColor),
                    size: 50,
                    onTap: () {},
                  ),
                  CustomButtonWidget(
                    image: "assets/logo.jpg",
                    size: 150,
                    borderWidth: 5,
                    onTap: () {},
                  ),
                  CustomButtonWidget(
                    child: Icon(Icons.menu, color: AppColors.styleColor),
                    size: 50,
                    onTap: () {},
                  ),
                ]),
          ),
          slider(),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: _list[index].id == _playId
                          ? AppColors.activeColor
                          : AppColors.mainColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _list[index].title,
                              style: TextStyle(
                                  color: AppColors.styleColor, fontSize: 16),
                            ),
                            Text(_list[index].album,
                                style: TextStyle(
                                    color: AppColors.styleColor.withAlpha(100),
                                    fontSize: 16))
                          ]),
                      CustomButtonWidget(
                          child: Icon(
                              _list[index].id == _playId
                                  ? pauseBtn
                                  : playBtn,
                              color: _list[index].id == _playId
                                  ? Colors.white
                                  : AppColors.styleColor),
                          size: 50,
                          isActive: _list[index].id == _playId,
                          onTap: () {
                            if (playing) {
                              //now let's play the song
                              cache.play('${_list[index].songPath}');
                              setState(() {
                                _playId = _list[index].id;
                                playing = false;
                                playBtn=Icons.play_arrow;
                                pauseBtn=Icons.pause;
                              });
                            } else if (!playing) {
                              if (_list[index].id == _playId) {
                                _player.pause();
                                setState(() {
                                   playing = true;
                                   playBtn=Icons.play_arrow;
                                   pauseBtn=Icons.play_arrow;
                                });
                              } else {
                                cache.play('${_list[index].songPath}');
                                setState(() {
                                  _playId = _list[index].id;
                                });
                              }
                            }
                          })
                    ],
                  ),
                );
              },
            ),
          )
        ]),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              AppColors.mainColor.withAlpha(0),
              AppColors.mainColor
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
        )
      ]),
    );
  }
}
