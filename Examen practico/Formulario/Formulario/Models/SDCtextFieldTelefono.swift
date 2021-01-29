//
//  SDCtextFieldTelefono.swift
//  BasicApplication
//
//  Created by Armando Carrillo on 15/09/20.
//  Copyright © 2020 Armando Carrillo. All rights reserved.
//

import UIKit

enum ValueTypePhone: Int {
    case none
    case phoneNumber   // Allowed "0123456789"
}

class SDCTextFieldTelefono: UITextField {
    
    @IBInspectable var maxLength: Int = 10 // Max character length
    var valueTypePhone: ValueTypePhone = ValueTypePhone.none // Allowed characters

    /************* Added new feature ***********************/
    // Accept only given character in string, this is case sensitive
    @IBInspectable var allowedCharInString: String = ""

    func verifyFields(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch valueTypePhone {
        case .none:
            break // Do nothing
            
        
            
        case .phoneNumber:
            let phoneNumberSet = CharacterSet(charactersIn: "0123456789")
            if string.rangeOfCharacter(from: phoneNumberSet.inverted) != nil {
                return false
            }
            
        
        }
        
        if let text = self.text, let textRange = Range(range, in: text) {
            let finalText = text.replacingCharacters(in: textRange, with: string)
            if maxLength > 0, maxLength < finalText.utf8.count {
                return false
            }
        }

        // Check supported custom characters
        if !self.allowedCharInString.isEmpty {
            let customSet = CharacterSet(charactersIn: self.allowedCharInString)
            if string.rangeOfCharacter(from: customSet.inverted) != nil {
                return false
            }
        }
        
        return true
    }
}

