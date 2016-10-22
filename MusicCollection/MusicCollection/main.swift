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
var myPlaylist1 = Playlist(playlistName: "myPlaylist1", delegate: masterCollection)
var myPlaylist2 = Playlist(playlistName: "myPlaylist2", delegate: masterCollection)
var myPlaylist3 = Playlist(playlistName: "myPlaylist3", delegate: masterCollection)
var mySong1 = Song(name: "song1", artist: "song1", album: "song1", composer: "song1", duration: 10)
var mySong2 = Song(name: "song2", artist: "song2", album: "song2", composer: "song2", duration: 10)
var mySong3 = Song(name: "song3", artist: "song3", album: "song3", composer: "song3", duration: 10)
let songSet : Set = [mySong1,mySong2,mySong3]
let playlistSet : Set = [myPlaylist1,myPlaylist2,myPlaylist3]

masterCollection.addPlaylist(playlist: myPlaylist1)

myPlaylist1.addSongSet(songSet: songSet)
//myPlaylist1.addSong(song: mySong1)
//myPlaylist1.addSong(song: mySong2)
//myPlaylist1.addSong(song: mySong3)

mySong1.displayInfo()
mySong1.removeSelfFromLibrary()
masterCollection.displayMusicCollectionInfo()

mySong2.removeSelfFromLibrary()
mySong3.removeSelfFromLibrary()
masterCollection.removePlaylist(playlist: myPlaylist1)
masterCollection.displayMusicCollectionInfo()

masterCollection.addPlaylistSet(playlistSet: playlistSet)
myPlaylist1.addSongSet(songSet: songSet)
masterCollection.displayMusicCollectionInfo()

