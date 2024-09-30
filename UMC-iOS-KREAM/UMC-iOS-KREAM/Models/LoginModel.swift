//
//  LoginModel.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 9/25/24.
//

import Foundation

struct LoginModel {
    var id: String
    var pwd: String
    
    init(id: String = "", pwd: String = "") {
        self.id = id
        self.pwd = pwd
    }
}
