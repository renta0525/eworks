setInterval(function() {
  // 曜日の配列
  const days = ["日", "月", "火", "水", "木", "金", "土"];
  const today = new Date();
  const year = today.getFullYear()
  const month = today.getMonth() + 1
  const date = today.getDate()
  const day = days[today.getDay()]

  // HTML
  const dayElement = document.querySelector('.day');
  if (dayElement) {
    dayElement.innerText = `${year}年${month< 10 ? `0${month}` :month}月${date< 10 ? `0${date}` :date}日（${day}）`;
  }
}, 1000);

setInterval(function(){
  //clock
const today = new Date
const hour = today.getHours()
const minute = today.getMinutes()
const second = today.getSeconds()

//HTML
const clock = document.querySelector('.clock')
clock.innerText = `${hour < 10 ? `0${hour}` :hour}:${minute < 10 ? `0${minute}` :minute}:${second < 10 ? `0${second}` :second}`
},1000)

document.addEventListener("DOMContentLoaded", function() {
  var button = document.getElementById('get-location');
  var placeField = document.getElementById('work_place');

  button.addEventListener('click', function(event) {
    event.preventDefault();

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;

        // フォームに位置情報を設定
        placeField.value = latitude + ", " + longitude;

        // フォームを送信
        button.form.submit();
      }, function(error) {
        alert('Error getting location: ' + error.message);
      });
    } else {
      alert("Geolocation is not supported by this browser.");
    }
  });
});