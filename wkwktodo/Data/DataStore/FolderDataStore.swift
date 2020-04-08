//
//  FolderDataStore.swift
//  wkwktodo
//
//  Created by Ren Matsushita on 2020/03/25.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift
import RxRealm
import RxSwift

protocol FolderDataStoreProtocol {
    static func getFolders() -> Observable<[Folder]>
    static func addFolder(with newFolder: Folder) -> Observable<Void>
}

class FolderDataStore: FolderDataStoreProtocol {
    static func getFolders() -> Observable<[Folder]> {
        do {
            let realm = try Realm()
            let folders = realm.objects(Folder.self)
            return Observable.array(from: folders)
        } catch {
            return Observable<[Folder]>.error(error)
        }
    }
    
    static func getFolder(with id: Int) -> Folder {
        do {
            let realm = try Realm()
            let folder = realm.object(ofType: Folder.self, forPrimaryKey: id)
            return folder!
        } catch {
            fatalError()
        }
    }
    
    static func addFolder(with newFolder: Folder) -> Observable<Void> {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(newFolder)
            }
            return .just(())
        } catch {
            return .error(error)
        }
    }
}
