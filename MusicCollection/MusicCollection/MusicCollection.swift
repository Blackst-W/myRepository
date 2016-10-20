//
//  MusicCollection.swift
//  MusicCollection
//
//  Created by Jason on 2016/10/16.
//  Copyright © 2016年 Jason. All rights reserved.
//

import Foundation

class MusicCollection : MusicCollectionProtocol {
    var musicCollection = Set<Playlist>()
    lazy var library : Playlist = {
        [unowned self] in
        return Playlist(playlistName: "library", delegate: self)
    }()
    /// 初始化
    /// 将library实例化并添加到musicCollection
    init() {
        musicCollection = [library]
    }
    
    /// 添加播放列表
    ///
    /// - parameter playlist: 目标播放列表
    func addPlaylist(playlist: Playlist) {
        if musicCollection.contains(playlist) {
            print("Playlist existed! Please try another name.")
        }
        else {
            musicCollection.insert(playlist)
        }
    }
    
    /// 删除播放列表
    ///
    /// - parameter playlist: 目标播放列表
    func removePlaylist(playlist: Playlist) {
        if playlist.playlistName != "library" {
            musicCollection.remove(playlist)
        }
        else {
            print("Playlist 'library' can't be removed!")
        }
    }
    
    /// 批量添加playlist
    ///
    /// - parameter playlistSet: playlist集合
    func addPlaylistSet(playlistSet:Set<Playlist>) {
        for playlist in playlistSet {
            addPlaylist(playlist: playlist)
        }
    }
    
    /// 批量删除playlist
    ///
    /// - parameter playlistSet: playlist集合
    func removePlaylistSet(playlistSet:Set<Playlist>) {
        for playlist in playlistSet {
            removePlaylist(playlist: playlist)
        }
    }
    
    /// 显示MusicCollection信息
    func displayMusicCollectionInfo() {
        //尾随闭包优化
        musicCollection.forEach { $0.displayPlaylistInfo() }
    }
    
    func addToLibrary(song: Song) {
        library.playlistContents.insert(song)
        song.delegateArray.append(library)
    }
    
    func removeFromLibrary(song: Song) {
        for playlist in musicCollection {
            playlist.removeSong(song: song)
        }
    }
}

protocol MusicCollectionProtocol : class{
    func addToLibrary(song: Song)
}
