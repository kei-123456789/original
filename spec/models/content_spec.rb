require 'rails_helper'

RSpec.describe Content, type: :model do
  before do
    @content = FactoryBot.build(:content)
  end

  describe '保存機能' do
    context '投稿が保存されるとき' do
      it '全てのパラメーターが正しく存在すれば保存できる' do
        expect(@content).to be_valid
      end
    end
    context '投稿が保存されないとき' do
      it 'imageが空だと保存できない' do
        @content.images = nil
        @content.valid?
        expect(@content.errors.full_messages).to include("Images can't be blank")
      end
      it 'visitが空だと保存できない' do
        @content.visit = ''
        @content.valid?
        expect(@content.errors.full_messages).to include("Visit can't be blank")
      end
      it 'explainが空だと保存できない' do
        @content.explain = ''
        @content.valid?
        expect(@content.errors.full_messages).to include("Explain can't be blank")
      end
      it 'prefecture_idが1だと保存できない' do
        @content.prefecture_id = '1'
        @content.valid?
        expect(@content.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'userが紐付いていなければ保存できない' do
        @content.user = nil
        @content.valid?
        expect(@content.errors.full_messages).to include("User must exist")
      end
    end
  end
end
