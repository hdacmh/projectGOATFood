//
//  MainViewModel.swift
//  GOATFood
//
//  Created by Hồ Đắc Minh Hoàng on 26/9/24.
//

import SwiftUI

class MainViewModel: ObservableObject {
    static var shared: MainViewModel = MainViewModel()
    
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    init() {
        
        #if DEBUG
        txtEmail = "test@gmail.com"
        txtPassword = "123456"
        #endif
    }
    
    //MARK: ServiceCall
    
    func serviceCallLogin () {
        
        /*if(txtEmail.isEmpty) {
            self.errorMessage = "Địa chỉ email không hợp lệ. Xin hãy nhập lại địa chỉ email"
            self.showError = true
            return
        }*/
        
        if(txtEmail.isValidEmail) {
            self.errorMessage = "Địa chỉ email không hợp lệ. Xin hãy nhập lại địa chỉ email"
            self.showError = true
            return
        }
        
        if(txtPassword.isEmpty) {
            self.errorMessage = "Mật khẩu không hợp lệ. Xin hãy nhập lại mật khẩu"
            self.showError = true
            return
        }
        
        ServiceCall.post(parameter: ["email": txtEmail, "password": txtPassword, "dervice_token":""], path: Globs.SV_LOGIN) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    //print(response);
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Success"
                    self.showError = true
                } else {
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
}
