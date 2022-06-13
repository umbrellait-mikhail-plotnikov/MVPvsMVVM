//
//  MVPViewController.swift
//  MVPvsMVVM
//
//  Created by Plotnikov Mikhail on 13.06.2022.
//

import UIKit

protocol ViewProtocol: AnyObject {
    func setTextLabel(text: String)
    func setDateLabel(date: String)
}

class MVPViewController: UIViewController, ViewProtocol {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    private var presenter: PresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = Presenter(view: self)
    }

    func setTextLabel(text: String) {
        label.text = text
    }

    func setDateLabel(date: String) {
        dateLabel.text = date
    }

    @IBAction func buttonTap(_ sender: Any) {
        guard let text = textField.text else { return }

        presenter?.updateUI(new: text)
    }
}

