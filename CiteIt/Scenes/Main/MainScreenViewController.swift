//
//  MainViewController.swift
//  CiteIt
//
//  Created by Роман Ломтев on 26.10.2022.
//

import SwiftUI

class MainScreenViewController: UIHostingController<MainScreenView> {
    
    // MARK: - Init
    init(view: MainScreenView) {
        super.init(rootView: view)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
