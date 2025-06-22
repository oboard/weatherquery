///|
fn format_time(time : String) -> String {
  let year = time.substring(start=0, end=4)
  let month = time.substring(start=4, end=6)
  let day = time.substring(start=6, end=8)
  let hour = time.substring(start=8, end=10)
  let minute = time.substring(start=10, end=12)
  return "\{year}-\{month}-\{day} \{hour}:\{minute}"
}

///|
fn main {
  let province = "广东"
  let city = "深圳"
  let county = "福田区"
  @mio.run(fn() {
    if (try? @mio.get(
        "https://wis.qq.com/weather/common?source=pc&weather_type=observe&province=\{province}&city=\{city}&county=\{county}",
      ))
      is Ok(a) {
      match a.unwrap_json() {
        {
          "status": 200,
          "data": {
            "observe": {
              "degree": String(temperature),
              "humidity": String(humidity),
              "pressure": String(pressure),
              "weather": String(weather),
              "wind_direction_name": String(wind_direction),
              "wind_power": String(wind_power),
              "update_time": String(update_time),
              ..
            },
            ..
          },
          ..
        } => {
          println("🌤️ \{city}天气报告")
          println(
            "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
          )
          println("📍 城市：\{province}\{city}\{county}")
          println("🕒 更新时间：\{format_time(update_time)}")
          println("🌡️ 温度：\{temperature}°C")
          println("☁️ 天气：\{weather}")
          println("💨 风向：\{wind_direction} \{wind_power}级")
          println("💧 湿度：\{humidity}%")
          println("📊 气压：\{pressure}hPa")
          println(
            "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
          )
          println("📝 数据来源：腾讯天气")
        }
        _ => println("❌ 无法解析天气数据")
      }
    }
  })
}
