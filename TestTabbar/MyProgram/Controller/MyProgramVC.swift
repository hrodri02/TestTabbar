//
//  FirstVC.swift
//  TestTabbar
//
//  Created by Eri on 1/15/19.
//  Copyright © 2019 Eri. All rights reserved.
//

import UIKit

class MyProgramVC: UIViewController {
    let weekView: WeekView = {
        let view = WeekView()
        view.backgroundColor = WEEK_VIEW_BG_COLOR
        view.layer.cornerRadius = WEEK_VIEW_CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let exerciseTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = EXERCISE_TV_BG_COLOR
        tableView.layer.cornerRadius = EXERCISE_TV_CORNER_RADIUS
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "My Program"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: MY_PROGRAM_TITLE_LABEL_FONT_NAME, size: MY_PROGRAM_TITLE_LABEL_FONT_SIZE)!]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "add_button"), style: .plain, target: self, action: #selector(addButtonClicked))
        
        exerciseTableView.delegate = self
        exerciseTableView.dataSource = self
        exerciseTableView.register(ExerciseTVCell.self, forCellReuseIdentifier: "exerciseTVCell")
        
        addSubviews()
        setupUIComponents()
        print("screen width: \(screenWidth), screen height: \(screenHeight)")
    }
    
    func addSubviews() {
        self.view.addSubview(weekView)
        self.view.addSubview(exerciseTableView)
    }
    
    func setupUIComponents() {
        setupWeekView()
        setupExerciseTVC()
    }
    
    func setupWeekView() {
        weekView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        weekView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        weekView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        weekView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06).isActive = true
    }
    
    func setupExerciseTVC() {
        exerciseTableView.topAnchor.constraint(equalTo: weekView.bottomAnchor).isActive = true
        exerciseTableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        exerciseTableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        exerciseTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    @objc func addButtonClicked() {
        print("add button pressed")
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        exerciseTableView.reloadData()
    }
}

extension MyProgramVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        if (index == 0) {
            let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
            cell.backgroundColor = DATE_TV_CELL_BG_COLOR
            cell.layer.cornerRadius = DATE_TV_CELL_CORNER_RADIUS
            cell.textLabel?.font = UIFont(name: DATE_TV_CELL_TEXT_LABEL_FONT_NAME,
                                          size: DATE_TV_CELL_TEXT_LABEL_FONT_SIZE)
            cell.textLabel?.textColor = DATE_TV_CELL_TEXT_LABEL_COLOR
            cell.textLabel?.text = Date().getDateStr()
            return cell
        }
        
        let cell = ExerciseTVCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "exerciseTVCell")
        cell.exerciseLabel.text = "Soccer Flexibility"
        cell.levelLabel.text = "Begineer"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = indexPath.row
        if (index == 0) {return screenHeight * 0.06}
        return screenHeight / 5.0
    }
}
