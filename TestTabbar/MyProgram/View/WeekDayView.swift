//
//  DayView.swift
//  TestTabbar
//
//  Created by Eri on 1/16/19.
//  Copyright © 2019 Eri. All rights reserved.
//

import UIKit

class WeekDayView: UIView
{
    let weekDayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: WEEKDAY_LABEL_FONT_NAME, size: WEEKDAY_LABEL_FONT_SIZE)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dayOfTheMonthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: DAY_OF_THE_MONTH_LABEL_FONT_NAME, size: DAY_OF_THE_MONTH_LABEL_FONT_SIZE)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews()
        setupUIComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        self.addSubview(weekDayLabel)
        self.addSubview(dayOfTheMonthLabel)
    }
    
    func setupUIComponents() {
        setupDayOfTheMonthLabel()
        setupDayOfTheWeekLabel()
    }
    
    func setupDayOfTheMonthLabel() {
        dayOfTheMonthLabel.topAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        dayOfTheMonthLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func setupDayOfTheWeekLabel() {
        weekDayLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        weekDayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}


