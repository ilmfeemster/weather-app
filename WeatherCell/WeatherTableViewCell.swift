//
//  WeatherTableViewCell.swift
//  weather app
//
//  Created by Immanuel Matthews-Feemster on 9/26/23.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    static let identifier = "WeatherTableViewCell"
    
    private let iconImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .label
        return iv
    }()
    
    private let dayLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.text = "Error"
        return label
    }()
    
    private let lowTempLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "Error"
        return label
    }()
    
    private let highTempLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "Error"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: DailyWeatherEntry) {
        self.lowTempLabel.text = "Low: \(Int(model.temperatureLow))°"
        self.highTempLabel.text = "High: \(Int(model.temperatureHigh))°"
        self.dayLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(model.time)))
        self.iconImageView.image = UIImage(named: "\(model.icon)")
    }
    
    func getDayForDate(_ date: Date?) -> String {
        guard let inputDate = date else {
            return ""
        }
        
        if Calendar.current.isDate(Date.now, equalTo: inputDate, toGranularity: .day){
            return "Today"
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        return formatter.string(from: inputDate)
    }
    
    private func setupUI() {
        self.contentView.addSubview(iconImageView)
        self.contentView.addSubview(dayLabel)
        self.contentView.addSubview(lowTempLabel)
        self.contentView.addSubview(highTempLabel)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        lowTempLabel.translatesAutoresizingMaskIntoConstraints = false
        highTempLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            dayLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            dayLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            dayLabel.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            
            dayLabel.heightAnchor.constraint(equalToConstant: 25),
            dayLabel.widthAnchor.constraint(equalToConstant: 70),
            
            iconImageView.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor),
            iconImageView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            
            lowTempLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            lowTempLabel.bottomAnchor.constraint(equalTo: self.highTempLabel.topAnchor),
            lowTempLabel.leadingAnchor.constraint(equalTo: self.dayLabel.trailingAnchor, constant: 16),
            
            lowTempLabel.heightAnchor.constraint(equalToConstant: 20),
            lowTempLabel.widthAnchor.constraint(equalToConstant: 90),
            
            highTempLabel.topAnchor.constraint(equalTo: self.lowTempLabel.bottomAnchor, constant: -16),
            highTempLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            highTempLabel.leadingAnchor.constraint(equalTo: self.dayLabel.trailingAnchor, constant: 16),
            
            highTempLabel.heightAnchor.constraint(equalToConstant: 20),
            highTempLabel.widthAnchor.constraint(equalToConstant: 90),
        ])
    }
}
