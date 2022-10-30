//
//  MainViewController.swift
//  CiteIt
//
//  Created by Роман Ломтев on 26.10.2022.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    // MARK: - Internal vars
    private let interactor: MainScreenBusinessLogic
    private let router: MainScreenRoutingLogic
    
    // MARK: - Init
    init(interactor: MainScreenBusinessLogic, router: MainScreenRoutingLogic) {
        self.interactor = interactor
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .systemPink
        
        interactor.fetchQuotes()
        interactor.showQuotes()
    }
}

extension MainScreenViewController: MainScreenDisplayLogic {
    
    func display(model: Model.QuotesList) {
        print(model.quotes)
    }
}
