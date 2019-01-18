//
//  ExerciseTVCell.swift
//  TestTabbar
//
//  Created by Eri on 1/15/19.
//  Copyright © 2019 Eri. All rights reserved.
//

import UIKit
import AVFoundation

class ExerciseTVCell: UITableViewCell
{
    let exerciseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = EXERCISE_IMAGE_VIEW_BG_COLOR
        imageView.layer.cornerRadius = EXERCISE_IMAGE_VIEW_CORNER_RADIUS
        imageView.image = UIImage(named: EXERCISE_IMAGE_VIEW_IMAGE_NAME)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let exerciseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: EXERCISE_LABEL_FONT_NAME, size: EXERCISE_LABEL_FONT_SIZE)
        label.textColor = EXERCISE_LABEL_TEXT_COLOR
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let levelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: LEVEL_LABEL_FONT_NAME, size: LEVEL_LABEL_FONT_SIZE)
        label.textColor = LEVEL_LABEL_TEXT_COLOR
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let progressBarView = CustomProgressBarView()
    
    let progressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: PROGRESS_LABEL_FONT_NAME, size: PROGRESS_LABEL_FONT_SIZE)
        label.textColor = PROGRESS_LABEL_TEXT_COLOR
        label.text = "50%"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = EXERCISE_TV_CELL_BG_COLOR
        self.layer.cornerRadius = EXERCISE_TV_CELL_CORNER_RADIUS
        addSubviews()
        setupUIComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        self.addSubview(exerciseImageView)
        exerciseImageView.addSubview(exerciseLabel)
        exerciseImageView.addSubview(levelLabel)
        exerciseImageView.addSubview(progressBarView)
        exerciseImageView.addSubview(progressLabel)
    }
    
    func setupUIComponents() {
        setupExerciseImageView()
        setupExerciseLabel()
        setupLevelLabel()
        setupProgressBarView()
        setupProgressLabel()
    }
    
    func setupExerciseImageView() {
        exerciseImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        exerciseImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        exerciseImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        exerciseImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
    }
    
    func setupExerciseLabel() {
        exerciseLabel.topAnchor.constraint(equalTo: self.exerciseImageView.topAnchor, constant: 20).isActive = true
        exerciseLabel.leftAnchor.constraint(equalTo: self.exerciseImageView.leftAnchor, constant: 10).isActive = true
    }
    
    func setupLevelLabel() {
        levelLabel.topAnchor.constraint(equalTo: self.exerciseLabel.bottomAnchor, constant: 5).isActive = true
        levelLabel.leftAnchor.constraint(equalTo: self.exerciseImageView.leftAnchor, constant: 10).isActive = true
    }
    
    func setupProgressBarView() {
        progressBarView.bottomAnchor.constraint(equalTo: self.exerciseImageView.bottomAnchor, constant: -5).isActive = true
        progressBarView.rightAnchor.constraint(equalTo: self.exerciseImageView.rightAnchor, constant: -5).isActive = true
        progressBarView.widthAnchor.constraint(equalTo: self.exerciseImageView.widthAnchor, multiplier: 0.50).isActive = true
        progressBarView.heightAnchor.constraint(equalTo: self.exerciseImageView.heightAnchor, multiplier: 0.30).isActive = true
    }
    
    func setupProgressLabel() {
        progressLabel.centerYAnchor.constraint(equalTo: self.progressBarView.centerYAnchor).isActive = true
        progressLabel.rightAnchor.constraint(equalTo: self.progressBarView.leftAnchor).isActive = true
    }
}

