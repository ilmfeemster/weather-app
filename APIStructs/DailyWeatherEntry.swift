//
//  DailyWeatherEntry.swift
//  weather app
//
//  Created by Immanuel Matthews-Feemster on 9/27/23.
//

import Foundation

struct DailyWeatherEntry: Codable {
    let time: Int
    let icon: String
    let summary: String
    let precipProbability: Double
    let temperatureHigh: Double
    let temperatureLow: Double
}
