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
    
    private var tableView = UITableView(frame: .zero, style: .plain)
    private var models = QuotesListModel.QuotesList(quotes: [])
    
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
        setupUI()
        
        interactor.fetchQuotes()
        interactor.showQuotes()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemPink
        
        configureTableView()
    }
    
    private func configureTableView() {
        setTableViewUI()
        setTableViewDelegate()
        setTableViewCell()
    }
    
    private func setTableViewUI() {
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = 120
        tableView.pinLeft(to: view)
        tableView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        tableView.pinRight(to: view)
        tableView.pinBottom(to: view)
    }
    
    private func setTableViewDelegate() {
        tableView.dataSource = self
    }
    
    private func setTableViewCell() {
        tableView.register(QuoteCell.self, forCellReuseIdentifier: QuoteCell.reuseIdentifier)
    }
}

extension MainScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quote = models.quotes[indexPath.row]
        
        if let quoteCell = tableView.dequeueReusableCell(
            withIdentifier: QuoteCell.reuseIdentifier,
            for: indexPath
        ) as? QuoteCell {
            quoteCell.configure(with: quote)
            return quoteCell
        }
        
        return UITableViewCell()
    }
}

extension MainScreenViewController: MainScreenDisplayLogic {
    
    func display(model: Model.QuotesList) {
        models = model
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
