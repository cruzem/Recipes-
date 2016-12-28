//
//  Recipe.swift
//  Recipez
//
//  Created by Emmanuel Cruz on 5/9/16.
//  Copyright © 2016 devPro. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Recipe: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    func setRecipeImage(_ img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getRecipeImg() -> UIImage {
        let img = UIImage(data: self.image! as Data)!
        return img
    }

}
