//
//  QuotesOfTheDayScreenViewController.swift
//  CiteIt
//
//  Created by Роман Ломтев on 05.11.2022.
//

import UIKit

class QuotesOfTheDayScreenViewController: UIViewController {
    
    // MARK: - Internal vars
    private let interactor: QuotesOfTheDayScreenBusinessLogic
    private let router: QuotesOfTheDayScreenRoutingLogic
    
    // MARK: - Init
    init(interactor: QuotesOfTheDayScreenBusinessLogic, router: QuotesOfTheDayScreenRoutingLogic) {
        self.interactor = interactor
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        interactor.fetchQuotes()
    }
}

extension QuotesOfTheDayScreenViewController: QuotesOfTheDayScreenDisplayLogic {
    
    func display(model: [Model.Quote]) {
        print(model[0])
    }
}
