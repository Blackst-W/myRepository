//
//  main.swift
//  MusicCollection
//
//  Created by Jason on 2016/10/16.
//  Copyright © 2016年 Jason. All rights reserved.
//

/// 测试模块
import Foundation

var masterCollection = MusicCollection()
var myPlaylist = Playlist(playlistName: "myPlaylist")
var mySong1 = Song(name: "song1", artist: "song1", album: "song1", composer: "song1", duration: 10)
var mySong2 = Song(name: "song2", artist: "song2", album: "song2", composer: "song2", duration: 10)
var mySong3 = Song(name: "song3", artist: "song3", album: "song3", composer: "song3", duration: 10)

masterCollection.addPlaylist(playlist: myPlaylist)
masterCollection.addSong(song: mySong1,playlist: myPlaylist)
masterCollection.addSong(song: mySong2,playlist: myPlaylist)
masterCollection.addSong(song: mySong3,playlist: myPlaylist)
mySong1.displayInfo()

myPlaylist.removeSong(song: mySong1)
masterCollection.removeFromLibrary(song: mySong3)
myPlaylist.displayPlaylistInfo()

masterCollection.displayMusicCollectionInfo()
masterCollection.removePlaylist(playlist: myPlaylist)
masterCollection.displayMusicCollectionInfo()


