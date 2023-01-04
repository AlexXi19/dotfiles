import subprocess

git_projects = subprocess.check_output("find ~/Desktop/CS -mindepth 1 -maxdepth 1 -type d", shell=True).splitlines()
tmux_sessions = subprocess.check_output("tmux list-sessions -F \"#{session_name}\"", shell=True).splitlines()
git_projects = [i.decode() for i in git_projects]
tmux_sessions = [i.decode() for i in tmux_sessions]

# Remove duplicate 
session_list = git_projects
git_projects_name_list = [dir.split("/")[-1] for dir in session_list]

for session in tmux_sessions:
    if session not in git_projects_name_list: 
        session_list.append(session)

# Remove weird elements like spaces 
session_list = filter(lambda x: len(x), session_list)

# Write to output


for i in session_list:
    print(i)
