$LOAD_PATH << 'lib'
require 'pinto'

describe 'Pinto::Locale.list' do
  it 'should return locale list' do
    locales = Pinto::Locale.list
    locales.should == [
      Pinto::Locale.new('en'),
      Pinto::Locale.new('ja')
    ]
  end
end

describe 'Pinto::Locale.new' do
  it 'should raise ArgumentError when locale is not String' do
    lambda {Pinto::Locale.new(nil)}.should raise_error(
      ArgumentError, 'locale must be String'
    )
  end
end

describe 'Pinto::Locale#others' do
  it 'should return only "ja" when "en" is given' do
    base_locale = Pinto::Locale.new('en')
    other_locales = base_locale.others
    other_locales.should == [
      Pinto::Locale.new('ja')
    ]
  end

  it 'should return only "en" when "ja" is given' do
    base_locale = Pinto::Locale.new('ja')
    other_locales = base_locale.others
    other_locales.should == [
      Pinto::Locale.new('en')
    ]
  end
end

describe 'Pinto::Locale#to_s' do
  it 'should return given locale' do
    locale = Pinto::Locale.new('en')
    locale.to_s.should == 'en'
  end
end

describe 'Pinto::Locale#name' do
  it 'should return name in English when translator.locale is English' do
    locale = Pinto::Locale.new('en')
    name = locale.name(Pinto::Translator.new(locale))
    name.should == 'English'
  end

  it 'should return name in Japanese when translator.locale is Japanese' do
    locale = Pinto::Locale.new('ja')
    name = locale.name(Pinto::Translator.new(locale))
    name.should == '日本語'
  end
end

describe 'Pinto::Locale#==' do
  it 'should return true if locales are the same in String' do
    locale1 = Pinto::Locale.new('en')
    locale2 = Pinto::Locale.new('en')
    locale1.should == locale2
  end

  it 'should return false if locales are not the same in String' do
    locale1 = Pinto::Locale.new('en')
    locale2 = Pinto::Locale.new('ja')
    locale1.should_not == locale2
  end
end
