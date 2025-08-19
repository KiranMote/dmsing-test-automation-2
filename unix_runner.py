import os
import paramiko
from dotenv import load_dotenv

# Load environment variables from .env
load_dotenv(r'C:\Users\kiran\OneDrive\Documents\RecordVideoData2\.env')

SSH_HOST = os.getenv('SSH_HOST')
SSH_USER = os.getenv('SSH_USER')
SSH_KEY_PATH = os.getenv('SSH_KEY_PATH')
REMOTE_SCRIPT_PATH = os.getenv('REMOTE_SCRIPT_PATH', '/home/kiranmote/job_status_example.sh')


def run_unix_job():
    try:
        print(f"Connecting to {SSH_HOST} as {SSH_USER}...")
        key = paramiko.RSAKey.from_private_key_file(SSH_KEY_PATH)
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(SSH_HOST, username=SSH_USER, pkey=key)
        print(f"Running remote script: {REMOTE_SCRIPT_PATH}")
        stdin, stdout, stderr = ssh.exec_command(f'bash {REMOTE_SCRIPT_PATH}')
        output = stdout.read().decode()
        error = stderr.read().decode()
        print("--- Job Status Output ---")
        print(output)
        if error:
            print("--- Errors ---")
            print(error)
        ssh.close()
        return output, error
    except Exception as e:
        print(f"Error: {e}")
        return None, str(e)

if __name__ == "__main__":
    run_unix_job()
