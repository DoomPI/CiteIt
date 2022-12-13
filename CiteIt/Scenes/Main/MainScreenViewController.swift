//
//  MainViewController.swift
//  CiteIt
//
//  Created by Роман Ломтев on 26.10.2022.
//

import SwiftUI

class MainScreenViewController: UIHostingController<MainScreenView> {
    
    // MARK: - Internal vars
    private let interactor: MainScreenBusinessLogic
    private let router: MainScreenRoutingLogic
    
    // MARK: - Init
    init(view: MainScreenView, interactor: MainScreenBusinessLogic, router: MainScreenRoutingLogic) {
        self.interactor = interactor
        self.router = router
        
        super.init(rootView: view)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        interactor.fetchQuotes()
    }
}


extension MainScreenViewController: MainScreenDisplayLogic {
    
    func display(model: Model.GetQuotesList.ViewModel) {
        rootView.showQuotesList(quoteViewModel: model)
    }
}
