//
//  DailyWeather.swift
//  weather app
//
//  Created by Immanuel Matthews-Feemster on 9/26/23.
//

import Foundation

struct DailyWeather: Codable {
    let summary: String
    let icon: String
    let data: [DailyWeatherEntry]
}
