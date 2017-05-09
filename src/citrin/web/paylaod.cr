require "json"

module Citrin::Web
  
  class Author
    JSON.mapping({
      name: String,
      email: String,
      username: String
    })
  end
  
  class Comitter
    JSON.mapping({
      name: String,
      email: String,
      username: String
    })
  end
  
  class Commit
    JSON.mapping({
      id: String,
      tree_id: String,
      distinct: Bool,
      message: String,
      timestamp: String,
      url: String,
      author: Author,
      committer: Comitter,
      added: Array(String),
      removed: Array(String),
      modified: Array(String)
    })
  end
  
  class Owner
    JSON.mapping({
      name: String,
      email: String
    })
  end
  
  class Repository
    JSON.mapping({
     id: Int64,
     name: String,
     full_name: String,
     owner: Owner,
     private: Bool,
     html_url: String,
     description: String,
     fork: Bool,
     url: String,
     forks_url: String,
     keys_url: String,
     collaborators_url: String,
     teams_url: String,
     hooks_url: String,
     issue_events_url: String,
     events_url: String,
     assignees_url: String,
     branches_url: String,
     tags_url: String,
     blobs_url: String,
     git_tags_url: String,
     git_refs_url: String,
     trees_url: String,
     statuses_url: String,
     languages_url: String,
     stargazers_url: String,
     contributors_url: String,
     subscribers_url: String,
     subscription_url: String,
     commits_url: String,
     git_commits_url: String,
     comments_url: String,
     issue_comment_url: String,
     contents_url: String,
     compare_url: String,
     merges_url: String,
     archive_url: String,
     downloads_url: String,
     issues_url: String,
     pulls_url: String,
     milestones_url: String,
     notifications_url: String,
     labels_url: String,
     releases_url: String,
     created_at: Int64,
     updated_at: String,
     pushed_at: Int64,
     git_url: String,
     ssh_url: String,
     clone_url: String,
     svn_url: String,
     homepage: { type: String, nilable: true },
     size: Int32,
     stargazers_count: Int32,
     watchers_count: Int32,
     language: { type: String, nilable: true },
     has_issues: Bool,
     has_downloads: Bool,
     has_wiki: Bool,
     has_pages: Bool,
     forks_count: Int32,
     mirror_url: { type: String, nilable: true },
     open_issues_count: Int32,
     forks: Int32,
     open_issues: Int32,
     watchers: Int32,
     default_branch: String,
     stargazers: Int32,
     master_branch: String
    })
  end
  
  class Pusher
    JSON.mapping({
      name: String,
      email: String
    })
  end
  
  class Sender
    JSON.mapping({
      login: String,
      id: Int32,
      avatar_url: String,
      gravatar_id: String,
      url: String,
      html_url: String,
      followers_url: String,
      following_url: String,
      gists_url: String,
      starred_url: String,
      subscriptions_url: String,
      organizations_url: String,
      repos_url: String,
      events_url: String,
      received_events_url: String,
      type: String,
      site_admin: Bool
    })
  end
  
  class PushEvent
    JSON.mapping({
      ref: String,
      before: String,
      after: String,
      created: Bool,
      deleted: Bool,
      forced: Bool,
      base_ref: { type: String, nilable: true },
      compare: String,
      commits: Array(Commit),
      head_commit: Commit,
      repository: Repository,
      pusher: Pusher,
      sender: Sender
    })
  end
end