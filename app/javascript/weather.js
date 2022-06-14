'use strict';

ajaxRequest(43.046848, 141.322114);

// UTCをミリ秒に
function utcToJSTime(utcTime) {
  return utcTime * 1000;
}

// データ取得
function ajaxRequest(lat, long) {
  const url = 'https://api.openweathermap.org/data/2.5/forecast';
  const appId = 'af04c9d9fbeeb75ac003c77f6b7f4018';

  $.ajax({
    url: url,
    data: {
      appid: appId,
      lat: lat,
      lon: long,
      units: 'metric',
      lang: 'ja'
    }
  })
  .done(function(data) {
    console.log(data);

    // 都市名、国名
    $('#place').text(data.city.name + ',' + data.city.country);

    // 天気予報データ
    data.list.forEach(function(forecast, index) {
      const dateTime = new Date(utcToJSTime(forecast.dt));
      const month = dateTime.getMonth() + 1;
      const date = dateTime.getDate();
      const hours = dateTime.getHours();
      const min = String(dateTime.getMinutes()).padStart(2, '0');
      const temperature = Math.round(forecast.main.temp);
      const description = forecast.weather[0].description;
      const iconPath = `/assets/${forecast.weather[0].icon}.svg`;

    // 現在の天気とそれ以外で出力を変える
    if(index === 0) {
      const currentWeather = `
      <div class="icon"><img src="${iconPath}"></div>
      <div class="info">
        <p>
          <span class="description">現在の天気:${description}</span>
          <span class="temp">${temperature}</span>°c
        </p>
      </div>`;
      $('#weather').html(currentWeather);
    } else {
      const tableRow = `
      <tr>
        <td class="info">
          ${month}/${date} ${hours}:${min}
        </td>
        <td class="icon"><img src="${iconPath}"></td>
        <td><span class="description">${description}</span></td>
        <td><span class="temp">${temperature}</span></td>
      </tr>`;
      $('#forecast').append(tableRow);
    }
    });
  })
  .fail(function() {
    console.log(`$.ajax failed!`);
  })
}