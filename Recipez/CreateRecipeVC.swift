//
//  CreateRecipeVC.swift
//  Recipez
//
//  Created by Emmanuel Cruz on 5/9/16.
//  Copyright © 2016 devPro. All rights reserved.
//

import UIKit
import CoreData

class CreateRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngredients: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var addRecipeBtn: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        recipeImg.layer.cornerRadius = 4.0
        recipeImg.clipsToBounds = true
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismiss(animated: true, completion: nil)
        recipeImg.image = image
    }
    
    @IBAction func addImage(_ sender: AnyObject!) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createRecipe(_ sender: AnyObject!) {
        if let title = recipeTitle.text , title != "" {
            
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: context)!
            let recipe = Recipe(entity: entity, insertInto: context)
            recipe.title = title
            recipe.ingredients = recipeIngredients.text
            recipe.steps = recipeSteps.text
            recipe.setRecipeImage(recipeImg.image!)
            
            context.insert(recipe)
            
            do {
                try context.save()
            } catch {
                print("Could not save recipe")
            }
            
             _ = self.navigationController?.popViewController(animated: true)
        }
       
    }
    
}
