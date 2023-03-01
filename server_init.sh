#!/bin/bash
arg1="$1"
arg2="$2"
arg3="$3"
webserver_path="webserver"
repo_server_path="repo-server"

case $arg1 in
	"up")
                case $arg2 in
                        "web")
				if [[ $arg3 = 'login' ]];
				then
					cd $webserver_path && vagrant up -vvv && vagrant ssh
				else
					cd $webserver_path && vagrant up
				fi
                                ;;
                        "repo")
				if [[ $arg3 = 'login' ]];
                                then
                                        cd $repo_server_path && vagrant up -vvv && vagrant ssh
                                else
                                        cd $repo_server_path && vagrant up
                                fi
                                ;;
                        *)
                                 printf "available options [web: webserver , repo: repository server]\n"
		 esac
                ;;
	"down")
                case $arg2 in
                        "web")
				cd $webserver_path && vagrant halt
                                ;;
                        "repo")
				cd $repo_server_path && vagrant halt
                                ;;
                        *)
                                 printf "available options [web: webserver , repo: repository server]\n"
		 esac
                ;;
		*)
			printf "available options [up , down]\n"
	esac
