desc 'Update pot file'
task :pot do
  require 'gettext/utils'
  require 'nkf'

  pot = 'locale/pinto.pot'
  if File.exist? pot
    mtime = File.mtime(pot).strftime('%Y%m%d%H%M%S')
    File.rename pot, pot + '.' + mtime
  end

  GetText.rgettext Dir.glob('view/*.erb'), pot

  contents = File.read(pot)
  contents = NKF.nkf('-Lu', contents)

  file = File.open(pot, 'w').binmode
  file.write contents
  file.close
end

desc "Create mo files"
task :mo do
  require 'nkf'

  pot = 'locale/pinto.pot'
  pot_mtime = File.mtime(pot).strftime('%Y-%m-%d %H:%M+0900')

  Dir.glob('locale/*/*.po') do |po|
    po_mtime = File.mtime(po).strftime('%Y-%m-%d %H:%M+0900')

    contents = File.read(po)
    contents.sub!(/(POT-Creation-Date: )(\\n")/, '\1' + pot_mtime + '\2')
    contents.sub!(/(PO-Revision-Date: )(\\n")/,  '\1' + po_mtime  + '\2')
    contents = NKF.nkf('-Lu', contents)

    file = File.open(po, 'w').binmode
    file.write contents
    file.close
  end

  require 'gettext/utils'
  GetText.create_mofiles(true, 'locale', 'locale', '%s')
end
