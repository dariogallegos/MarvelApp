//
//  ViewController.swift
//  comicApp
//
//  Created by Dario on 20/04/2020.
//  Copyright © 2020 Dario. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "heroCell"
    
    var characterBaseData: CharacterBaseData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    
    func setUp() {
        
        prepareNavBar()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        let nib = UINib(nibName: "HeroViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        
        fetchData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterBaseData?.apiDataSource?.characters?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let heroCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HeroViewCell
        
        heroCell.setData(character: self.characterBaseData?.apiDataSource?.characters?[indexPath.row])
        
        return heroCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let detailVC = DetailViewController()
        
        let character = self.characterBaseData?.apiDataSource?.characters?[indexPath.row]
        detailVC.setData(character: character)
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400;
    }
    
    
    func fetchData() {
        let request = RequestHandler().getCharacters()
        
        JSONDecoder().decoderWithRequest(CharacterBaseData.self, fromURLRequest: request) { (result, error) in
            if ( error == nil) {
                debugPrint("We have data character")
                
                self.characterBaseData = result
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    private func prepareNavBar() {
        self.navigationController?.applyStyling(titleNavigationBar: "Comic Characters", controller: self, showButton: false)
    }

}

