//
//  LoginViewModel.swift
//  DDTTest
//
//  Created by Denny Arfansyah on 11/01/23.
//

import UIKit
import Combine

class LoginViewModel {
    let names = [ Names.doel.rawValue, Names.mandra.rawValue, Names.zaenab.rawValue ]
    private var subscriptions = Set<AnyCancellable>()
    @Published var name = CommonString.emptyString
    @Published var isSuccessLogin = false
    
    func randomName() {
        name = names.randomElement() ?? Names.doel.rawValue
    }
    
    func login() {
        isSuccessLogin = true
    }
}
