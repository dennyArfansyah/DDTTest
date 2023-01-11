//
//  LoginConstant.swift
//  DDTTest
//
//  Created by Denny Arfansyah on 11/01/23.
//

import UIKit

typealias Assets = LoginConstant.Assets
typealias Names = LoginConstant.Name
typealias GenerateLogoutButtonTitle = LoginConstant.GenerateLogoutButtonTitle

struct LoginConstant {
    static let greeting = "Selamat datang,"
    static let loginNotes = "Login kembali untuk menikmati kemudahan bertransaksi melalui aplikasi NOBU"
    static let login = "Login"
    
    enum Assets: String {
        case login = "login"
        case successLogin = "success-login"
        
        var localImage: UIImage {
            UIImage(named: self.rawValue)!.withRenderingMode(.alwaysOriginal)
        }
    }
    
    enum GenerateLogoutButtonTitle: String {
        case generateName = "Name Generate"
        case logout = "Logout"
    }
    
    enum Name: String {
        case doel = "Doel"
        case mandra = "Mandra"
        case zaenab = "Zaenab"
    }
}
