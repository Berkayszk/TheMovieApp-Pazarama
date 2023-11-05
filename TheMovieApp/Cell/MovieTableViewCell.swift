//
//  MovieTableViewCell.swift
//  TheMovieApp
//
//  Created by Berkay Sazak on 5.11.2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    let mainImageView : UIImageView = {
         let imageView = UIImageView()
         imageView.contentMode = .scaleAspectFit
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.layer.cornerRadius = 15
         imageView.layer.masksToBounds = true
         imageView.layer.borderWidth = 0
         imageView.layer.borderColor = UIColor.black.cgColor
         return imageView
    }()
         
    let nameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Test Text"
        nameLabel.textColor = .black
        nameLabel.font = .boldSystemFont(ofSize: 15)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
        
    let yearLabel : UILabel = {
        let title = UILabel()
        title.text = "Test "
        title.textColor = .black
        title.font = .systemFont(ofSize: 13)
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    let imdbTitle : UILabel = {
        let title = UILabel()
        title.text = "Test"
        title.textColor = .black
        title.font = .systemFont(ofSize: 13)
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    let imdbStar : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "star.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    func addViews() {
           
           
        addSubview(nameLabel)
        addSubview(yearLabel)
        addSubview(mainImageView)
           
           NSLayoutConstraint.activate([
          
               
           mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
           mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
           mainImageView.heightAnchor.constraint(equalToConstant: 180),
           mainImageView.widthAnchor.constraint(equalToConstant: 120),
           
         
           nameLabel.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 10),
           nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant:-10),
           nameLabel.heightAnchor.constraint(equalToConstant: 100),
           nameLabel.widthAnchor.constraint(equalToConstant: 250),
          
           yearLabel.rightAnchor.constraint(equalTo: rightAnchor),
           yearLabel.leftAnchor.constraint(equalTo: mainImageView.leftAnchor, constant: 140),
           yearLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
           yearLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor)

       ])
           
       }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
