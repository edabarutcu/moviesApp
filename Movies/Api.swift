import SwiftyJSON
import UIKit

var movieTitles : [String] = [""]
var titles : [String] = [""]
var poster : [String] = [""]
var movieId : [String] = [""]
var backgroundPoster : [String] = [""]
var lang : [String] = [""]
var overview : [String] = [""]
var popularity : [String] = [""]

var titlesDetail : String = ""
var backgroundPosterDetail : String = ""
var languageDetail : String = ""
var overviewDetail : String = ""
var popularityDetail : String = ""
var detailId : Int = 0


var semaphore = DispatchSemaphore (value: 0)

func getList() {
    var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=b155b3b83ec4d1cbb1e9576c41d00503")!,timeoutInterval: Double.infinity)
    request.httpMethod = "GET"

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        semaphore.signal()
        return
      }
      print(String(data: data, encoding: .utf8)!)
        let json = JSON(data)

        titles.removeAll()
        poster.removeAll()
        movieId.removeAll()
        backgroundPoster.removeAll()
        lang.removeAll()
        overview.removeAll()
        popularity.removeAll()
        for item in json["results"].arrayValue {
            titles.append(item["original_title"].stringValue)
            poster.append(item["poster_path"].stringValue)
            movieId.append(item["id"].stringValue)
            backgroundPoster.append(item["backdrop_path"].stringValue)
            lang.append(item["original_language"].stringValue)
            overview.append(item["overview"].stringValue)
            popularity.append(item["popularity"].stringValue)
            }
      semaphore.signal()
    }

    task.resume()
    semaphore.wait()
}
