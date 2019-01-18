//
//  MyProgramUIConstants.swift
//  TestTabbar
//
//  Created by Eri on 1/16/19.
//  Copyright © 2019 Eri. All rights reserved.
//

import UIKit

/*
view hierarchy for MyProgramVC (bottom to top)

MyProgramVC
    |
    |--- navigationBarTitleLabel
    |
    |--- view
        |
        |--- weekView
            |
            |--- weekDayView
                |
                |--- weekDayLabel
                |--- dayOfTheMonthLabel
        |
        |--- exerciseTableView
            |
            |--- dateTVCell
                |
                |--- textLabel
            |
            |--- exerciseTVCell
                |
                |--- exerciseImageView
                |--- exerciseLabel
                |--- levelLabel
                |--- progressLabel
                |--- progressBarView
*/

// === navigationBarTitleLabel of MyProgramVC === //
let MY_PROGRAM_TITLE_LABEL_FONT_NAME = "Helvetica-Bold"
let MY_PROGRAM_TITLE_LABEL_FONT_SIZE: CGFloat = 14.0

// === subviews of MyProgramVC.view === //

// weekView
let WEEK_VIEW_BG_COLOR = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
let WEEK_VIEW_CORNER_RADIUS: CGFloat = 0.0

// exerciseTableView
let EXERCISE_TV_BG_COLOR = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
let EXERCISE_TV_CORNER_RADIUS: CGFloat = 0.0

// === subviews of weekView === //

// weekDayView
let WEEKDAY_VIEW_BG_COLOR = UIColor.darkGray
let WEEKDAY_VIEW_CORNER_RADIUS: CGFloat = 10.0

// === subviews of weekDayView === //

// weekdayLabel
let WEEKDAY_LABEL_FONT_NAME = "Helvetica"
let WEEKDAY_LABEL_FONT_SIZE: CGFloat = 12.0
let WEEKDAY_LABEL_COLOR = UIColor.white

// dayOfTheMonthLabel
let DAY_OF_THE_MONTH_LABEL_FONT_NAME = "Helvetica"
let DAY_OF_THE_MONTH_LABEL_FONT_SIZE: CGFloat = 12.0
let DAY_OF_THE_MONTH_LABEL_COLOR = UIColor.white

// === subviews of exerciseTableView === //

// dateTVCell
let DATE_TV_CELL_BG_COLOR = UIColor.white
let DATE_TV_CELL_CORNER_RADIUS: CGFloat = 0.0

// exerciseTVCell
let EXERCISE_TV_CELL_BG_COLOR = UIColor.white
let EXERCISE_TV_CELL_CORNER_RADIUS: CGFloat = 0.0

// === subviews of dateTVCell === //

// textLabel
let DATE_TV_CELL_TEXT_LABEL_FONT_NAME = "Helvetica-Bold"
let DATE_TV_CELL_TEXT_LABEL_FONT_SIZE: CGFloat = 14.0
let DATE_TV_CELL_TEXT_LABEL_COLOR = UIColor.black

// === subviews of exerciseTVCell === //

// exerciseImageView
let EXERCISE_IMAGE_VIEW_IMAGE_NAME = ""
let EXERCISE_IMAGE_VIEW_BG_COLOR = UIColor.black
let EXERCISE_IMAGE_VIEW_CORNER_RADIUS: CGFloat = 10.0

// exerciseLabel
let EXERCISE_LABEL_FONT_NAME = "AvenirNext-Bold"
let EXERCISE_LABEL_FONT_SIZE: CGFloat = 14.0
let EXERCISE_LABEL_TEXT_COLOR = UIColor.white

// levelLabel
let LEVEL_LABEL_FONT_NAME = "AvenirNext-Bold"
let LEVEL_LABEL_FONT_SIZE: CGFloat = 14.0
let LEVEL_LABEL_TEXT_COLOR = UIColor.white

// progressLabel
let PROGRESS_LABEL_FONT_NAME = "AvenirNext-Bold"
let PROGRESS_LABEL_FONT_SIZE: CGFloat = 18.0
let PROGRESS_LABEL_TEXT_COLOR = UIColor.white

// progressBarView
let PROGRESS_BAR_VIEW_PROGRESS_COLOR = UIColor.orange
let PROGRESS_BAR_VIEW_PROGRESS_TRACK_COLOR = UIColor.white
