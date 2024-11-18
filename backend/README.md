# Overview

1. Create `.env` file 

```
cp .env.example .env
```

2. Update `.env` params with private key, token id, project id 

3. Install the packages

```
npm install
```

4. Run the server 
```
npm start
```
Open [http://localhost:3001](http://localhost:3001)

5. Run using Docker composer 

```
docker composer up -d
```

Open up ngrok deeplink like below

```ngrok http --domain=right-minnow-leading.ngrok-free.app 3001```