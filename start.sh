#!/bin/bash
# run specific function: . start.sh; venv

venv () {
  env="${2:-fastapienv}"

  if [ $1 = "create" ] || [ $1 = "-c" ];
    then python3 -m venv $env

  elif [ $1 = "activate" ] || [ $1 = "-a" ];
    then . $env/bin/activate

  elif [ $1 = "deactivate" ] || [ $1 = "-d" ];
    then
      . $env/bin/activate
      cd $env/bin && deactivate && cd ../..
  fi
}


start () {
  venv activate

  if [ $1 = 'install' ] || [ $1 = '-i' ];
    then python3 -m pip install -r requirements.txt
  elif [ $1 = 'run' ] || [ $1 = '-r' ];
    then uvicorn books:app --reload
  fi

  venv deactivate
}

if [ $1 ];
  then start $1
fi