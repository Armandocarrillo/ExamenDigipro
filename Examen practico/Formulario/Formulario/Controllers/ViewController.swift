//
//  ViewController.swift
//  Formulario
//
//  Created by Armando Carrillo on 29/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var apellidoPaternoTextField: UITextField!
    @IBOutlet weak var apellidoMaternoTextField: UITextField!
    @IBOutlet weak var correoElectronicoTextField: UITextField!
    @IBOutlet weak var telefonoTextField: UITextField!
    @IBOutlet weak var terminarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.telefonoTextField.delegate = self
        //self.nombreTextField.delegate = self
        
        
    }

    @IBAction func terminarTapButton(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {
            self.terminarButton.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.terminarButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
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





