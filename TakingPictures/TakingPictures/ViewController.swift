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
    @IBOutlet weak var newPictureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.backgroundColor = .secondarySystemBackground
        
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 2
        button.setTitle("Take Picture", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        newPictureButton.backgroundColor = .systemBlue
        newPictureButton.layer.cornerRadius = 7
        newPictureButton.layer.borderWidth = 2
        newPictureButton.setTitle("Choose a Picture", for: .normal)
        newPictureButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func didTapButton() {
        
        openPicker(type: .camera)
    }
    
    
    @IBAction func tapNewPicButton(_ sender: Any) {
        
        openPicker(type: .photoLibrary)
    }
    
    func openPicker(type: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.sourceType = type
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

