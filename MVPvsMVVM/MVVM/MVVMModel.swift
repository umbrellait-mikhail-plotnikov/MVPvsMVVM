//
//  Model.swift
//  MVPvsMVVM
//
//  Created by Plotnikov Mikhail on 13.06.2022.
//

import Foundation

struct MVVMModel {
    let time: Date
    let text: String

    init(text: String) {
        self.text = text
        self.time = Date()
    }
}
