//
//  GamesTableViewCell.swift
//  CampeosDaCopa
//
//  Created by Rafael Veronez Dias on 01/02/23.
//

import UIKit

class GamesTableViewCell: UITableViewCell {

    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var awayImageView: UIImageView!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var awayLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with game: Game) {
        homeImageView.image = UIImage(named: game.home)
        awayImageView.image = UIImage(named: game.away)
        awayLabel.text = game.away
        homeLabel.text = game.home
        scoreLabel.text = game.score
    }

}
