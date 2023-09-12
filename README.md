# Timer

## Cloning
git clone git@github.com-parasoft-se:parasoft-se/timer.git

## SSH Keys
Download the .ssh files and put them in your ~/.ssh folder.
Create an ssh config file in the same folder if it doesn't exist:
```
touch config
```
Update the contents to add the ```parasoft-se``` account:
```
#parasoft-se account
Host github.com-parasoft-se
HostName github.com
User git
IdentityFile ~/.ssh/id_ed25519_parasoft.se

#a_different_github_account account
Host github.com-a_different_github_account
HostName github.com
User git
IdentityFile ~/.ssh/id_ed25519
```