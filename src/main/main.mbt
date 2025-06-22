///|
fn main {
  let city = "深圳"
  @mio.run(fn() {
    if (try? @mio.get("http://api1.addto.cn/api/weather?city=\{city}")) is Ok(a) {
      match a.unwrap_json() {
        // "msg": String(msg),
        // "English": Object(
        //   {
        //     "city": String(city),
        //     "time": String(time),
        //     "time2": String(time2),
        //     "wendu": String(wendu),
        //     "weatherstate": String(weatherstate),
        //     "fengxiang": String(fengxiang),
        //     "shidu": String(shidu),
        //     "kPa": String(kPa),
        //     "car": String(car),
        //     "tips": String(tips),
        //     ..
        //   }
        // ),
        {
          "code": 200,
          "Chinese": {
            "查询城市": String(chinese_city),
            "预报时间": String(chinese_time),
            "当前温度": String(chinese_wendu),
            "天气状态": String(chinese_weatherstate),
            "当前风向": String(chinese_fengxiang),
            "当前湿度": String(chinese_shidu),
            "当前气压": String(chinese_kPa),
            "尾号限行": String(chinese_car),
            "tips": String(chinese_tips),
            ..
          },
          "生活指数": {
            "空调": String(aircon),
            "过敏": String(allergy),
            "洗车": String(carwash),
            "风寒": String(cold),
            "穿衣": String(clothes),
            "感冒": String(cold_illness),
            "舒适度": String(comfort),
            "空气污染扩散条件": String(air_pollution),
            "路况": String(road_condition),
            "晾晒": String(drying),
            "钓鱼": String(fishing),
            "中暑": String(heatstroke),
            "化妆": String(makeup),
            "心情": String(mood),
            "晨练": String(morning_exercise),
            "运动": String(sports),
            "太阳镜": String(sunglasses),
            "防晒": String(sunscreen),
            "旅游": String(tourism),
            "交通": String(traffic),
            "紫外线强度": String(uv),
            "雨伞": String(umbrella),
            ..
          },
          "author": String(author),
          ..
        } => {
          println("🌤️ \{city}天气报告")
          println(
            "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
          )
          println("📍 城市：" + chinese_city)
          println("🕒 时间：" + chinese_time)
          println("🌡️ 温度：" + chinese_wendu)
          println("☁️ 天气：" + chinese_weatherstate)
          println("💨 风向：" + chinese_fengxiang)
          println("💧 湿度：" + chinese_shidu)
          println("📊 气压：" + chinese_kPa)
          if chinese_car != "" {
            println("🚗 限行：" + chinese_car)
          }
          println(
            "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
          )
          println("📌 生活指数")
          println("❄️ 空调指数：" + aircon)
          println("🤧 过敏指数：" + allergy)
          println("🚗 洗车指数：" + carwash)
          println("🥶 风寒指数：" + cold)
          println("👔 穿衣指数：" + clothes)
          println("🤒 感冒指数：" + cold_illness)
          println("😌 舒适度：" + comfort)
          println("🌫️ 空气污染扩散条件：" + air_pollution)
          println("🛣️ 路况指数：" + road_condition)
          println("☀️ 晾晒指数：" + drying)
          println("🎣 钓鱼指数：" + fishing)
          println("🥵 中暑指数：" + heatstroke)
          println("💄 化妆指数：" + makeup)
          println("😊 心情指数：" + mood)
          println("🏃 晨练指数：" + morning_exercise)
          println("⚽ 运动指数：" + sports)
          println("🕶️ 太阳镜指数：" + sunglasses)
          println("🧴 防晒指数：" + sunscreen)
          println("🏖️ 旅游指数：" + tourism)
          println("🚦 交通指数：" + traffic)
          println("☀️ 紫外线强度：" + uv)
          println("🌂 雨伞指数：" + umbrella)
          println(
            "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
          )
          if chinese_tips != "" {
            println("💡 温馨提示：" + chinese_tips)
          }
          println("📝 数据来源：" + author)
        }
        _ => println("❌ 无法解析天气数据")
      }
    }
  })
}
