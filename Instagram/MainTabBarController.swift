//
//  MainTabBarController.swift
//  Instagram
//
//  Created by Long Nguyễn on 10/2/20.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let navController = UINavigationController(rootViewController: SignUpController())
                self.present(navController, animated: false, completion: nil)
            }
            return
        }
        print("Current User: \(Auth.auth().currentUser?.uid ?? "")")
        setUpViewController()
    }
    
    func setUpViewController() {
        view.backgroundColor = .white
        
        tabBar.tintColor = .black
        
        let homeViewController = createNewController(for: UIViewController(), selectedImage: #imageLiteral(resourceName: "home_selected"), unselectedImage: #imageLiteral(resourceName: "home_unselected"))
        let searchViewController = createNewController(for: UIViewController(), selectedImage: #imageLiteral(resourceName: "search_selected"), unselectedImage: #imageLiteral(resourceName: "search_unselected"))
        let plusViewController = createNewController(for: UIViewController(), selectedImage: #imageLiteral(resourceName: "plus_unselected"), unselectedImage: #imageLiteral(resourceName: "plus_unselected"))
        let likeViewController = createNewController(for: UIViewController(), selectedImage: #imageLiteral(resourceName: "like_selected"), unselectedImage: #imageLiteral(resourceName: "like_unselected"))
        let userProfileViewController = createNewController(for: UIViewController(), selectedImage: #imageLiteral(resourceName: "profile_selected"), unselectedImage: #imageLiteral(resourceName: "profile_unselected"))
        
        viewControllers = [
            homeViewController,
            searchViewController,
            plusViewController,
            likeViewController,
            userProfileViewController
        ]
    }
    
    func createNewController(for viewController: UIViewController, selectedImage: UIImage, unselectedImage: UIImage) -> UIViewController {
        
        let vc = UIViewController()
        vc.tabBarItem.image = unselectedImage
        vc.tabBarItem.selectedImage = selectedImage
        return vc
    }
    
    
}
