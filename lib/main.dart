//Linh Tran, Serite Ross, Kaylin Archuleta
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

Map audioData = {
  'url':
      'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4'
};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer audioPlayer = AudioPlayer();

  Duration totDuration = Duration();
  Duration position = Duration();
  String state = '';
  int result = 0;

  //getting the current position of the song playing
  inAudio() {
    audioPlayer.onAudioPositionChanged.listen((updatedPosition) {
      setState(() {
        position = updatedPosition;
      });
    });
  }

  //call inAudio to capture the position
  @override
  void initState() {
    inAudio();
    super.initState();
  }

  //play song, or resume playing if audioState is PAUSED
  play() {
    if (result == 1) {
      audioPlayer.resume();
    } else {
      audioPlayer.play(
          'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4');
    }
  }

  //pause song
  pause() async {
    result = await audioPlayer.pause();
  }

  //stop song
  stop() {
    audioPlayer.stop();
  }

  //UI and functional buttons built
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        centerTitle: true,
        title: Text("MusicSpace"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/images/albumcover.jpg'),
              height: 500.0,
              width: 500.0,
            ),
            Text('Song Name', style: TextStyle(fontSize: 32)),
            Text(position.toString().split('.').first,
                style: TextStyle(fontSize: 24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: deprecated_member_use
                FlatButton(
                    onPressed: () {
                      play();
                    },
                    child: const Text('Play'),
                    color: Colors.blueGrey.shade600),
                // ignore: deprecated_member_use
                FlatButton(
                    onPressed: () {
                      pause();
                    },
                    child: const Text('Pause'),
                    color: Colors.blueGrey.shade100),
                // ignore: deprecated_member_use
                FlatButton(
                    onPressed: () {
                      stop();
                    },
                    child: const Text('Stop'),
                    color: Colors.grey)
              ],
            )
          ],
        ),
      ),
    );
  }
}
