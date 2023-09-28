//
//  CurrentWeather.swift
//  weather app
//
//  Created by Immanuel Matthews-Feemster on 9/26/23.
//

import Foundation

struct CurrentWeather: Codable {
    let summary: String
    let icon: String
    let temperature: Double
}
