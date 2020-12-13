# frozen_string_literal: true

require 'application_system_test_case'
# require 'webdrivers'

class ReportCommentsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:report1)
    @user = users(:user1)
    visit root_path
    fill_in 'メールアドレス', with: 'sample-1@example.com'
    fill_in 'パスワード', with: '111111'
    click_button 'ログイン'
  end

  test '新規コメント追加（レポート）' do
    visit report_path(@report)
    fill_in 'コメント本文', with: '素晴らしいレポート'
    click_button '登録する'
    assert_selector 'h2', text: 'コメント一覧'
    assert_text 'コメント者'
    assert_text '206669143'
    assert_text 'コメント本文'
    assert_text '素晴らしいレポート'
    assert_text 'コメント作成日時'
    assert_text 'コメント編集'
    assert_text 'コメント削除'
    assert_text 'コメント新規登録できました。'
  end

  test 'コメント更新登録（レポート）' do
    visit report_path(@report)
    fill_in 'コメント本文', with: '普通のレポート'
    click_button '登録する'
    click_link 'コメント編集'
    fill_in 'コメント本文', with: 'レポートのコメント、書き直し'
    click_button '更新する'
    assert_text 'レポートのコメント、書き直し'
    assert_text 'コメント更新登録できました。'
  end

  test 'コメント登録削除（レポート）' do
    visit report_path(@report)
    fill_in 'コメント本文', with: '普通のレポート'
    click_button '登録する'
    page.accept_confirm do
      click_link 'コメント削除'
    end
    assert_text 'コメント削除できました。'
  end
end
