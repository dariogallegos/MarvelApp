//
//  HeroViewCell.swift
//  comicApp
//
//  Created by Dario on 21/04/2020.
//  Copyright © 2020 Dario. All rights reserved.
//

import UIKit
import SDWebImage

class HeroViewCell: UITableViewCell {

    
    @IBOutlet weak var heroView: UIView!
    @IBOutlet weak var heroPicture: UIImageView!
    @IBOutlet weak var heroTitleBox: UIView!
    @IBOutlet weak var heroNameTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUp();
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp() {
        heroView.layer.cornerRadius = 16;
        heroView.layer.masksToBounds = true;
        
        heroPicture.contentMode = .scaleToFill
        
        heroTitleBox.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        let customFont = UIFont(name: fontFamilyHero, size: fontSizeNameCell)
        heroNameTitle.font = customFont;
    }
    
    func setData(character:Character?) {
        heroNameTitle.text = character?.name
        
        guard let path = character?.thumbnail?.path, let fileExtension = character?.thumbnail?.fileExtension else {
            return
        }
        let url = path + "." + fileExtension
        
        heroPicture.sd_setImage(with: URL(string: url), placeholderImage: nil, options: .fromLoaderOnly, context: nil)

    }
}
