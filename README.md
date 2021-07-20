# ppi_connect

Indonesia ISS mobile application project: PPI-Connect

## Contributors:
```
    - A Nahda La Roiba
    - Alifian Naufal Ravi Hidayat
    - Baron Gobi Ramadhan Natanegara
    - Kemal Achmad Zulkarnain
```
Credentials for the auth can be accessed in json-server/Credentials.txt
## Installation

Clone the repo

```
git clone https://github.com/ravihidayat/ppi-connect.git
```

Install dependencies

```
flutter pub get
```

## Contributing

Please create a new branch for each new feature that you will be working on. Don't forget to create frequent commits. If you find issues, please open an issue to discuss, and assign it to someone. It could be you, and it could be anyone else.

## Pulling Changes in The Main Branch

Please do this whenever you are going to work on something. It pulls the current state of the code in the Main branch.

```
git pull
```

Though, in some cases, you might want to pull all branches available in the remote along with their changes. You can also do this:

```
git fetch --all
```

## Pushing to A Branch That You Just Created

Set the remote repo to push on your local machine, for first time push. Onwards, skip this step.

```
git remote add origin https://github.com/ravihidayat/ppi-connect.git
```

Push to a specific branch. Make sure that you don't push directly to main.

```
git push -u origin <branch-name>
```