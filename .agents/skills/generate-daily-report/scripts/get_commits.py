import subprocess
import sys
import datetime
import re

def get_commits(target_date_str=None):
    # Parse date or default to today
    current_year = datetime.datetime.now().year
    
    if target_date_str:
        # Try DD/MM format
        match = re.match(r"^(\d{1,2})/(\d{1,2})$", target_date_str)
        if match:
            day, month = map(int, match.groups())
            target_date = datetime.date(current_year, month, day)
        else:
            # Try YYYY-MM-DD format
            try:
                target_date = datetime.datetime.strptime(target_date_str, "%Y-%m-%d").date()
            except ValueError:
                print(f"Error: Invalid date format '{target_date_str}'. Use DD/MM or YYYY-MM-DD.")
                sys.exit(1)
    else:
        target_date = datetime.date.today()
        
    date_since = f"{target_date} 00:00:00"
    date_until = f"{target_date} 23:59:59"
    
    print(f"--- Git Commits for {target_date.strftime('%d/%m/%Y')} ---")
    
    # Run git log to get hash, author, subject and date
    cmd = [
        "git", "log", 
        f"--since={date_since}", 
        f"--until={date_until}", 
        "--pretty=format:%h|%an|%s",
        "--no-merges"
    ]
    
    try:
        output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode("utf-8").strip()
    except subprocess.CalledProcessError as e:
        print(f"Error running git: {e.output.decode('utf-8')}")
        sys.exit(1)
        
    if not output:
        print("No commits found for this date.")
        return
        
    commits = output.split("\n")
    for commit in commits:
        parts = commit.split("|")
        if len(parts) < 3:
            continue
        commit_hash, author, subject = parts[0], parts[1], parts[2]
        print(f"\nCommit: {commit_hash} by {author}")
        print(f"Message: {subject}")
        
        # Get files changed in this commit
        show_cmd = ["git", "show", "--name-status", "--oneline", commit_hash]
        try:
            show_output = subprocess.check_output(show_cmd).decode("utf-8").strip()
            # The first line is the commit info, following lines are files changed
            show_lines = show_output.split("\n")[1:]
            print("Changed Files:")
            for line in show_lines:
                if line.strip():
                    print(f"  {line.strip()}")
        except subprocess.CalledProcessError:
            pass

if __name__ == "__main__":
    target_date = sys.argv[1] if len(sys.argv) > 1 else None
    get_commits(target_date)
