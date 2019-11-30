# メッセージのデータをキーとバリューで設定
json.content @message.content
# user_idのデータをキーとバリューで設定
json.user_id @message.user_id
# image(画像)のデータをキーとバリューで設定(urlを指定していないとオブジェクト扱いされしまうので注意)
json.image @message.image.url
# group_idのデータをキーとバリューで設定
json.group_id @message.group_id
# 投降日時のデータをキーとバリューで設定(日時設定に関しては今回は正規表現を使用)
json.created_at @message.created_at.strftime("%Y/%-m/%-d %-H:%M")
# 更新日時のデータをキーとバリューで設定
json.updated_at @message.updated_at
# messageとusersはアソシエーションを組んでいるのでusersテーブルのnameカラムを取り出すことができる
json.nickname @message.user.name