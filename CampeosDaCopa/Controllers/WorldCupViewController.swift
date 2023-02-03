//
//  WorldCupViewController.swift
//  CampeosDaCopa
//
//  Created by Rafael Veronez Dias on 30/01/23.
//

import UIKit

class WorldCupViewController: UIViewController {
    
    var worldCup: WorldCup?

    @IBOutlet weak var winnerImageView: UIImageView!
    @IBOutlet weak var viceImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var viceLabel: UILabel!
    @IBOutlet weak var matchesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        matchesTableView.delegate = self
        matchesTableView.dataSource = self
        
        let scoreText = "\(worldCup!.winnerScore) x \(worldCup!.viceScore)"
        title = "WorldCup \(worldCup?.year ?? 0000)"
        winnerImageView.image = UIImage(named:worldCup!.winner)
        winnerLabel.text = worldCup?.winner
        viceImageView.image = UIImage(named: worldCup!.vice)
        viceLabel.text = worldCup?.vice
        scoreLabel.text = scoreText
    }
    
}


extension WorldCupViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup?.matches.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = worldCup?.matches[section].games
        
        return games?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
        let match = worldCup?.matches[indexPath.section]
        if let game = match?.games[indexPath.row] {
            cell.prepare(with: game)
        }
        return cell
        
         
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let match = worldCup?.matches[section]
        
        return match?.stage
    }
    
    
    
     
}

extension WorldCupViewController: UITableViewDelegate {
    
}
