//
//  LoginViewViewModel.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import Foundation

class LoginVIewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func login() {}
    
    func validate() {}
}
