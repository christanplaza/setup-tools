echo 'Starting Ruby Installation, please enter a specific Ruby Version (e.g 2.6.6): '

read -p 'Ruby Version: ' rubyver

echo Installing Ruby $rubyver

rvm install $rubyver
