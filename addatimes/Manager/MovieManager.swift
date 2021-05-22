//
//  MovieManager.swift
//  addatimes
//
//  Created by shubham on 22/05/21.
//

import Foundation

typealias byteData = Data
struct MovieManager {
    
    let urlString = "https://addatimes.webappfactory.co/api/v3/home/mobile"
    
    func fetchData(){
        performRequest(with: urlString)
    }
    
    func performRequest(with: String){
        // 1. Create URL Object
        if let url = URL(string: urlString){
            
            // 2. Create Url Session.
            let session = URLSession(configuration: .default)
            
            // 3. Give URL Session a task
          let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    // print error error message in console
                    print(error?.localizedDescription ?? "error occured during data fetch")
                    return
                }
                
                if let safeData = data {
                    if self.parseJSON(safeData) != nil{
                        // i'll get weater data model / say movie model object
                        // and i'll use the delegate to pass it to view controller
                    }
                }
          }
        
            // 4. Start the task
            task.resume()
        }
    }

    func parseJSON(_ movieData: byteData) -> MovieModel?{
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(MovieData.self, from: movieData)
            
            // fetch and make object with the received parsed data
            let success = decodedData.success
            let categoryId = decodedData.data[0].category_id
            
            let movie = MovieModel(success: success, category_id: categoryId)
            return movie
            
        } catch {
            
            return nil
        }
    }


}
