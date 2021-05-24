//
//  MovieManager.swift
//  addatimes
//
//  Created by shubham on 22/05/21.
//

import Foundation


protocol MovieManagerDelegate {
    func didUpdateMovie(_ Manager :MovieManager, movieObject: MovieModel)
    func didFailWithError(error: Error)
}

typealias byteData = Data

struct MovieManager {
    
    let urlString = "https://addatimes.webappfactory.co/api/v3/home/mobile"
    
    var delegate: MovieManagerDelegate?

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
                    if let movieObject = self.parseJSON(safeData){
                        self.delegate?.didUpdateMovie(self, movieObject: movieObject)
                    }
                }
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ movieData: byteData) -> MovieModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(MovieData.self, from: movieData)
        
            var allSections = [Section]()
            var section: Section
            var title: String
            var items = [item]()
            
            for x in 3...14{
                title = decodedData.data[x].title
                for y in 0...(decodedData.data[x].items.count)-1 {
                    
                    let newId: Int
                    let new_vertical_image:String
                    
                    newId = decodedData.data[x].items[y].id
                    new_vertical_image = decodedData.data[x].items[y].vertical_image
                    
                    var newItem:item
                    newItem = item(id: newId, vertical_image: new_vertical_image)
                    items.append(newItem)
                }
                section = Section(title: title, items: items)
                allSections.append(section)
            }
            
            
            //let section = MovieModel(title: title, items: items)
            let allSection = MovieModel(allMovies: allSections)
            return allSection
            
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}

