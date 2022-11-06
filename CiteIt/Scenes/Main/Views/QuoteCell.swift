//
//  QuoteCell.swift
//  CiteIt
//
//  Created by Роман Ломтев on 01.11.2022.
//

import UIKit

class QuoteCell: UITableViewCell {
    
    static let reuseIdentifier = "QuoteCell"
    
    private let quoteAuthorLabel = UILabel()
    private let quoteTextLabel = UILabel()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
    }
        
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configure(with quote: QuotesModel.Quote) {
        quoteAuthorLabel.text = quote.author
        quoteTextLabel.text = quote.text
    }
    
    private func setupView() {
        setupAuthorLabel()
        setupTextLabel()
    }
    
    private func setupAuthorLabel() {
        quoteAuthorLabel.text = "Hello"
        quoteAuthorLabel.font = .systemFont(ofSize: 16, weight: .medium)
        quoteAuthorLabel.textColor = .label
        quoteAuthorLabel.numberOfLines = 1
        
        contentView.addSubview(quoteAuthorLabel)
        quoteAuthorLabel.pinHeight(with: quoteAuthorLabel.font.lineHeight)
        quoteAuthorLabel.pinLeading(to: contentView, 12)
        quoteAuthorLabel.pinTop(to: contentView, 12)
        quoteAuthorLabel.pinTrailing(to: contentView, 12)
    }
    
    private func setupTextLabel() {
        quoteTextLabel.text = "World"
        quoteTextLabel.font = .systemFont(ofSize: 14, weight: .regular)
        quoteTextLabel.textColor = .secondaryLabel
        quoteTextLabel.numberOfLines = 0
        
        contentView.addSubview(quoteTextLabel)
        quoteTextLabel.pinLeading(to: contentView, 12)
        quoteTextLabel.pinTop(to: quoteAuthorLabel.bottomAnchor, 12)
        quoteTextLabel.pinTrailing(to: contentView, 12)
        quoteTextLabel.pinBottom(lessThanOrEqualTo: contentView.bottomAnchor, 12)
    }
}
