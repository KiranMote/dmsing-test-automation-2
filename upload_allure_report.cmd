@echo off
REM Batch script to upload Allure report zip file to Jira using curl
REM JIRA_EMAIL and JIRA_API_TOKEN are fetched from environment variables
set EMAIL=%JIRA_EMAIL%
set TOKEN=%JIRA_API_TOKEN%
set FILEPATH=%1
set JIRAURL=https://capgemini-team-l0ib3p43.atlassian.net/rest/api/3/issue/SCRUM-17/attachments
curl -D- -u %EMAIL%:%TOKEN% -X POST -H "X-Atlassian-Token: no-check" -F "file=@%FILEPATH%" %JIRAURL%
