//
//  Repository.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/09.
//

import Foundation

//
//{
//        "id": 30390093,
//        "node_id": "MDEwOlJlcG9zaXRvcnkzMDM5MDA5Mw==",
//        "name": "ansible-postgresql-complete",
//        "full_name": "sbecker/ansible-postgresql-complete",
//        "private": false,
//        "owner": {
//            "login": "sbecker",
//            "id": 1001,
//            "node_id": "MDQ6VXNlcjEwMDE=",
//            "avatar_url": "https://avatars.githubusercontent.com/u/1001?v=4",
//            "gravatar_id": "",
//            "url": "https://api.github.com/users/sbecker",
//            "html_url": "https://github.com/sbecker",
//            "followers_url": "https://api.github.com/users/sbecker/followers",
//            "following_url": "https://api.github.com/users/sbecker/following{/other_user}",
//            "gists_url": "https://api.github.com/users/sbecker/gists{/gist_id}",
//            "starred_url": "https://api.github.com/users/sbecker/starred{/owner}{/repo}",
//            "subscriptions_url": "https://api.github.com/users/sbecker/subscriptions",
//            "organizations_url": "https://api.github.com/users/sbecker/orgs",
//            "repos_url": "https://api.github.com/users/sbecker/repos",
//            "events_url": "https://api.github.com/users/sbecker/events{/privacy}",
//            "received_events_url": "https://api.github.com/users/sbecker/received_events",
//            "type": "User",
//            "site_admin": false
//        },
//        "html_url": "https://github.com/sbecker/ansible-postgresql-complete",
//        "description": "Install PostgreSQL on Ubuntu, with monitoring, and continuous incremental archiving to S3",
//        "fork": false,
//        "url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete",
//        "forks_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/forks",
//        "keys_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/keys{/key_id}",
//        "collaborators_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/collaborators{/collaborator}",
//        "teams_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/teams",
//        "hooks_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/hooks",
//        "issue_events_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/issues/events{/number}",
//        "events_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/events",
//        "assignees_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/assignees{/user}",
//        "branches_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/branches{/branch}",
//        "tags_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/tags",
//        "blobs_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/git/blobs{/sha}",
//        "git_tags_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/git/tags{/sha}",
//        "git_refs_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/git/refs{/sha}",
//        "trees_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/git/trees{/sha}",
//        "statuses_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/statuses/{sha}",
//        "languages_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/languages",
//        "stargazers_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/stargazers",
//        "contributors_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/contributors",
//        "subscribers_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/subscribers",
//        "subscription_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/subscription",
//        "commits_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/commits{/sha}",
//        "git_commits_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/git/commits{/sha}",
//        "comments_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/comments{/number}",
//        "issue_comment_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/issues/comments{/number}",
//        "contents_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/contents/{+path}",
//        "compare_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/compare/{base}...{head}",
//        "merges_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/merges",
//        "archive_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/{archive_format}{/ref}",
//        "downloads_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/downloads",
//        "issues_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/issues{/number}",
//        "pulls_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/pulls{/number}",
//        "milestones_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/milestones{/number}",
//        "notifications_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/notifications{?since,all,participating}",
//        "labels_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/labels{/name}",
//        "releases_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/releases{/id}",
//        "deployments_url": "https://api.github.com/repos/sbecker/ansible-postgresql-complete/deployments",
//        "created_at": "2015-02-06T02:13:15Z",
//        "updated_at": "2015-10-21T19:30:24Z",
//        "pushed_at": "2015-02-17T18:38:21Z",
//        "git_url": "git://github.com/sbecker/ansible-postgresql-complete.git",
//        "ssh_url": "git@github.com:sbecker/ansible-postgresql-complete.git",
//        "clone_url": "https://github.com/sbecker/ansible-postgresql-complete.git",
//        "svn_url": "https://github.com/sbecker/ansible-postgresql-complete",
//        "homepage": null,
//        "size": 196,
//        "stargazers_count": 1,
//        "watchers_count": 1,
//        "language": "Shell",
//        "has_issues": true,
//        "has_projects": true,
//        "has_downloads": true,
//        "has_wiki": true,
//        "has_pages": false,
//        "has_discussions": false,
//        "forks_count": 0,
//        "mirror_url": null,
//        "archived": false,
//        "disabled": false,
//        "open_issues_count": 0,
//        "license": {
//            "key": "mit",
//            "name": "MIT License",
//            "spdx_id": "MIT",
//            "url": "https://api.github.com/licenses/mit",
//            "node_id": "MDc6TGljZW5zZTEz"
//        },
//        "allow_forking": true,
//        "is_template": false,
//        "web_commit_signoff_required": false,
//        "topics": [],
//        "visibility": "public",
//        "forks": 0,
//        "open_issues": 0,
//        "watchers": 1,
//        "default_branch": "master"
//    }

struct Repository: Decodable {
    var id: Int
    var name: String
    var htmlUrl: String
    var description: String?
    var fork: Bool
    var starCount: Int
    var watchersCount: Int
    var language: String?
    var createdAt: String
    var isExpand: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case fork
        case starCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case htmlUrl = "html_url"
        case language
        case createdAt = "created_at"
    }
    
    init(from decoder: any Decoder) throws {
        print(decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.fork = try container.decode(Bool.self, forKey: .fork)
        self.description = try container.decode(String?.self, forKey: .description)
        self.starCount = try container.decode(Int.self, forKey: .starCount)
        self.watchersCount = try container.decode(Int.self, forKey: .watchersCount)
        self.htmlUrl = try container.decode(String.self, forKey: .htmlUrl)
        self.language = try container.decode(String?.self, forKey: .language)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
    }
    
}
