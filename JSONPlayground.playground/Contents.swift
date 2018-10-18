import UIKit

struct SongResults: Codable {
    struct Song: Codable {
        var artistName: String
        var trackName: String
        var collectionName: String?
        var previewUrl: URL
        var artworkUrl100: URL
        var trackPrice: Double?
        var releaseDate: Date
        var isStreamable: Bool?
    }
    var resultCount: Int
    var results:[Song]
}

if let urlString = "https://itunes.apple.com/search?term=薛之謙&media=music".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlString) {
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        if let data = data, let songResults = try? decoder.decode(SongResults.self, from:data)
        {
            for song in songResults.results {
                //print(song)
                //print("\n")
            }
        }else{
            print("error")
        }
        
    }
    task.resume()
}

for i in (0..<10).reversed() {
    let s = String(repeating: "ab ", count: 10 - i)
    print(s)
}

for i in 0..<10 {
    let s = String(repeating: "ab ", count: 10 - i)
    print(s)
}




