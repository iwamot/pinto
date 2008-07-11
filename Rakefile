require 'gettext/utils'
require 'nkf'

POT_FILE = 'locale/pinto.pot'

desc 'Update pot file'
task :pot do
  if File.exist? POT_FILE
    mtime = File.mtime(POT_FILE).strftime('%Y%m%d%H%M%S')
    File.rename(POT_FILE, POT_FILE + '.' + mtime)
  end

  GetText.rgettext(Dir.glob('view/*.erb'), POT_FILE)

  contents = File.read(POT_FILE)
  contents = NKF.nkf('-Lu', contents)

  file = File.open(POT_FILE, 'w').binmode
  file.write(contents)
  file.close
end

desc "Create mo files"
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
