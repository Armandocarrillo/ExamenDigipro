//
//  ViewController.swift
//  Formulario
//
//  Created by Armando Carrillo on 29/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NombreTextField: UITextField!
    @IBOutlet weak var apellidoPaternoTextField: UITextField!
    @IBOutlet weak var apellidoMaternoTextField: UITextField!
    @IBOutlet weak var correoElectronicoTextField: UITextField!
    @IBOutlet weak var TelefonoTextField: UITextField!
    @IBOutlet weak var terminarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func terminarTapButton(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {
            self.terminarButton.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.terminarButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
    
}

