//
//  MusicCollection.swift
//  MusicCollection
//
//  Created by Jason on 2016/10/16.
//  Copyright © 2016年 Jason. All rights reserved.
//

import Foundation

class MusicCollection {
    
    private var library:Playlist  //创建私有library列表
    var musicCollection = Set<Playlist>()
    
    /// 初始化
    /// 将library实例化并添加到musicCollection
    init() {
        self.library = Playlist(playlistName: "library")
        self.musicCollection = [library]
    }
    
    /// 添加播放列表
    ///
    /// - parameter playlist: 目标播放列表
    func addPlaylist(playlist: Playlist) {
        self.musicCollection.insert(playlist)
    }
    
    /// 删除播放列表
    ///
    /// - parameter playlist: 目标播放列表
    func removePlaylist(playlist: Playlist) {
        self.musicCollection.remove(playlist)
    }
    
    /// 显示MusicCollection信息
    func displayMusicCollectionInfo() {
        //尾随闭包优化
        self.musicCollection.forEach { $0.displayPlaylistInfo() }
    }
    
    /// 往目标播放列表中添加目标歌曲
    ///
    /// - parameter song:     目标歌曲
    /// - parameter playlist: 目标播放列表
    func addSong(song: Song,playlist: Playlist) {
        //先添加到library
        library.addSong(song: song)
        playlist.addSong(song: song)
    }
    
    /// 删除library中的目标歌曲
    /// 遍历所有playlist，调用removeSong方法
    /// - parameter song: 目标歌曲
    func removeFromLibrary(song: Song) {
        //尾随闭包优化
        self.musicCollection.forEach { $0.removeSong(song: song) }
    }
}
