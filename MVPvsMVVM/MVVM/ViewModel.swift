//
//  ViewModel.swift
//  MVPvsMVVM
//
//  Created by Plotnikov Mikhail on 13.06.2022.
//

import Foundation

class ViewModel {
    var bindTextLabel: ((_ text: String) -> ())?
    var bindDateLabel: ((_ date: String) -> ())?

    var text = String()

    private var timer = Timer()

    private let dateFormatter: DateFormatter = {
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "HH:mm:ss"

        return dateFormmater
    }()

    private var actualModel: MVVMModel? {
        didSet {
            guard let actualModel = actualModel else { return }

            let newLabelText = "String from ViewModel: \(actualModel.text)"
            let newDate = "Date from ViewModel: \(dateFormatter.string(from: actualModel.time))"

            bindDateLabel?(newDate)
            bindTextLabel?(newLabelText)
        }
    }

    func setActualModel(text: String) {
        actualModel = MVVMModel(text: text)
    }

    func startRefresh() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(refreshUI), userInfo: nil, repeats: true)
    }

    @objc private func refreshUI() {
        actualModel = MVVMModel(text: text)
    }
}
