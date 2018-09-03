//
//  CategoryViewController.swift
//  TodoList
//
//  Created by JunHyuk on 2018. 9. 2..
//  Copyright © 2018년 junhyuk. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // * TableView Datasource Methods.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
        
    }
    
    // * TableView Delegate Methods.
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
        
    }
    
    // * 목록 데이터 구현 Methods.
    func saveCategories() {
        
        do {
        try context.save()
        } catch {
            print("Error saving category. \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories() {
        
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error loading categories. \(error)")
        }
        
        tableView.reloadData()
    }
    
    // * 새로운 카테고리 추가 메소드 구현.
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "새로운 목록 추가", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            
            self.categories.append(newCategory)
            
            self.saveCategories()
            
        }
        
        alert.addAction(action)
        
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "새로운 목록 추가"
        }
        
        present(alert, animated: true, completion: nil)
        
    }
}
