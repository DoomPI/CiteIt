//
//  StartScreenViewController.swift
//  CiteIt
//
//  Created by Роман Ломтев on 06.11.2022.
//

import SwiftUI

class StartScreenViewController: UIHostingController<StartScreenView> {
    
    // MARK: - Internal vars
    private let interactor: StartScreenBusinessLogic
    private let router: StartScreenRoutingLogic
    
    // MARK: - Init
    init(observable: StartScreenObservable, interactor: StartScreenBusinessLogic, router: StartScreenRoutingLogic) {
        self.interactor = interactor
        self.router = router
        
        let view = StartScreenView(
            navigationButtonPressed: router.navigateToMainScreen,
            observedObject: observable
        )
        
        super.init(rootView: view)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
       interactor.fetchRandomQuote()
    }
}

extension StartScreenViewController: StartScreenDisplayLogic {
    
    func display(viewModel: Model.GetRandomQuote.ViewModel) {
        rootView.showQuote(quoteViewModel: viewModel)
    }
    
    func display() {
        rootView.showQuote(quoteViewModel: Model.GetRandomQuote.ViewModel(
            quote: Model.Quote(
                text: "Oooopsss",
                author: ""
            )
        ))
    }
}
