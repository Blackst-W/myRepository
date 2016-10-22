//
//  MusicCollection.swift
//  MusicCollection
//
//  Created by Jason on 2016/10/16.
//  Copyright © 2016年 Jason. All rights reserved.
//

import Foundation

//protocol一般写在文件头
protocol MusicCollectionProtocol : class{
    func addToLibrary(song: Song)
}

class MusicCollection : MusicCollectionProtocol {
    
    //在init函数内赋值的情况下，不需要提供初始值
    var musicCollection: Set<Playlist>
    var library: Playlist
    /// 初始化
    /// 将library实例化并添加到musicCollection
    init() {
        library = Playlist(playlistName: "library", delegate: nil)
        musicCollection = [library]
        //延迟设置delegate，避免在library初始化时循环初始化的问题
        library.delegate = self
    }
    
    /// 添加播放列表
    ///
    /// - parameter playlist: 目标播放列表
    /// - returns: 用返回值来表示是否成功
    @discardableResult //用于标记返回值可以被忽略
    func addPlaylist(playlist: Playlist) -> Bool {
        if musicCollection.contains(playlist) {
            print("Playlist existed! Please try another name.")
            return false
        } else {
            musicCollection.insert(playlist)
            return true
        }
    }
    
    /// 删除播放列表
    ///
    /// - parameter playlist: 目标播放列表
    func removePlaylist(playlist: Playlist) {
        if playlist.playlistName != "library" {
            musicCollection.remove(playlist)
        } else {
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
    
    //这里应该对song的delegateArray遍历
    func removeFromLibrary(song: Song) {
        for playlist in musicCollection {
            playlist.removeSong(song: song)
        }
    }
}


