// IFrame Player API の読み込み
var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// YouTubeの埋め込み
function onYouTubeIframeAPIReady() {
  ytPlayer = new YT.Player(
       'sample', // 埋め込む場所の指定
        {
           width: 640, // プレーヤーの幅
          height: 390, // プレーヤーの高さ
            videoId: 'aMCuW4PdoDQ' // YouTubeのID
            // パラメータの設定
            playerVars: {
               rel: 0, // 再生終了後に関連動画を表示するかどうか設定
                autoplay: 1 // 自動再生するかどうか設定
             }
       }
   );
}


$(function() {
   // 再生
   $('#play').click(function() {
     // playerReadyがtrueのときだけ実行
      if(playerReady) {
           ytPlayer.playVideo();
       }
   });
 // 一時停止
 $('#pause').click(function() {
        // playerReadyがtrueのときだけ実行
      if(playerReady) {
           ytPlayer.pauseVideo();
      }
   });
 // 1分前へ
 $('#prev').click(function() {
     // playerReadyがtrueのときだけ実行
      if(playerReady) {
           // 現在の再生時間取得
            var currentTime = ytPlayer.getCurrentTime();
            // シークバーの移動
         ytPlayer.seekTo(currentTime - 60);
      }
   });
 // 1分先へ
 $('#next').click(function() {
     // playerReadyがtrueのときだけ実行
      if(playerReady) {
           // 現在の再生時間取得
            var currentTime = ytPlayer.getCurrentTime();
            // シークバーの移動
         ytPlayer.seekTo(currentTime + 60);
      }
   });
 // 音量アップ(+10)
   $('#volup').click(function() {
        // playerReadyがtrueのときだけ実行
      if(playerReady) {
           // 現在の音量取得
          var currentVol = ytPlayer.getVolume();
          // 音量の変更
            ytPlayer.setVolume(currentVol + 10);
        }
   });
 // 音量ダウン(-10)
   $('#voldown').click(function() {
      // playerReadyがtrueのときだけ実行
      if(playerReady) {
           // 現在の音量取得
          var currentVol = ytPlayer.getVolume();
          // 音量の変更
            ytPlayer.setVolume(currentVol - 10);
        }
   });
 // ミュート
 $('#mute').click(function() {
     // playerReadyがtrueのときだけ実行
      if(playerReady) {
           // ミュートされているかどうか
            if(ytPlayer.isMuted()) {
                // ミュートの解除
              ytPlayer.unMute();
          } else {
                // ミュート
             ytPlayer.mute();
            }
       }
   });
});


var playerReady = false;
// プレーヤーの準備ができたとき
function onPlayerReady(event) {
    playerReady = true;
   // 動画再生
}

// プレーヤーの状態が変更されたとき
function onPlayerStateChange(event) {
   // 現在のプレーヤーの状態を取得
   var ytStatus = event.data;
  // 再生終了したとき
 if (ytStatus == YT.PlayerState.ENDED) {
     console.log('再生終了');
      // 動画再生
     event.target.playVideo();
   }
   // 再生中のとき
   if (ytStatus == YT.PlayerState.PLAYING) {
       console.log('再生中');
   }
   // 停止中のとき
   if (ytStatus == YT.PlayerState.PAUSED) {
        console.log('停止中');
   }
   // バッファリング中のとき
  if (ytStatus == YT.PlayerState.BUFFERING) {
     console.log('バッファリング中');
  }
   // 頭出し済みのとき
 if (ytStatus == YT.PlayerState.CUED) {
      console.log('頭出し済み');
 }
}

