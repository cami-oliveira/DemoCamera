//
//  ViewController.swift
//  DemoCamera
//
//  Created by Camilla Cidral on 02/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var newImageButton: UIButton!
    
    @IBOutlet weak var newImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didPressNewButton(_ sender: Any) {
        
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        print(vc)
        present(vc, animated: true)
    }
    
}

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(picker)
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
           print("No image found")
           return
        }
        
        print(image)
        
        self.newImage.image = image
    }
}
