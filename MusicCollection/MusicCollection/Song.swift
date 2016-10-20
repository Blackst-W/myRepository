//
//  Song.swift
//  MusicCollection
//
//  Created by Jason on 2016/10/16.
//  Copyright © 2016年 Jason. All rights reserved.
//

import Foundation

//equatable化
func ==(lhs: Song, rhs: Song) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

class Song : Hashable {
    var delegateArray: [PlaylistProtocol]
    var name: String = ""
    var artist: String = ""
    var album: String = ""
    var composer: String = ""
    var duration: Int32 = 0
    var hashValue : Int {
        //建立hashValue，使Song类Hashable
        get {
            return "\(self.name),\(self.artist),\(self.album),\(self.composer),\(self.duration)".hashValue
        }
    }
    
    /// 初始化
    /// 加载song并添加相关属性
    /// - parameter name:     歌曲名称
    /// - parameter artist:   歌曲表演者
    /// - parameter album:    歌曲专辑
    /// - parameter composer: 歌曲作曲者
    /// - parameter duration: 歌曲时长，单位s
    /// - parameter delegate: 播放列表索引
    init(name: String, artist: String, album: String, composer: String, duration: Int32) {
        self.name = name
        self.artist = artist
        self.album = album
        self.composer = composer
        self.duration = duration
        delegateArray = []
    }
    
    /// 打印歌曲相关信息
    func displayInfo() {
        print("Name:\(name) Artist:\(artist) Album:\(album) Composer:\(composer) Duration:\(duration)s")
    }
    
    func removeSelfFromLibrary() {
        for delegate in delegateArray {
            delegate.removeSong(song: self)
        }
    }
}
