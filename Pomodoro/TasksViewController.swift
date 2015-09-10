//
//  TasksViewController.swift
//  Pomodoro
//
//  Created by Fan Qi on 9/6/15.
//  Copyright (c) 2015 f_qi. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var todo = [TasksList]()
    var done = [TasksList]()
    
    @IBOutlet weak var taskViewSegmentedControlOutlet: UISegmentedControl!
    @IBOutlet weak var taskViewTableView: UITableView!
    
    @IBAction func taskViewSegmentedControlAction(sender: AnyObject) {
        taskViewTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        let backgroundRed: CGFloat = 135 / 255
        let backgroundGreen: CGFloat = 211 / 255
        let backgroundBlue: CGFloat = 124 / 255
        taskViewTableView.backgroundColor = UIColor(red: backgroundRed, green: backgroundGreen, blue: backgroundBlue, alpha: 1.0)
        self.view.backgroundColor = UIColor(red: backgroundRed, green: backgroundGreen, blue: backgroundBlue, alpha: 1.0)
        
        todo.append(TasksList(content: "feed the cat"))
        todo.append(TasksList(content: "buy eggs"))
        todo.append(TasksList(content: "watch WWDC videos"))
        todo.append(TasksList(content: "rule the Web"))
        todo.append(TasksList(content: "buy a new iPhone"))
        todo.append(TasksList(content: "darn holes in socks"))
        todo.append(TasksList(content: "write this tutorial"))
        todo.append(TasksList(content: "master Swift"))
        todo.append(TasksList(content: "learn to draw"))
        done.append(TasksList(content: "get more exercise"))
        done.append(TasksList(content: "catch up with Mom"))
        done.append(TasksList(content: "get a hair cut"))
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var returnValue = 0
        
        switch taskViewSegmentedControlOutlet.selectedSegmentIndex {
        case 0:
            return todo.count
        case 1:
            return done.count
        default:
            break
        }
        
        return returnValue
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let taskCell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! UITableViewCell
        
        let backgroundRed: CGFloat = 135 / 255
        let backgroundGreen: CGFloat = 211 / 255
        let backgroundBlue: CGFloat = 124 / 255
        taskCell.backgroundColor = UIColor(red: backgroundRed, green: backgroundGreen, blue: backgroundBlue, alpha: 1.0)

        switch taskViewSegmentedControlOutlet.selectedSegmentIndex {
        case 0:
            taskCell.textLabel!.text = todo[indexPath.row].content
        case 1:
            taskCell.textLabel!.text = done[indexPath.row].content
        default:
            break
        }
        
        return taskCell
    }
}
