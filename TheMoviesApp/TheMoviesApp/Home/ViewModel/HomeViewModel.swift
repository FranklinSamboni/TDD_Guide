//
//  HomeViewModel.swift
//  TheMoviesApp
//
//  Created by Sach on 13/02/21.
//

import RxSwift
import Foundation

class HomeViewModel {
    private weak var view: HomeView?
    private var router: HomeRouter?
    private var managerConnections = ManagerConnections()
    
    func bind(view: HomeView, router: HomeRouter){
        self.view = view
        self.router = router
        
        //binder el router con la vista
        self.router?.setSourceView(view)
                
    }
    
    
    func getListMoviesData()-> Observable<[Result]>{
        return managerConnections.getPopularMovies()
    }
    
}
