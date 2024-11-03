//
//  TeenipingModel.swift
//  UMC-iOS-Workbook-Week4
//
//  Created by 엄민서 on 10/30/24.
//

import UIKit

struct TeenipingModel {
    let image: UIImage
    let name: String
}

extension TeenipingModel {
    static func dummy() -> [TeenipingModel] {
        return [
            TeenipingModel(image: .hachuping, name: "하츄핑"),
            TeenipingModel(image: .lalaping, name: "라라핑"),
            TeenipingModel(image: .baroping, name: "바로핑"),
            TeenipingModel(image: .azaping, name: "아자핑"),
            TeenipingModel(image: .chachaping, name: "차차핑"),
            TeenipingModel(image: .haeping, name: "해핑"),
            TeenipingModel(image: .mugoping, name: "무거핑"),
            TeenipingModel(image: .siroping, name: "시러핑")
        ]
    }
        
    
}
