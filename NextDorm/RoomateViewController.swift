//
//  RoomateViewController.swift
//  NextDorm
//
//  Created by Anna S on 4/18/22.
//

import UIKit
import DropDown
import AlamofireImage
import Parse

class RoomateViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let dropDown = DropDown()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
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
    
    

    @IBAction func tapChooseMenuItem(_ sender: Any) {
        dropDown.dataSource = ["Residence Halls", "Strawberry Apartments", "Vineyard or Pinnacles", "Promontory", "East Campus"]//4
        dropDown.anchorView = sender as! AnchorView
        dropDown.bottomOffset = CGPoint(x: 0, y: (sender as AnyObject).frame.size.height)
        dropDown.show()
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
            (sender as AnyObject).setTitle(item, for: .normal)
        }
    }
    
    @IBOutlet weak var descriptionField: UITextView!
    
    @IBAction func onSubmitButton(_ sender: Any) {
        let post = PFObject(className: "Profile")
        post["location"] = dropDown.selectedItem
        post["description"] = descriptionField.text!
        post["author"] = PFUser.current()!
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        
        post["image"] = file
        
        post.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            } else {
                print("error")
            }
        }
        
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
