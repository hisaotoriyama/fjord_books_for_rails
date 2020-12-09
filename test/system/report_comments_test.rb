# frozen_string_literal: true

require 'application_system_test_case'
# require 'webdrivers'

class ReportCommentsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:report1)
    @user = users(:user1)
    visit root_path
    fill_in 'メールアドレス', with: 'sample-1@example.com'
    fill_in 'パスワード', with: 111_111
    click_button 'ログイン'

    visit report_path(@report)
    fill_in 'コメント本文', with: '普通のレポート'
    click_button 'Create コメント'
  end

  test 'creating a Report Comment' do
    visit report_path(@report)
    fill_in 'コメント本文', with: '素晴らしいレポート'
    click_button 'Create コメント'
    assert_text '素晴らしいレポート'
  end

  test 'updating a Report Comment' do
    assert_text '普通のレポート'
    click_link 'コメント編集'
    fill_in 'コメント本文', with: 'レポートのコメント、書き直し'
    click_button 'Update コメント'
    assert_text 'レポートのコメント、書き直し'
    assert_text 'コメント更新登録できました。'
  end

  test 'destroying a Report Comment' do
    assert_text '普通のレポート'
    page.accept_confirm do
      click_link 'コメント削除'
    end
    assert_text 'コメント削除できました。'
  end
end
