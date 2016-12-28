//
//  ViewController.swift
//  Recipez
//
//  Created by Emmanuel Cruz on 5/9/16.
//  Copyright © 2016 devPro. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 10.0, *)
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var recipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    @available(iOS 10.0, *)
    func fetchAndSetResults() {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest: NSFetchRequest<Recipe>=  Recipe.fetchRequest() as! NSFetchRequest<Recipe>
        
        do {
            let results = try context.fetch(fetchRequest)
            self.recipes = results
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as? RecipeCell {
            
            let recipe = recipes[(indexPath as NSIndexPath).row]
            cell.configureCell(recipe)
            return cell
        } else {
            return RecipeCell()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    
}


