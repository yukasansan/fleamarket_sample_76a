crumb :root do
  link "Home", root_path
end

crumb :mypage do
  link "マイページ", mypage_index_path
end

crumb :show do
  link "商品詳細ページ", item_path
end

crumb :profile do
  link "プロフィール", "#"
  parent :mypage
end

crumb :categories do
  link "カテゴリー一覧", "categories_path"
end

crumb :card_Registration do
  link "クレジットカード登録", "new_card_path"
  parent :mypage
end

crumb :method_payment do
  link "支払い方法", "cards_path"
  parent :mypage
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).