//
//  Playlist.swift
//  MusicCollection
//
//  Created by Jason on 2016/10/16.
//  Copyright © 2016年 Jason. All rights reserved.
//

import Foundation

protocol PlaylistProtocol : class{
    func removeSong(song: Song)
}

//equatable化
func ==(lhs: Playlist, rhs: Playlist) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

class Playlist : Hashable, PlaylistProtocol {
    weak var delegate : MusicCollectionProtocol?
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
    init(playlistName: String, delegate: MusicCollectionProtocol?) {
        self.playlistName = playlistName
        self.delegate = delegate
    }
    
    /// 添加目标歌曲
    ///
    /// - parameter song: 目标歌曲
    func addSong(song: Song) {
        delegate?.addToLibrary(song: song)
        playlistContents.insert(song)
        song.delegateArray.append(self)
    }
    
    /// 删除目标歌曲
    ///
    /// - parameter song: 目标歌曲
    func removeSong(song:Song) {
        if playlistContents.contains(song) {
            playlistContents.remove(song)
            //这里要把song的delegateArray中的自己删掉
        }
    }
    
    /// 批量添加歌曲
    ///
    /// - parameter songSet: 歌曲集合
    func addSongSet(songSet:Set<Song>) {
        for song in songSet {
            self.addSong(song: song)
        }
    }
    
    /// 批量删除歌曲
    ///
    /// - parameter songSet: 歌曲集合
    func removeSongSet(songSet:Set<Song>) {
        for song in songSet {
            self.removeSong(song: song)
        }
    }
    
    /// 遍历打印playlist中歌曲信息
    func displayPlaylistInfo() {
        print("\(playlistName):")
        //尾随闭包优化
        playlistContents.forEach { $0.displayInfo() }
    }
    
}

