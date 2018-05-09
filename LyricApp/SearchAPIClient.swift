//
//  SearchAPIClient.swift
//  LyricApp
//
//  Created by C4Q on 3/9/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

//rapgenius
var clientID = "zXqImEmV9nq30THut3IlFlfp4atn_aYRLQdNk8e39FrQ6UzS47cluItXKBK2EKmA"
var secretID = "Wvn9KEmfg1WEuYASMD871_FP8gJCy0O1d538ujeLmemppMGkw8Sbem1QKkXbTq8j4o06__XgDgj_W9zpnTgWlw"
var accessToken = "DndcRmyIi78Hzf3tqQhRC0YoIF6WnGvl_rn3PvaRG8GyAnohrhROJayedR6zbV1S"

//musicmix lyrix
var apiKey = "0c414228b8c211251afe6bff8eb938ef"

class SearchAPIClient {

static let artistSearchURL = "http://api.musixmatch.com/ws/1.1/track.search?apikey=\(apiKey)&page_size=30&page=1&q_track_artist="
static let session = URLSession.shared

static func artistSearch(keyword: String, completion: @escaping (Error?, [TrackWrapper]?) -> Void) {
    session.dataTask(with: URL(string: "\(artistSearchURL)\(keyword)")!, completionHandler: { (data, response, error) in
        print("\(artistSearchURL)\(keyword)")
        if let error = error {
            completion(error, nil)
        } else if let data = data {
            do {
                let decoder = JSONDecoder()
                let searchResults = try decoder.decode(SearchResponse.self, from: data)
                completion(nil, searchResults.message.body.trackList)
            } catch {
                print("decoding error: \(error.localizedDescription)")
            }
        }
    }).resume()
}

//static func titleSearch(keyword: String, completion: @escaping (Error?, Movie?) -> Void) {
//    session.dataTask(with: URL(string: "\(titleSearchURL)\(keyword)")!, completionHandler: { (data, response, error) in
//        if let error = error {
//            completion(error, nil)
//        } else if let data = data {
//            do {
//                let decoder = JSONDecoder()
//                let movie = try decoder.decode(Movie.self, from: data)
//                completion(nil, movie)
//            } catch {
//                print("decoding error: \(error.localizedDescription)")
//            }
//        }
//    }).resume()
//}

}
