$(function(){
  function buildHTML(message){
   
    // カリキュラムに乗っている条件分岐はimageの有無の内容を大きく条件分岐したもの
    // 上記の理由からimageを司る表記をif文で条件分岐して変数に入れてからその変数を使って画像の表記をする
    // 上が画像ありの表記で下が画像なしの表記
    // if (message.image){
    //   var image = `<img src= "${message.image}" >`
    //  }else{
    //   var image = ""
    //  }

    // 上記の条件文を三項演算子を利用した場合
     var image = message.image ? `<img src= "${message.image}" >`: ""
    
     

    
      // shift + @の記法でクォーテーションをつけるのを忘れずに
      // 上からメッセージ名前の要素、 投降日の要素、投降内容の要素、投降画像の要素
      var html = `<div class="contents">
      <div class="contents__name">
      ${message.nickname}
      </div>
     
      <div class="contents__date">
        ${message.created_at}
      </div>
    
      <div class="contents__message">
        ${message.content}
      </div> 
      
      <div class="lower-message__image">
        ${image}

      </div>
      </div>`

      return html;
                }
    

                
                

    
    

    // class =new_messageのsubmit(sendボタン)を実装
  $('#new_message').on('submit',function(e){
    
    // htmlの機能の無効化
    e.preventDefault();
    // フォームに入力したメッセージを取得
    var formData = new FormData(this);
    // (送信先の)url(action)を取得
    var url = $(this).attr('action')
    
    // サーバーへのリクエストを記述
    $.ajax({
      // コントローラに向かうurl
      url: url,
      type: "POST",
      // 送信するデータの内容
      data: formData,
      // 帰ってくるデータ形式
      dataType: 'json',
      processData: false,
      contentType: false
    })
    // 非同期通信成功時
      // 引数dataにはcreate.json.jbuilerのデータ
    .done(function(data){
      // function buildHTML(message)を起動(htmlの表示方法を定義)
      var html = buildHTML(data);
      // 送信したメッセージをclass= main_contentに入れるようにする(非同期通信をした際のメッセージの表示に必要)
      $('.main_contents').append(html);
      // メッセージを送信した時にメッセージ画面を最下部にスクロールする
        // main_contentの現在いる位置(scrollHeightの高さの取得)をトップ(scrollTop)として上から下に移動(animate)します
      $('.main_contents').animate({ scrollTop: $('.main_contents')[0].scrollHeight});
      // メッセージと画像を一気にリセット(初期値に戻す)
      $('.new_message')[0].reset();
      // 連続で送信ボタンを押せるようにした
      $('.contents__button').prop('disabled', false);
      })
     

      // 非同期通信失敗時
    .fail(function(){
        alert("メッセージ送信に失敗しました");
    });
  });
});