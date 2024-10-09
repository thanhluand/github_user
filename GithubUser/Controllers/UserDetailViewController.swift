//
//  UserDetailViewController2.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/08.
//

import Foundation
import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var backBtn: UIButton!
    let userDetailVM  = UserDetailViewModel()
    var userName: String = ""
    var avatarImg: UIImage = UIImage()
    let avatar = UIImageView.init()
    let headerView = UIView()
    
    override func viewDidLoad() {
        self.tableView.contentInsetAdjustmentBehavior = .never
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
        self.tableView.sectionHeaderTopPadding = 0
        
        userDetailVM.delegate = self
        self.title = userName
        backBtn.circleRounded()
        userDetailVM.getUser(user: userName)
        userDetailVM.getListRepos(user: userName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.isHidden = true
        let avatarImgView = UIImageView()
        avatarImgView.image = avatarImg
        avatarImgView.frame = CGRectMake(0, 0, 40, 40)
        self.title = userName
        avatarImgView.circleRounded()
        let barButton = UIBarButtonItem(customView: avatarImgView)
        let currWidth = barButton.customView?.widthAnchor.constraint(equalToConstant: 40)
        currWidth?.isActive = true
        let currHeight = barButton.customView?.heightAnchor.constraint(equalToConstant: 40)
        currHeight?.isActive = true
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension UserDetailViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if (offset > avatar.frame.height) {
            navigationController?.navigationBar.isHidden = false
            backBtn.isHidden = true
        } else {
            navigationController?.navigationBar.isHidden = true
            backBtn.isHidden = false
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let user = userDetailVM.user else {
            print("Header emptuy")
            return headerView
        }
        print("Header not emptuy")
        avatar.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(avatar)
        NSLayoutConstraint.activate([
            avatar.widthAnchor.constraint(equalTo: headerView.widthAnchor),
            avatar.heightAnchor.constraint(equalTo: avatar.widthAnchor),
            avatar.topAnchor.constraint(equalTo: headerView.topAnchor),
            avatar.leadingAnchor.constraint(equalTo: headerView.leadingAnchor) 
        ])
        avatar.roundCorners([.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 50)
        avatar.cacheImage(urlString: user.avatar)
        avatar.contentMode = .scaleAspectFill
        
        
        let nameLB = UILabel.init()
        nameLB.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(nameLB)
        NSLayoutConstraint.activate([
            nameLB.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16),
            nameLB.centerXAnchor.constraint(equalTo: headerView.centerXAnchor)
        ])
        nameLB.text = user.name
        nameLB.textColor = .systemBlue
        nameLB.font = .boldSystemFont(ofSize: 17)
        
        let userNameLB = UILabel.init()
        userNameLB.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(userNameLB)
        NSLayoutConstraint.activate([
            userNameLB.topAnchor.constraint(equalTo: nameLB.bottomAnchor, constant: 8),
            userNameLB.centerXAnchor.constraint(equalTo: headerView.centerXAnchor)
        ])
        
        userNameLB.text = user.login
        
        let followerLB = UILabel.init()
        followerLB.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(followerLB)
        NSLayoutConstraint.activate([
            followerLB.topAnchor.constraint(equalTo: userNameLB.bottomAnchor, constant: 8),
            followerLB.centerXAnchor.constraint(equalTo: headerView.centerXAnchor)
        ])
        
        followerLB.attributedText = Utils.shared.addIconToString(sysIconName: "person.2", text: "\(user.followers) followers · \(user.following) following");
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDetailVM.resos.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell", for: indexPath) as? RepoTableViewCell else {return UITableViewCell()}
        cell.setup(data: userDetailVM.resos[indexPath.row])
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
}


extension UserDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webview = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
        guard let url = URL(string: userDetailVM.resos[indexPath.row].htmlUrl), let webview = webview else { return }
        
        webview.url = url
        self.present(webview, animated: true)
        
    }
    
}

extension UserDetailViewController: UserDetailViewModelDelegate {
    func didFetchUserInfo() {
        DispatchQueue.main.async {
            self.title = self.userDetailVM.user?.name
            self.tableView.reloadData()
        }
        
    }
    
    func didFetchUserRepos() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension UserDetailViewController: RepoTableViewCellDelegate {
    func expandDescContentClicked(cell: RepoTableViewCell) {
        guard let indexPath = self.tableView.indexPath(for: cell) else { return }
        userDetailVM.resos[indexPath.row].isExpand = !userDetailVM.resos[indexPath.row].isExpand
        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
}
