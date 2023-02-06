//
//  ViewController.swift
//  IntroduceAli
//
//  Created by Ali Muhammad on 1/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var favoriteColorTextField: UITextField!
    
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    @IBAction func introduceSelfDidTapButton(_ sender: UIButton) {
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I attend \(schoolNameTextField.text!).  I am currently in my \(year!) year and I own \(numberOfPetsLabel.text!) pets.  It is \(morePetsSwitch.isOn) that I want more pets.  I love the color \(favoriteColorTextField.text!)."
        
        //let text = favoriteColorTextField.text
        

        self.view.backgroundColor = UIColor.orange
        
        UserDefaults.standard.setValue(firstNameTextField.text, forKey: "first")
        UserDefaults.standard.setValue(lastNameTextField.text, forKey: "last")
        UserDefaults.standard.setValue(schoolNameTextField.text, forKey: "school")
        UserDefaults.standard.setValue(favoriteColorTextField.text, forKey: "color")
        
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
        
        print(introduction)
    }
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text="\(Int(sender.value))"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstNameTextField.text = UserDefaults.standard.string(forKey: "first")
        lastNameTextField.text = UserDefaults.standard.string(forKey: "last")
        schoolNameTextField.text = UserDefaults.standard.string(forKey: "school")
        favoriteColorTextField.text = UserDefaults.standard.string(forKey: "color")
    }


}

