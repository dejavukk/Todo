//
//  ViewController.swift
//  TodoList
//
//  Created by JunHyuk on 2018. 8. 20..
//  Copyright © 2018년 junhyuk. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["App Development", "learning English", "Diet",
                     "Reading a Book.", "Play the Basketball"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    // * TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    // * TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(itemArray[indexPath.row])
        
        // 리스트의 선택 및 해제 구현부분
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // * 리스트의 새로운 일정 추가하기구현
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "새로운 일정추가", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "추가", style: .default) { (action) in
            
            self.itemArray.append(textField.text!)
            
            self.tableView.reloadData()
            
            //print("Success!")
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "입력하세요!"
            textField = alertTextField
            
            //print(alertTextField.text)
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
}

