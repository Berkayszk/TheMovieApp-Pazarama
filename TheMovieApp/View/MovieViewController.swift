//
//  ViewController.swift
//  TheMovieApp
//
//  Created by Berkay Sazak on 5.11.2023.
//

import UIKit

class MovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MovieViewModelOutput {
 
    var movieViewModel : MovieViewModel?
    let tableView = UITableView()
    var movies: [Movie] = []
    let movieManager = MovieManager.shared
    var selectedMovie : Movie?
    
    lazy var searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = .white
        searchBar.delegate = self
        return searchBar
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        /*
        var bool = navigationController?.navigationBar.isTranslucent
        
        if bool == bool {
            navigationController?.navigationBar.isTranslucent = true
        }else {
            navigationController?.navigationBar.isTranslucent = false
        }
         */
            
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        movieViewModel?.fetchMovieSearchs(movieName: "Avengers")
        navigationBarUI()
        setupView()
       
    }
    
    func setSearchMovie(movieList: [Movie]?, error: String?) {
        DispatchQueue.main.async {
            if let movieList = movieList {
                self.movies = movieList
                self.tableView.reloadData()
            }
            else{
                if let error = error {
                    self.tableView.isHidden = true
                    self.errorLabel.text = "No Movie Found!!"
                }
            }
          
        }
    }
    //Different solution needed!!
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text {
            movieManager.searchMovies(query: query) { result in
                switch result {
                case .success(let movies):
                    DispatchQueue.main.async {
                        self.movies = movies
                        self.tableView.reloadData()
                        self.tableView.isHidden = false
                        self.errorLabel.isHidden = true
                    }
                case .failure(let error):
                    print("Hata: \(error.localizedDescription)")
                    DispatchQueue
                        .main.async {
                            self.tableView.isHidden = true
                            self.errorLabel.isHidden = false
                            self.errorLabel.text = "No Movie Found!!"
                        }
                }
            }
            
        }
    }
    
    
    func setupView() {
  
        view.addSubview(tableView)
        view.addSubview(searchBar)
        view.addSubview(errorLabel)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
        
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        
        
        ])
            
    }
    
    init(movieViewModel: MovieViewModel?) {
        super.init(nibName: nil, bundle: nil)
        self.movieViewModel = movieViewModel
        self.movieViewModel?.movieOutput = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func navigationBarUI() {
        
        searchBar.sizeToFit()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.title = "Movie Search"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handlerShowSearchBar))
        showSearchBarButton(shouldShow: true)
        
    }
    @objc func handlerShowSearchBar() {
        search(shouldShow: true)
        searchBar.becomeFirstResponder()
    }
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.mainImageView.downloaded(from: movie.Poster ?? Constants.noImageUrl)
        cell.nameLabel.text = movie.Title
        cell.yearLabel.text = movie.Year
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovie = movies[indexPath.row]
        
        let webService : MovieService = MovieManager()
        let detailViewModel = DetailViewModel(webService: webService)
        let detailsVc = MovieDetailViewController(detailViewModel: detailViewModel)
        detailsVc.selectedMovie = selectedMovie
        //detailsVc.imdbId = selectedMovie?.imdbID
        print(selectedMovie?.imdbID ?? "imdbID not available")
        self.navigationController?.pushViewController(detailsVc, animated: true)
    }

    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handlerShowSearchBar))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
}




extension MovieViewController : UISearchBarDelegate {
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
}
// Image Extensions
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}





  

