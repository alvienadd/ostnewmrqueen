class MusicModel {
  final int id;
  final String title;
  final String album;

  final String songPath;
  final double duration;

  MusicModel({this.id, this.title, this.album, this.duration, this.songPath});

  static List<MusicModel> list = [
    MusicModel(
        id: 1,
        title: "Bong Hwan A",
        album: "Norazo",
        duration: 60,
        songPath: "1Bonghwana.mp3"),
    MusicModel(
        id: 2,
        title: "Like A Star",
        album: "Jang Han Byul",
        duration: 60,
        songPath: "2JByulLikeastar.mp3"),
    MusicModel(
        id: 3,
        title: "Here I am",
        album: "Jo Hyun Ah",
        duration: 60,
        songPath: "3Hereiam.mp3"),
    MusicModel(
        id: 4,
        title: "Puzzle",
        album: "SOYOU, Park Woojin",
        duration: 60,
        songPath: "4Puzzle.mp3"),
    MusicModel(
        id: 5,
        title: "Keep Going",
        album: "DinDin",
        duration: 60,
        songPath: "5keepgoing.mp3"),
    MusicModel(
        id: 6,
        title: "The Great Recipe",
        album: "sEODo",
        duration: 60,
        songPath: "6thegreatrecipe.mp3"),
    MusicModel(
        id: 7,
        title: "To My One And Only You",
        album: "Xiumin",
        duration: 60,
        songPath: "7tomyoneandonlyyou.mp3"),
    MusicModel(
        id: 8,
        title: "Like A Star",
        album: "One Star",
        duration: 60,
        songPath: "8onestarlikeastar.mp3"),
  ];
}
