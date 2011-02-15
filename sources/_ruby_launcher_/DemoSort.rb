
File.open('.\run_ds.bat', 'w') do |f|
  f.puts 'echo off'
  f.puts 'cls'
  f.puts 'echo "   ---------------------------------------------------   "'
  f.puts 'echo "   |                DemoSort launcher                |   "'
  f.puts 'echo "   ---------------------------------------------------   "'
  f.puts 'echo "                                                         "'
  f.puts 'echo "                                                         "'
  f.puts 'echo "  ---> run keyrus <---  "'
  f.puts '.\DS_data\keyrus\rk.com'
  f.puts 'echo "                                                         "'
  f.puts 'echo "  ---> run DemoSort <---  "'
  f.puts '.\DS.exe'
  f.puts 'echo "                                                         "'
  f.puts 'echo "  ===> run completed <===  "'
end

system('.\run_ds.bat')