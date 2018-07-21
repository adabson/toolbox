@Echo off
rem HKEY_CURRENT_USER\Software\Microsoft\Command Processor AutoRun=C:\doskey.bat
rem DO NOT USE THIS TO CHANGE THE DEFAULT DIRECTORY. It will bite you in the ass.

doskey subl="C:\Program Files\Sublime Text 3\sublime_text.exe" $*
doskey sublime="C:\Program Files\Sublime Text 3\sublime_text.exe" $*
doskey gitdir=F: $T cd f:\git\$*
doskey g = git g $*

@Echo on