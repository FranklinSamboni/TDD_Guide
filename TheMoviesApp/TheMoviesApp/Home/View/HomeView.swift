//
//  HomeView.swift
//  TheMoviesApp
//
//  Created by Sach on 13/02/21.
//

import UIKit
import RxSwift

class HomeView: UIViewController, UITableViewDelegate {

    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    private var disposeBag = DisposeBag()
    private var movies  = [Result]()
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        viewModel.bind(view: self, router: router)
        getData()
        
    }
    private func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
//        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "CustomMovieCell", bundle: nil), forCellReuseIdentifier: "CustomMovieCell")
    }
    
    private func getData(){
        viewModel.getListMoviesData()
        //manejar concurrencia o hilos de RxSwift
            .subscribeOn(MainScheduler.instance)
            .observeOn(MainScheduler.instance)
        //suscribirme al observable
            .subscribe { Result in
                self.movies = Result
                self.reloadTableView()
            } onError: { error in
                print("error \(error)")
            } onCompleted: {
                print("todo ok")
            } onDisposed: {
                print("onDisposed ok")
                
            }

        //Dar por completado la secuenta RxSwift
                
        
    }
    
    private func reloadTableView(){
        DispatchQueue.main.async {
            self.activity.stopAnimating()
            self.activity.isHidden = true
            self.tableView.reloadData()
        }
    }
        
}

extension HomeView : UITabBarDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print( movies.count)
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomMovieCell.self)) as! CustomMovieCell
        cell.titleMovie.text = movies[indexPath.row].title
        cell.descriptionMovie.text = movies[indexPath.row].overview
        cell.imageMovie.imageFromServerURL(urlString: "\(Constants.MainUrl.urlImages+movies[indexPath.row].posterPath!)", placeholderImage: UIImage(named: "cacleta")!)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
        
}
