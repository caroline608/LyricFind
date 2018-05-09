//
//  TrackSearchModel.swift
//  LyricApp
//
//  Created by C4Q on 3/9/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

struct SearchResponse: Codable {
    let message: Message
}

struct Message: Codable {
    let body: Body
}

struct Body: Codable {
    let trackList: [TrackWrapper]
    
    enum CodingKeys: String, CodingKey {
        case trackList = "track_list"
    }
}

struct TrackWrapper: Codable {
    let track: Track
}

struct Track: Codable {
    let trackID: Int
    let trackName: String
    let hasLyrics: Int
    let numFavourite: Int
    let lyricsID: Int
    let albumID: Int
    let albumName: String
    let artistID: Int
    let artistName: String
    let trackShareURL: String
    let firstReleaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case trackID = "track_id"
        case trackName = "track_name"
        case hasLyrics = "has_lyrics"
        case numFavourite = "num_favourite"
        case lyricsID = "lyrics_id"
        case albumID = "album_id"
        case albumName = "album_name"
        case artistID = "artist_id"
        case artistName = "artist_name"
        case trackShareURL = "track_share_url"
        case firstReleaseDate = "first_release_date"
    }
}
