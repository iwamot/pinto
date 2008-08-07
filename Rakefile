require 'gettext/utils'
require 'nkf'

POT_FILE = 'locale/pinto.pot'

desc 'Update pot file'
task :pot do
  if File.exist? POT_FILE
    mtime = File.mtime(POT_FILE).strftime('%Y%m%d%H%M%S')
    File.rename(POT_FILE, POT_FILE + '.' + mtime)
  end

  GetText.rgettext(Dir.glob('{lib,view}/**/*.{rb,erb}'), POT_FILE)

  contents = File.read(POT_FILE)
  contents = NKF.nkf('-Lu', contents)

  file = File.open(POT_FILE, 'w').binmode
  file.write(contents)
  file.close
end

desc 'Create mo files'
task :mo do
  pot_mtime = File.mtime(POT_FILE).strftime('%Y-%m-%d %H:%M+0900')

  Dir.glob('locale/*/*.po') do |po|
    po_mtime = File.mtime(po).strftime('%Y-%m-%d %H:%M+0900')

    contents = File.read(po)
    contents.sub!(/(POT-Creation-Date: ).*?(\\n")/, '\1' + pot_mtime + '\2')
    contents.sub!(/(PO-Revision-Date: ).*?(\\n")/,  '\1' + po_mtime  + '\2')
    contents = NKF.nkf('-w -Lu', contents)

    file = File.open(po, 'w').binmode
    file.write(contents)
    file.close
  end

  GetText.create_mofiles(true, 'locale', 'locale', '%s')
end

require 'rake'
require 'spec/rake/spectask'

desc 'Run RSpec with RCov'
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.rcov = true
  t.spec_opts = ['-c', '-fs']
  t.rcov_opts = ['-x', 'spec']
end

desc 'Format for Git'
task :format do
  Dir.glob('{lib,coverage,spec}/**/*.{rb,html}') do |f|
    contents = File.read(f)
    contents = NKF.nkf('-Lu', contents)
    contents.gsub!(/ +(\n)/, '\1')

    file = File.open(f, 'w').binmode
    file.write(contents)
    file.close
  end
end
