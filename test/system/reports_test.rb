# frozen_string_literal: true

require 'application_system_test_case'
require 'webdrivers'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:report1)
    @user = users(:user1)
    visit root_path
    fill_in 'メールアドレス', with: 'sample-1@example.com'
    fill_in 'パスワード', with: 1_111_111
    click_button 'ログイン'
  end

  test 'visiting the Report/index' do
    visit reports_path
    assert_selector 'h1', text: 'レポート一覧'
    assert_text 'タイトル'
    assert_text '本文'
    assert_text 'ユーザーID'
    assert_text 'ログインユーザー'
    assert_text 'ログインユーザーID'
  end

  test 'creating a Report' do
    visit reports_path
    click_on '新規レポート追加'
    fill_in 'タイトル', with: @report.title
    fill_in '本文', with: @report.body
    click_button 'Create レポート'
    assert_text 'レポート新規登録できました。'
  end

  test 'updating a Report' do
    visit user_path(@user)
    click_on 'レポート編集'
    fill_in 'タイトル', with: '明日の天気'
    fill_in '本文', with: '行楽日和'
    click_on 'Update レポート'
    assert_text 'レポート更新登録できました。'
  end

  test 'showing a Report' do
    visit user_path(@user)
    click_on 'レポート表示'
    assert_text 'タイトル'
    assert_text @report.title
    assert_text '本文'
    assert_text @report.body
  end

  test 'destroying a Report' do
    visit user_path(@user)
    page.accept_confirm do
      click_on 'レポート削除'
    end
    assert_text '削除できました。'
  end
end
