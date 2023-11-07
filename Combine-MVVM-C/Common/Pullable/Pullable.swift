//
//  Pullable.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/31.
//

import UIKit
import MJRefresh

typealias Pullable = PullDownRefresh & PullUpLoadMore

public protocol PullDownRefresh {
    func pullDownRefresh<T: MJRefreshHeader>(_ type: T.Type, refresh: @escaping ()->())
    func endRefreshing()
}

public protocol PullUpLoadMore {
    var loadMoreHidden: Bool { get set }
    func pullUpLoadMore<T: MJRefreshFooter>(_ type: T.Type, loadMore: @escaping ()->())
    func endLoadMore()
}


public extension PullDownRefresh where Self: UIScrollView {
    
    func pullDownRefresh<T: MJRefreshHeader>(_ type: T.Type = MJRefreshNormalHeader.self, refresh: @escaping ()->() = {}) {
        self.mj_header = type.init(refreshingBlock: refresh)
    }
    
    func endRefreshing() {
        self.mj_header!.endRefreshing()
    }
}

public extension PullUpLoadMore where Self: UIScrollView {
    
    var loadMoreHidden: Bool {
        get {
            self.mj_footer!.isHidden
        }
        set {
            self.mj_footer!.isHidden = newValue
        }
    }
    
    func pullUpLoadMore<T: MJRefreshFooter>(_ type: T.Type = MJRefreshAutoFooter.self, loadMore: @escaping ()->() = {}) {
        self.mj_footer = type.init(refreshingBlock: loadMore)
    }
    
    func endLoadMore() {
        self.mj_footer!.endRefreshing()
    }
}

extension UITableView: Pullable {}
extension UICollectionView: Pullable {}
