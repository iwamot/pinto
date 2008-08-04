$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::Language.list' do
  it 'should raise ArgumentError when lang is not Pinto::Type::Language' do
    lambda {Pinto::Language.list(nil)}.should raise_error(
      ArgumentError, 'lang must be Pinto::Type::Language'
    )
  end

  it 'should return language list in English when no parameter is given' do
    languages = Pinto::Language.list
    languages.should == [
      {'code' => 'en', 'name' => 'English'},
      {'code' => 'ja', 'name' => 'Japanese'}
    ]
  end

  it 'should return language list in English when "en" is given' do
    disp_lang = Pinto::Type::Language.new('en')
    languages = Pinto::Language.list(disp_lang)
    languages.should == [
      {'code' => 'en', 'name' => 'English'},
      {'code' => 'ja', 'name' => 'Japanese'}
    ]
  end

  it 'should return language list in Japanese when "ja" is given' do
    disp_lang = Pinto::Type::Language.new('ja')
    languages = Pinto::Language.list(disp_lang)
    languages.should == [
      {'code' => 'en', 'name' => '英語'},
      {'code' => 'ja', 'name' => '日本語'}
    ]
  end
end

describe 'Pinto::Language.others' do
  it 'should raise ArgumentError when base_lang is not Pinto::Type::Language' do
    lambda {Pinto::Language.others(nil)}.should raise_error(
      ArgumentError, 'base_lang must be Pinto::Type::Language'
    )
  end

  it 'should return only "ja" when "en" is given' do
    base_lang = Pinto::Type::Language.new('en')
    other_languages = Pinto::Language.others(base_lang)
    other_languages.should == [
      {'code' => 'ja', 'name' => 'Japanese'}
    ]
  end

  it 'should return only "en" when "ja" is given' do
    base_lang = Pinto::Type::Language.new('ja')
    other_languages = Pinto::Language.others(base_lang)
    other_languages.should == [
      {'code' => 'en', 'name' => '英語'}
    ]
  end
end
