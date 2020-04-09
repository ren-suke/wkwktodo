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
    static func getFolderObjects() -> Observable<[FolderObject]>
    static func addFolder(with newFolder: FolderObject) -> Observable<Void>
}

struct FolderDataStore: FolderDataStoreProtocol {
    static func getFolderObjects() -> Observable<[FolderObject]> {
        do {
            let realm = try Realm()
            let folders = realm.objects(FolderObject.self)
            return Observable.array(from: folders)
        } catch {
            return Observable<[FolderObject]>.error(error)
        }
    }
    
    static func getFolder(with id: Int) -> FolderObject {
        do {
            let realm = try Realm()
            let folder = realm.object(ofType: FolderObject.self, forPrimaryKey: id)
            return folder!
        } catch {
            fatalError()
        }
    }
    
    static func addFolder(with newFolder: FolderObject) -> Observable<Void> {
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
