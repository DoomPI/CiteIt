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
    init(view: StartScreenView, interactor: StartScreenBusinessLogic, router: StartScreenRoutingLogic) {
        self.interactor = interactor
        self.router = router
        
        super.init(rootView: view)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupUI()
        
        interactor.fetchRandomQuote()
    }
    
    private func setupUI() {
        view.backgroundColor = .purple
        
        setupQuoteLabel()
    }
    
    private func setupQuoteLabel() {
        /*quoteLabel.font = UIFont(name: "sans-serif", size: 20)
        quoteLabel.textColor = .white
        quoteLabel.textAlignment = .center
        quoteLabel.numberOfLines = 0
        
        view.addSubview(quoteLabel)
        quoteLabel.pinTop(to: view)
        quoteLabel.pinBottom(to: view)
        quoteLabel.pinLeading(to: view, 16)
        quoteLabel.pinTrailing(to: view, 16)*/
    }
}

extension StartScreenViewController: StartScreenDisplayLogic {
    
    func display(viewModel: Model.RandomQuote.ViewModel) {
        rootView.showQuote(quote: viewModel.quote.text)
    }
    
    func display() {
        rootView.showQuote(quote: "Oooopss")
    }
}
