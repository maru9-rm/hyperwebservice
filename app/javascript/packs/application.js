// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
require("trix")
require("@rails/actiontext")

import axios from 'axios'


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

window.onload = function() {
    // ↪︎ windowがロードされた時にアクションを実行するように設定
      if (document.getElementById("messages")) {
        // ↪︎ messagesのIDがある場合に処理を実行させる（これがないとチャット画面がなくても常にJavaScriptが動いてしまいます）
        var scrollPosition = document.getElementById("messages").scrollTop;
        // ↪︎ messages要素のスクロールされた時の最も高い場所を取得
        var scrollHeight = document.getElementById("messages").scrollHeight;
        // ↪︎ messages要素自体の最も高い場所を取得
        document.getElementById("messages").scrollTop = scrollHeight;
        // ↪︎ area要素のスクロールされた時の最も高い場所をarea要素自体の最も高い場所として指定してあげる
      }
    }



//  document.addEventListener('DOMContentLoaded', () => {
//   $('.header-title').on('click', () => {
// 		axios.get('/')
//       .then((response) => {
//         window.alert("Hyper Web Service !!")
//       })
// 	})
// })


