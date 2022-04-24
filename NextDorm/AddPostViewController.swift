//
//  AddPostViewController.swift
//  NextDorm
//
//  Created by Anna S on 4/24/22.
//

import UIKit
import AlamofireImage
import Parse

class AddPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionField: UITextField!
    
    
    @IBAction func onSubmitButton(_ sender: Any) {
        let theViewController: UIViewController?
        var post: PFObject?
        if let navController = self.navigationController, navController.viewControllers.count >= 2 {
             theViewController = navController.viewControllers[navController.viewControllers.count - 2]
            if theViewController is LostAndFoundViewController {
                post = PFObject(className: "LostAndFoundPosts")
            }
            else {
                post = PFObject(className: "GeneralPosts")
            }
            post?["description"] = descriptionField.text!
            post?["author"] = PFUser.current()!
            
            let imageData = imageView.image!.pngData()
            let file = PFFileObject(name: "image.png", data: imageData!)
            
            post?["image"] = file
            
            post!.saveInBackground { (success, error) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                    print("saved!")
                } else {
                    print("error")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageAspectScaled(toFill: size)
        
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
