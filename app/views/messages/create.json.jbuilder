# メッセージのデータをキーとバリューで設定
json.content @message.content

# image(画像)のデータをキーとバリューで設定(urlを指定していないとオブジェクト扱いされしまうので注意)
json.image @message.image.url

# 投降日時のデータをキーとバリューで設定(日時設定に関しては今回は正規表現を使用)
json.created_at @message.created_at.strftime("%Y/%-m/%-d %-H:%M")

# messageとusersはアソシエーションを組んでいるのでusersテーブルのnameカラムを取り出すことができる
json.nickname @message.user.name

# 自動更新をする時に使うもの
# app/views/api/messages/index.json.jbuilderだとリロードをした時にしか取得ができないので非同期通信の際にも反映されるように以下を記述
json.id @message.id