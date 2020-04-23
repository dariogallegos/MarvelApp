//
//  DetailViewController.swift
//  comicApp
//
//  Created by Dario on 22/04/2020.
//  Copyright © 2020 Dario. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var pictureDetail: UIImageView!
    @IBOutlet weak var detailBox: UIView!
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var descriptionDetail: UILabel!
    
    var character:Character?
    var characterBaseData: CharacterBaseData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        fetchDataDetail()
    }
    
    func setUp() {
        
        self.prepareNavBar()
        self.preparePicture()
        self.prapareNameDetail()
        self.prepareDetailBoxView()
        self.prepareDescriptionDetail()


        if let name = self.character?.name {
            nameDetail.text = name
        }
        if let description = self.character?.description, description != "" {
            descriptionDetail.text = description
        }
        
        if let path = self.character?.thumbnail?.path,
            let ext = self.character?.thumbnail?.fileExtension {
           
            let url =  path + "." + ext
            pictureDetail.sd_setImage(with: URL(string: url), placeholderImage: nil, options: .fromLoaderOnly , context: nil)
        }
    }

    func setData(character: Character?) {
        self.character = character
    }
    
    private func fetchDataDetail() {
        if let identifier = character?.id {

            let request = RequestHandler().getCharacterDetail(id: identifier)
               
            JSONDecoder().decoderWithRequest(CharacterBaseData.self, fromURLRequest: request) { (result, error) in
                if ( error == nil) {
                    debugPrint("We have data character detail")
                       
                    self.characterBaseData = result
                    DispatchQueue.main.async {
                        if let item = self.characterBaseData?.apiDataSource?.characters {
                            debugPrint("Character Details:")
                            debugPrint(item)
                        }
                        
                    }
                }
            }
        }
    }
    
    private func prepareDescriptionDetail() {
        
        descriptionDetail.text = defaultDescription
        descriptionDetail.textColor = .white
    }
    
    private func prapareNameDetail() {
        
        let customFont = UIFont(name: fontFamilyHero, size: fontSizeNameCell)
        nameDetail.font = customFont;
        nameDetail.textColor = .white
    }
    
    private func prepareDetailBoxView() {
        detailBox.applyGradient()
    }
    
    private func preparePicture() {
         pictureDetail.contentMode = .scaleToFill
    }
    
    private func prepareNavBar(){
        self.navigationController?.applyStyling(titleNavigationBar: "Character detail", controller: self, showButton: true)
    }

}
