//
//  Playlist.swift
//  MusicCollection
//
//  Created by Jason on 2016/10/16.
//  Copyright © 2016年 Jason. All rights reserved.
//

import Foundation

//equatable化
func ==(lhs: Playlist, rhs: Playlist) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

class Playlist : Hashable {
    var playlistName:String
    var playlistContents = Set<Song>()
    var hashValue : Int {
        //建立hashValue，使Playlist类Hashable
        get {
            return "\(self.playlistName)".hashValue
        }
    }
    
    /// 初始化
    /// 加载playlist并添加playlistName属性
    /// - parameter playlistName: 播放列表名称
    init(playlistName: String) {
        self.playlistName = playlistName
        self.playlistContents = []
    }
    
    /// 添加目标歌曲
    ///
    /// - parameter song: 目标歌曲
    func addSong(song: Song) {
        playlistContents.insert(song)
    }
    
    /// 删除目标歌曲
    ///
    /// - parameter song: 目标歌曲
    func removeSong(song:Song) {
        playlistContents.remove(song)
    }
    
    /// 遍历打印playlist中歌曲信息
    func displayPlaylistInfo() {
        print("\(playlistName):")
        self.playlistContents.forEach { (song) in
            song.displayInfo()
        }
    }
}

