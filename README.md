# README

＊アプリケーションの概要
猫の写真共有サービス
url（エンドユーザー側）:http://ec2-52-198-49-22.ap-northeast-1.compute.amazonaws.com/
url（管理者側）:http://ec2-52-198-49-22.ap-northeast-1.compute.amazonaws.com/admin
email: admin@admin.com
password: password

*機能一覧
.ユーザー認証機能
.画像投稿、閲覧、編集、削除機能
.投稿にいいねをつける機能
.投稿にコメントをつける機能
.ユーザーをフォローする機能
.投稿、ユーザー検索機能
.ページネーション機能

*使用技術一覧
#言語、フレームワーク
.ruby '2.5.5'
.gem 'rails', '~> 5.2.3'
#主な使用gem
.gem 'devise'
.gem 'refile', require: 'refile/rails', github: 'manfe/refile'
.gem 'refile-mini_magick'
.gem 'ransack'
.gem 'kaminari'
.gem 'paranoia'
.gem 'activeadmin'
.gem 'bootstrap', '~> 4.3.1'

#デプロイ環境
.AWS(EC2、RDS)
