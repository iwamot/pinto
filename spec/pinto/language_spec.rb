$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::Language.list' do
  it 'should raise ArgumentError when lang is not Pinto::Language::Code' do
    lambda {Pinto::Language.list(nil)}.should raise_error(
      ArgumentError, 'lang must be Pinto::Language::Code'
    )
  end

  it 'should return language list in English when no parameter is given' do
    languages = Pinto::Language.list
    languages.should == [
      Pinto::Language.new(Pinto::Language::Code.new('en'),
                          Pinto::Language::Name.new('English')),
      Pinto::Language.new(Pinto::Language::Code.new('ja'),
                          Pinto::Language::Name.new('Japanese'))
    ]
  end

  it 'should return language list in English when "en" is given' do
    disp_lang = Pinto::Language::Code.new('en')
    languages = Pinto::Language.list(disp_lang)
    languages.should == [
      Pinto::Language.new(Pinto::Language::Code.new('en'),
                          Pinto::Language::Name.new('English')),
      Pinto::Language.new(Pinto::Language::Code.new('ja'),
                          Pinto::Language::Name.new('Japanese'))
    ]
  end

  it 'should return language list in Japanese when "ja" is given' do
    disp_lang = Pinto::Language::Code.new('ja')
    languages = Pinto::Language.list(disp_lang)
    languages.should == [
      Pinto::Language.new(Pinto::Language::Code.new('en'),
                          Pinto::Language::Name.new('英語')),
      Pinto::Language.new(Pinto::Language::Code.new('ja'),
                          Pinto::Language::Name.new('日本語'))
    ]
  end
end

describe 'Pinto::Language.others' do
  it 'should raise ArgumentError when base_lang is not Pinto::Language::Code' do
    lambda {Pinto::Language.others(nil)}.should raise_error(
      ArgumentError, 'base_lang must be Pinto::Language::Code'
    )
  end

  it 'should return only "ja" when "en" is given' do
    base_lang = Pinto::Language::Code.new('en')
    other_languages = Pinto::Language.others(base_lang)
    other_languages.should == [
      Pinto::Language.new(Pinto::Language::Code.new('ja'),
                          Pinto::Language::Name.new('Japanese'))
    ]
  end

  it 'should return only "en" when "ja" is given' do
    base_lang = Pinto::Language::Code.new('ja')
    other_languages = Pinto::Language.others(base_lang)
    other_languages.should == [
      Pinto::Language.new(Pinto::Language::Code.new('en'),
                          Pinto::Language::Name.new('英語'))
    ]
  end
end

describe 'Pinto::Language.new' do
  it 'should raise ArgumentError when code is not Pinto::Language::Code' do
    name = Pinto::Language::Name.new('English')
    lambda {Pinto::Language.new(nil, name)}.should raise_error(
      ArgumentError, 'code must be Pinto::Language::Code'
    )
  end

  it 'should raise ArgumentError when name is not Pinto::Language::Name' do
    code = Pinto::Language::Code.new('en')
    lambda {Pinto::Language.new(code, nil)}.should raise_error(
      ArgumentError, 'name must be Pinto::Language::Name'
    )
  end
end

describe 'Pinto::Language#code' do
  it 'should return given code' do
    code = Pinto::Language::Code.new('en')
    language = Pinto::Language.new(code,
                                   Pinto::Language::Name.new('English'))
    language.code.should == code
  end
end

describe 'Pinto::Language#name' do
  it 'should return given name' do
    name = Pinto::Language::Name.new('English')
    language = Pinto::Language.new(Pinto::Language::Code.new('en'),
                                   name)
    language.name.should == name
  end
end

describe 'Pinto::Language#==' do
  it 'should return true if instance variables are the same in String' do
    language1 = Pinto::Language.new(Pinto::Language::Code.new('en'),
                                    Pinto::Language::Name.new('English'))
    language2 = Pinto::Language.new(Pinto::Language::Code.new('en'),
                                    Pinto::Language::Name.new('English'))
    language1.should == language2
  end

  it 'should return false if instance variables are not the same in String' do
    language1 = Pinto::Language.new(Pinto::Language::Code.new('en'),
                                    Pinto::Language::Name.new('English'))
    language2 = Pinto::Language.new(Pinto::Language::Code.new('ja'),
                                    Pinto::Language::Name.new('Japanese'))
    language1.should_not == language2
  end
end