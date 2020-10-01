//
//  SignUpController.swift
//  Instagram
//
//  Created by Long Nguyễn on 10/1/20.
//

import UIKit

class SignUpController: UIViewController {
    
    let TAG = "SIGN UP: "
    
    // MARK: - Components
    let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.addTarget(self, action: #selector(handlePlusPhoto), for: .touchUpInside)
        
        return button
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = .systemFont(ofSize: 14)
        
        return tf
    }()
    
    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "User name"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = .systemFont(ofSize: 14)
        
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = .systemFont(ofSize: 14)
        
        return tf
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.644659102, green: 0.8389277458, blue: 0.9662960172, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.isEnabled = false
        button.layer.cornerRadius  = 5
        
        return button
    }()
    
    let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedText = NSMutableAttributedString(string: "Already have an account? ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        attributedText.append(NSMutableAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.06666666667, green: 0.6039215686, blue: 0.9294117647, alpha: 1)]))
    
        button.setAttributedTitle(attributedText, for: .normal)
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Handle
    
    @objc func handleShowLogin() {
        let vc = LoginController()
        
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
    }
    
    @objc func handlePlusPhoto() {
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    fileprivate func setUpUI() {
        view.backgroundColor = .white
        
        // Add Photo
        view.addSubview(plusPhotoButton)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, centerX: view.centerXAnchor, width: plusPhotoButton.heightAnchor, topConstant: 20, heightConstant: 140)
        
        // input View
        let stackView = UIStackView(arrangedSubviews: [
            emailTextField, usernameTextField, passwordTextField, signUpButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.anchor(top: plusPhotoButton.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, topConstant: 20, leadingConstant: 40, trailingConstant: 40, heightConstant: 200)
        
        // Sign in
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, centerX: view.centerXAnchor, bottomConstant: 0)
    }
    
    
}


// MARK: - UIImagePickerControllerDeleagete
extension SignUpController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
          plusPhotoButton.setImage(editedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
          plusPhotoButton.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width * 0.5
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.layer.borderColor = #colorLiteral(red: 0.644659102, green: 0.8389277458, blue: 0.9662960172, alpha: 1).cgColor
        plusPhotoButton.layer.borderWidth = 2
        
        dismiss(animated: true, completion: nil)
        
    }
}
