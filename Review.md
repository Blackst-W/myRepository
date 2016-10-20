考核评价：

总体而言完成的很好，能实现要求的功能，这里提几个可以继续改进的地方。

1. (done)在Swift的类中尽量避免不必要的 "self." 修饰符，以便和闭包区分。
2. (unnecessary)MusicCollection的addPlaylist方法没有检查Playlist内是否存在未加入Library的Songs
3. (done)MusicCollection中，无法确定一个Playlist是否添加成功(可能因为Set内有同名Playlist而添加失败)，尝试修复这一问题，并返回操作是否成功。(其他可能出现同样问题的地方也需要修改)。
4. (done)MusicCollection中的 "addSong(_ , playlist: _)" 方法有其他替代的实现，尝试给Song类添加对所加入的Playlist的引用，给Playlist类添加对所属MusicCollection的引用，并实现对Playlist使用addSong方法时自动添加到所属MusicCollection的Library中。注意可能存在的内存泄漏问题。
5. (done)在实现第4条的优化下，MusicCollection的removeFromLibrary不再需要遍历所有的playlist，尝试优化这一方法。
6. (done)尝试为所有的add方法添加重载方法，参数为一个Array或Set，实现批量添加的功能。
7. (done)了解一下尾随闭包的简化

Notes:  目前仅要求Playlist只被允许添加到唯一的MusicCollection中
