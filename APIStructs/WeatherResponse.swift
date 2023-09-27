//
//  WeatherResponse.swift
//  weather app
//
//  Created by Immanuel Matthews-Feemster on 9/26/23.
//

import Foundation

struct WeatherResponse: Codable {
    let latitude: Float
    let longitude: Float
    let timezone: Float
    let currently: CurrentWeather
    let hourly: HourlyWeather
    let daily: DailyWeather
    let offset: Float
}
