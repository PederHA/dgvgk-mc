# Prints current ngrok url to stdout
import httpx

r = httpx.get("http://mcserver:4040/api/tunnels")
d = r.json()
url = d["tunnels"][0]["public_url"].split("tcp://")[1]
print(url)

