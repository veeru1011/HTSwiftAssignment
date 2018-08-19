//
//  MovieViewCell.swift
//  HealthTapAssignment
//
//  Created by VEER BAHADUR TIWARI on 18/08/18.
//  Copyright © 2018 healthTap. All rights reserved.
//

import UIKit
import SDWebImage

class MovieViewCell: UITableViewCell {
    
    @IBOutlet weak var displayTitleLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var publicationDateLabel: UILabel!
    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var summaryShortLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        
    }
    
    var movie: Movie? {
        didSet {
            guard let movieModel = movie else { return }
            
            if let displayTitle = movieModel.displayTitle {
                 self.displayTitleLabel.text = displayTitle
            }
            if let headline = movieModel.headline {
                self.headlineLabel.text = headline
            }
            if let publicationDate = movieModel.publicationDate {
                self.publicationDateLabel.text = publicationDate
            }
            if let summaryShort = movieModel.summaryShort {
                self.summaryShortLabel.text = summaryShort
            }
            else{
            self.summaryShortLabel.text = " "
            }
        
            if let imageUrl = movieModel.multimedia?.source {
                self.mediaImageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named:"placeHolder.png"))
            }
            
        }
    }
    
}
