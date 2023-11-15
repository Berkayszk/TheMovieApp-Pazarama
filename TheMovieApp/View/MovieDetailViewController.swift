//
//  MovieDetailViewController.swift
//  TheMovieApp
//
//  Created by Berkay Sazak on 5.11.2023.
//

import UIKit

class MovieDetailViewController: UIViewController, DetailViewModelOutput {
   
    
   
    
    var selectedMovie : Movie?
    var movieList : [Movie] = []
    
    private let detailViewModel : DetailViewModel

    let mainImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "square")
        imageView.backgroundColor = .black
        imageView.layer.borderWidth = 0
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 17
        imageView.image = UIImage(systemName: "square")
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
        nameLabel.numberOfLines = 1
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    let detailLabel : UILabel = {
        let title = UILabel()
        title.text = "Test "
        title.textColor = .black
        title.font = .systemFont(ofSize: 13)
        title.textAlignment = .center
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
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
    var imdbTitle : UILabel = {
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
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .systemYellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let ratedLabel : UILabel = {
        let title = UILabel()
        title.text = "Test"
        title.textColor = .black
        title.font = .systemFont(ofSize: 13)
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    let genreLabel : UILabel = {
        let title = UILabel()
        title.text = "Test"
        title.textColor = .black
        title.font = .systemFont(ofSize: 13)
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    let countryLabel : UILabel = {
        let title = UILabel()
        title.text = "Test"
        title.textColor = .black
        title.font = .systemFont(ofSize: 13)
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    let languageLabel : UILabel = {
        let title = UILabel()
        title.text = "Test"
        title.textColor = .black
        title.font = .systemFont(ofSize: 13)
        title.textAlignment = .center
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    let directorLabel : UILabel = {
        let title = UILabel()
        title.text = "Test"
        title.textColor = .black
        title.font = .systemFont(ofSize: 13)
        title.textAlignment = .center
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    let boxOfficeLabel : UILabel = {
        let title = UILabel()
        title.text = "Test"
        title.textColor = .black
        title.font = .systemFont(ofSize: 13)
        title.textAlignment = .center
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    let metaScore : UILabel = {
        let title = UILabel()
        title.text = "Test"
        title.textColor = .black
        title.font = .systemFont(ofSize: 13)
        title.textAlignment = .center
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    let imdbVotes : UILabel = {
        let title = UILabel()
        title.text = "Test"
        title.textColor = .black
        title.font = .systemFont(ofSize: 13)
        title.textAlignment = .center
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    let summaryText : UILabel = {
        let title = UILabel()
        title.text = "Summary:"
        title.textColor = .black
        title.font = .systemFont(ofSize: 13)
        title.font = .boldSystemFont(ofSize: 14)
        title.textAlignment = .center
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    let genreImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "books.vertical.fill")
        imageView.tintColor = .systemBrown
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let countryImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "globe.europe.africa.fill")
        imageView.tintColor = .systemBlue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let languageImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "textformat.abc.dottedunderline")
        imageView.tintColor = .systemBlue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let personImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person.3.fill")
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let dollarImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "dollarsign")
        imageView.tintColor = .systemGreen
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let metascoreImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "theatermasks")
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let imadbImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "cellularbars")
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let calanderImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "calendar")
        imageView.tintColor = .systemRed
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let accessibilityImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "accessibility")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    
    
    init(detailViewModel: DetailViewModel) {
        self.detailViewModel = detailViewModel
        super.init(nibName: nil, bundle: nil)
        self.detailViewModel.detailOutput = self
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupDetails()
        //updateMovie()
        detailViewModel.getMovie(id: selectedMovie?.imdbID ?? "")
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.isTranslucent = false
        
    }
    
 
    
    func setMovieDetails(movie: Movie?, error: String?) {
        DispatchQueue.main.async {
            if let movie = movie {
                self.imdbTitle.text = movie.imdbRating
                //self.detailViewModel.getMovie(id: (selectedMovie?.imdbID)!)
                self.mainImageView.downloaded(from: movie.Poster ?? Constants.noImageUrl)
                self.titleImageView.downloaded(from: movie.Poster ?? Constants.noImageUrl)
                self.nameLabel.text = movie.Title
                self.yearLabel.text = movie.Released
                self.detailLabel.text = movie.Plot
                self.ratedLabel.text = movie.Rated
                self.genreLabel.text = "Genre: \(movie.Genre ?? "Genre doesn't exist")"
                self.countryLabel.text = "Country: \(movie.Country ?? "None Country")"
                self.directorLabel.text = "Directors: \(movie.Director ?? "Doesn't Exist")"
                self.languageLabel.text = "Language: \(movie.Language ?? "Doesn't Exist")"
                self.boxOfficeLabel.text = "Revenue: \(movie.BoxOffice ?? "$0")"
                self.metaScore.text = "Metascore: \(movie.Metascore ?? "0")"
                self.imdbVotes.text = "IMDB Votes: \(movie.imdbVotes ?? "0")"
            }else {
                if let error{
                    print(error)
                }
            }
        }
    }
    
    /*
    func updateMovie() {
        self.detailViewModel.getMovie(id: (selectedMovie?.imdbID)!)
        self.mainImageView.downloaded(from: selectedMovie?.Poster ?? Constants.noImageUrl)
        self.titleImageView.downloaded(from: selectedMovie?.Poster ?? Constants.noImageUrl)
        self.nameLabel.text = selectedMovie?.Title
        self.yearLabel.text = selectedMovie?.Year
        self.detailLabel.text = selectedMovie?.Year
    }
   
    func fetchMovieDetails(imdbId: String) {
        MovieManager().getMovieDetails(imdbID: imdbId) { result in
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    self.movieList = movie
                    
                    
                }
            case .failure(let error):
                
                print("Hata: \(error.localizedDescription)")
            }
        }
    }
     */
    
    
    func setupDetails() {
        
        view.addSubview(mainImageView)
        view.addSubview(titleImageView)
        view.addSubview(nameLabel)
        view.addSubview(yearLabel)
        view.addSubview(detailLabel)
        view.addSubview(imdbTitle)
        view.addSubview(imdbStar)
        view.addSubview(ratedLabel)
        view.addSubview(genreLabel)
        view.addSubview(countryLabel)
        view.addSubview(directorLabel)
        view.addSubview(languageLabel)
        view.addSubview(boxOfficeLabel)
        view.addSubview(metaScore)
        view.addSubview(imdbVotes)
        view.addSubview(summaryText)
        view.addSubview(genreImage)
        view.addSubview(personImage)
        view.addSubview(languageImage)
        view.addSubview(countryImage)
        view.addSubview(imadbImage)
        view.addSubview(metascoreImage)
        view.addSubview(dollarImage)
        view.addSubview(accessibilityImage)
        view.addSubview(calanderImage)
        
        NSLayoutConstraint.activate([
                
            mainImageView.topAnchor.constraint(equalTo: view.topAnchor),
            mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImageView.heightAnchor.constraint(equalToConstant: 300),
            mainImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            
            titleImageView.topAnchor.constraint(equalTo: mainImageView.topAnchor, constant: 150),
            titleImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            titleImageView.heightAnchor.constraint(equalToConstant: 180),
            titleImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 3),
            
            
            nameLabel.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 20),
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            
            
            yearLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 13),
            yearLabel.leftAnchor.constraint(equalTo: imdbTitle.rightAnchor, constant: 50),
            
            summaryText.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 13),
            summaryText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
                        
            detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                        
            imdbTitle.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 13),
            imdbTitle.leftAnchor.constraint(equalTo: imdbStar.rightAnchor, constant: 5),
  
            
            accessibilityImage.topAnchor.constraint(equalTo: imdbStar.topAnchor, constant: 37),
            accessibilityImage.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 70),
            
            calanderImage.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10),
            calanderImage.leftAnchor.constraint(equalTo: ratedLabel.leftAnchor, constant: 5),
                        
            imdbStar.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10),
            imdbStar.leftAnchor.constraint(equalTo: titleImageView.rightAnchor, constant: 40),
            
            ratedLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 50),
            ratedLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -90),
            
            genreImage.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 20),
            genreImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            
            genreLabel.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 25),
            genreLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            
            countryImage.topAnchor.constraint(equalTo: genreImage.bottomAnchor, constant: 20),
            countryImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            
            countryLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 23),
            countryLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
            
            languageImage.topAnchor.constraint(equalTo: countryImage.bottomAnchor, constant: 20),
            languageImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            
            languageLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 23),
            languageLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 42),
            
            personImage.topAnchor.constraint(equalTo: languageImage.bottomAnchor, constant: 15),
            personImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            
            directorLabel.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 20),
            directorLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            
            dollarImage.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 15),
            dollarImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            
            boxOfficeLabel.topAnchor.constraint(equalTo: directorLabel.bottomAnchor, constant: 20),
            boxOfficeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
            
            metascoreImage.topAnchor.constraint(equalTo: dollarImage.bottomAnchor, constant: 15),
            metascoreImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            
            metaScore.topAnchor.constraint(equalTo: boxOfficeLabel.bottomAnchor, constant: 20),
            metaScore.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            
            imadbImage.topAnchor.constraint(equalTo: boxOfficeLabel.bottomAnchor, constant: 17),
            imadbImage.leftAnchor.constraint(equalTo: metaScore.rightAnchor, constant: 40),
            
            imdbVotes.topAnchor.constraint(equalTo: boxOfficeLabel.bottomAnchor, constant: 20),
            imdbVotes.leftAnchor.constraint(equalTo: imadbImage.rightAnchor, constant: 5)
            
          
        ])
        
        
    }
}
