# README
<br>
＊アプリケーションの概要<br>
猫の写真共有サービス<br>
url（エンドユーザー側）:http://ec2-52-198-49-22.ap-northeast-1.compute.amazonaws.com/<br>
テストユーザー:<br>
email:test@test.com<br>
password: password<br>
url（管理者側）:http://ec2-52-198-49-22.ap-northeast-1.compute.amazonaws.com/admin<br>
テストユーザー:<br>
email: admin@admin.com<br>
password: password<br>
<br>
*機能一覧<br>
.ユーザー認証機能<br>
.画像投稿、閲覧、編集、削除機能<br>
.投稿にいいねをつける機能<br>
.投稿にコメントをつける機能<br>
.ユーザーをフォローする機能<br>
.投稿、ユーザー検索機能<br>
.ページネーション機能<br>
<br>
*使用技術一覧<br>
#言語、フレームワーク<br>
.ruby '2.5.5'<br>
.gem 'rails', '~> 5.2.3'<br>
#主な使用gem<br>
.gem 'devise'<br>
.gem 'refile', require: 'refile/rails', github: 'manfe/refile'<br>
.gem 'refile-mini_magick'<br>
.gem 'ransack'<br>
.gem 'kaminari'<br>
.gem 'paranoia'<br>
.gem 'activeadmin'<br>
.gem 'bootstrap', '~> 4.3.1'<br>
<br>
#デプロイ環境<br>
.AWS(EC2、RDS)<br>
