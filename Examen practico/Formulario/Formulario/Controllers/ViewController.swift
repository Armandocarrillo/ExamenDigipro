//
//  ViewController.swift
//  Formulario
//
//  Created by Armando Carrillo on 29/01/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var apellidoPaternoTextField: UITextField!
    @IBOutlet weak var apellidoMaternoTextField: UITextField!
    @IBOutlet weak var correoElectronicoTextField: UITextField!
    @IBOutlet weak var telefonoTextField: UITextField!
    @IBOutlet weak var terminarButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    private let manager = CoreDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.telefonoTextField.delegate = self
        //self.nombreTextField.delegate = self
       
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
                
                          
                view.addGestureRecognizer(tap)
            }
         
            
        

    

    @IBAction func terminarTapButton(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {
            self.terminarButton.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.terminarButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        
        let alert = UIAlertController(title: "Se agrego nuevo elemento", message: " ", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        let nameText: String = nombreTextField.text!
        let lastnamePaternoText: String = apellidoPaternoTextField.text!
        let lastnameMaternoText: String = apellidoMaternoTextField.text!
        let emailText: String = correoElectronicoTextField.text!
        let phoneNumberText : String = telefonoTextField.text!
        
        manager.createUser(name: nameText, lastNamePaterno: lastnamePaternoText ,lastNameMaterno: lastnameMaternoText, email: emailText, phoneNumber: phoneNumberText) { [weak self] in

        
        
        }
        alert.addAction(okAction)
        
        present(alert, animated: true)
        
    }
    
}

extension ViewController: UITextFieldDelegate {

func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
}

func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

    // Verify all the conditions
    if let sdcTextFieldTelefono = textField as? SDCTextFieldTelefono {
        return sdcTextFieldTelefono.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
    } else {
        return false
    }
    
    
    
}
    
    
    
}

extension ViewController{
    
    
    @objc func dismissKeyboard() {
        //Las vistas y toda la jerarquía renuncia a responder, para esconder el teclado
        view.endEditing(true)
    }

    
}









