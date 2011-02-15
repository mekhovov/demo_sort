
File.open('.\run_ds_with_splash_screen.bat', 'w') do |f|
  f.puts 'echo off'
  f.puts 'cls'
  f.puts 'echo "   ---------------------------------------------------   "'
  f.puts 'echo "   |                DemoSort launcher                |   "'
  f.puts 'echo "   |              with  splash  screen              |   "'
  f.puts 'echo "   ---------------------------------------------------   "'
  f.puts 'echo "                                                         "'
  f.puts 'echo "                                                         "'
  f.puts 'echo "  ---> run keyrus <---  "'
  f.puts '.\DS_data\keyrus\rk.com'
  f.puts 'echo "                                                         "'
  f.puts 'echo "  ---> run start splash screen <---  "'
  f.puts '.\DS_data\splash_screen\DS_splash_start.exe'
  f.puts 'echo "                                                         "'
  f.puts 'echo "  ---> run DemoSort <---  "'
  f.puts '.\DS.exe'
  f.puts 'echo "                                                         "'
  f.puts 'echo "  ---> run end splash screen <---  "'
  f.puts '.\DS_data\splash_screen\DS_splash_end.exe'
  f.puts 'echo "                                                         "'
  f.puts 'echo "  ===> run completed <===  "'
end

system('.\run_ds_with_splash_screen.bat')