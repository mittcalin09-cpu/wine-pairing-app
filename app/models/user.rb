class User < ApplicationRecord
  authenticates_with_sorcery!

  # 名前（name）は必ず入力し、255文字以内であること
  validates :name, presence: true, length: { maximum: 255 }

  # メールアドレス（email）は必ず入力し、他の人とかぶらないこと
  validates :email, uniqueness: true, presence: true

  # パスワードは必ず入力し、最低3文字以上であること
  # （※新規登録時、またはパスワードを変更する時だけこのルールを適用します）
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  # パスワードと確認用パスワードが一致すること
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  # 確認用パスワード（password_confirmation）は必ず入力すること
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
end