//
//  Presenter.swift
//  MVPvsMVVM
//
//  Created by Plotnikov Mikhail on 13.06.2022.
//

import Foundation

protocol PresenterProtocol {
    init(view: ViewProtocol)
    func updateUI(new textLabel: String)
}

class Presenter: PresenterProtocol {
    private weak var view: ViewProtocol?
    private var actualModel: MVPModel?

    private let dateFormatter: DateFormatter = {
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "HH:mm:ss"

        return dateFormmater
    }()

    required init(view: ViewProtocol) {
        self.view = view

        updateUI(new: "")
    }

    func updateUI(new textLabel: String) {
        actualModel = MVPModel(text: textLabel)

        updateTextLabel(text: actualModel?.text)
        updateDateLabel(date: actualModel?.time)
    }

    private func updateTextLabel(text: String?) {
        guard let text = text else { return }

        let newLabelText = "String from presenter: \(text)"

        view?.setTextLabel(text: newLabelText)
    }

    private func updateDateLabel(date: Date?) {
        guard let date = date else { return }

        let formattedDate = dateFormatter.string(from: date)
        
        view?.setDateLabel(date: "Date from presenter: \(formattedDate)")
    }
}
