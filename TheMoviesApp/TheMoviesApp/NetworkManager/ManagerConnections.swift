//
//  ManagerConnections.swift
//  TheMoviesApp
//
//  Created by Sach on 19/02/21.
//
import RxSwift
import Foundation
class ManagerConnections {
    
    func getPopularMovies() -> Observable<[Result]> {
        
        return Observable.create { observable in
                        
            let session = URLSession.shared
            var request = URLRequest(url: URL(string: Constants.MainUrl.main+Constants.EndPoints.urlListPopularMovies+Constants.apiKey)!)
            print(Constants.MainUrl.main+Constants.EndPoints.urlListPopularMovies+Constants.apiKey)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.dataTask(with: request){ (data,response,error) in
                guard let data = data, error == nil, let response = response  as? HTTPURLResponse else { return }
                
                if response.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let movies = try decoder.decode(Movies.self, from: data)
                        print(movies.results![0])
                        observable.onNext(movies.results!)
                    } catch let error {
                        observable.onError(error)
                        print("ha ocurrido un error: lol\(error.localizedDescription)")
                    }
                    
                }
                else if response.statusCode == 401{
                    print("error 401")
                }
                observable.onCompleted()
            }.resume()
            
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
        
    }
     
}
