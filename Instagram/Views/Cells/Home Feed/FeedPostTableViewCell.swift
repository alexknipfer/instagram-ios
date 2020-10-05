//
//  FeedPostTableViewCell.swift
//  Instagram
//
//  Created by Alexander Knipfer on 10/4/20.
//

import UIKit

final class FeedPostTableViewCell: UITableViewCell {
    static let identifier = "FeedPostTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        // configure the cell
    }
}
