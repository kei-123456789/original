require 'rails_helper'

def visit_with_http_auth(path)
  username = 'admin'
  password = '2828'
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "Contents", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @content = FactoryBot.create(:content)
  end
  context '画像保存ができるとき'do
    it 'ログインしたユーザーは画像保存できる' do
      # ユーザー認証を入力する
      visit_with_http_auth root_path
      # ログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[value="ログイン"]').click
      expect(current_path).to eq(root_path)
      # 新規保存ページへのボタンがあることを確認する
      expect(page).to have_content('保存する')
      # 投稿ページに移動する
      visit new_content_path
      # フォームに情報を入力する
      fill_in 'Visit', with: @content.visit
      select '北海道', from: 'content[prefecture_id]'
      fill_in 'Explain', with: @content.explain
      attach_file 'content[images][]','public/images/test_image.png'
      # 送信するとContentモデルのカウントが1上がることを確認する
      expect{
        find('input[value="保存"]').click
      }.to change { Content.count }.by(1)
      # トップページに移動することを確認する
      expect(current_path).to eq(root_path)
      # 画像を保存した都道府県に移動する
      find('div[id="hokkaido"]').click
      # 保存した画像が存在することを確認する（画像）
      expect(page).to have_selector("img[src$='test_image.png']")
      # 保存した画像をクリックする
      find("img[src$='test_image.png']").click
      # 画像の詳細が確認できる
      expect(page).to have_content(@content.explain)
    end
  end
  context '画像保存ができるとき'do
    it 'ログインしていないユーザーは画像保存できない' do
      # トップページに遷移する
      visit root_path
      # 保存するボタンを押す
      click_on '保存する'
      # ログインページに戻される
      expect(current_path).to have_no_content('保存')
    end
  end
end
