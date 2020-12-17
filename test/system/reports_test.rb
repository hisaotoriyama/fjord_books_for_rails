# frozen_string_literal: true

require 'application_system_test_case'
# require 'webdrivers'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:report1)
    @user = users(:user1)
    visit root_path
    fill_in 'メールアドレス', with: 'sample-1@example.com'
    fill_in 'パスワード', with: '111111'
    click_button 'ログイン'
  end

  test 'レポート一覧画面展開' do
    visit reports_path
    assert_selector 'h1', text: 'レポート一覧'
    assert_text 'タイトル'
    assert_text '本文'
    assert_text 'ユーザーID'
    assert_text 'ログインユーザー'
    assert_text 'ログインユーザーID'
  end

  test '新規レポート追加' do
    visit reports_path
    click_on '新規レポート追加'
    fill_in 'タイトル', with: '昨日の天気'
    fill_in '本文', with: '雨'
    click_button '登録する'
    assert_text 'レポート新規登録できました。'
    assert_text 'タイトル'
    assert_text '昨日の天気'
    assert_text '本文'
    assert_text '雨'
    assert_text '編集'
    assert_text '戻る'
    assert_selector 'h2', text: 'コメント一覧'
    assert_text 'コメント者'
    assert_text 'コメント本文'
    assert_text 'コメント作成日時'
    assert_text 'コメント本文'
  end

  test 'レポート更新登録' do
    visit user_path(@user)
    within '[data-test=user-report-edit-206669143]' do
      click_on '編集'
    end
    fill_in 'タイトル', with: '明日の天気'
    fill_in '本文', with: '行楽日和'
    click_on '更新する'
    assert_text 'レポート更新登録できました。'
    assert_text 'タイトル'
    assert_text '明日の天気'
    assert_text '本文'
    assert_text '行楽日和'
    assert_text '編集'
    assert_text '戻る'
    assert_selector 'h2', text: 'コメント一覧'
    assert_text 'コメント者'
    assert_text 'コメント本文'
    assert_text 'コメント作成日時'
    assert_text 'コメント本文'
  end

  test '個別レポート表示' do
    visit user_path(@user)
    within '[data-test=user-report-show-206669143]' do
      click_on '表示'
    end
    assert_text 'タイトル'
    assert_text '本日の天気'
    assert_text '本文'
    assert_text '晴天なり'
  end

  test 'レポート登録削除' do
    visit user_path(@user)
    within '[data-test=user-report-destroy-206669143]' do
      page.accept_confirm do
        click_on '削除'
      end
    end
    assert_text '削除できました。'
    assert_selector 'h1', text: 'レポート一覧'
    assert_text 'タイトル'
    assert_text '本文'
    assert_text 'ユーザーID'
  end
end
