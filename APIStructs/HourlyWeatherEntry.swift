//
//  HourlyWeatherEntry.swift
//  weather app
//
//  Created by Immanuel Matthews-Feemster on 9/27/23.
//

import Foundation

struct HourlyWeatherEntry: Codable {
    let time: Int
    let icon: String
    let summary: String
    let precipProbability: Double
    let temperature: Double
}
