//
//  ViewController.swift
//  TakingPictures
//
//  Created by Camilla Cidral on 02/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.backgroundColor = .secondarySystemBackground
        
        button.backgroundColor = .systemGreen
        button.setTitle("Take Picture", for: .normal)
        button.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func didTapButton() {
        
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
        
        
    }


}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true)
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        imageView.image = image
    }
}

