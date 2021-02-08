class MusicModel {
  final int id;
  final String title;
  final String album;

  final String songPath;
  final double duration;

  MusicModel({this.id, this.title, this.album, this.duration,this.songPath});

  static List<MusicModel> list = [
    MusicModel(
      id: 1,
      title: "Future",
      album: "StartUp",
      duration: 60,
      songPath: "future.mp3"
    ),
    MusicModel(
      id: 2,
      title: "I Will",
      album: "Others",
      duration: 60,
      songPath: "iwill.mp3"
    ),
    MusicModel(
      id: 3,
      title: "Bong Hwan A",
      album: "Mr Queen",
      duration: 60,
      songPath: "1Bonghwana.mp3"
    ),
  ];
}
