if [ -f "./src/a.txt" ]; then
  ln -s a.txt b.txt
  if [ -f "./src/b.txt" ]; then
    if [ $(wc -c < "./src/b.txt") -lt 30 ]; then
      echo "Script is less than 30 characters in length."
    else
      echo "Script is more than 30 characters in length."
    fi
  else
    echo "b.txt not found. Please create b.txt file first."
  fi
else
  echo "a.txt not found. Please create a.txt file first."
fi
