## DESCRIPTION

Simple lab to view the minimal requirements to set up a tor service. For this example the tor service will be a simple netcat process listening on an unix socket.

## TEST

First run the containers:

`docker compose up -d`

Then you'll have to wait that on both containers the tor circuit has been stablished. Then just run in the client:

`nc -x 127.0.0.1:9050 PASTE_ONION_HOSTNAME_FROM_SERVICE 666`

Explanation:

| ARGUMENT | DESCRIPTION |
|:--------:| ----------- |
| nc | netcat executable |
| -x 127.0.0.1:9050 | Proxy to enter the tor's network. You can change the default port from the torrc file, with the SocksPort directive |
| PASTE_ONION_HOSTNAME_FROM_SERVICE | The onion service name. Should be in the `hostname` file, located inside whatever directory you setted on the HiddenServiceDir directive of the service's torrc file. |
| 666 | The onion service port. Should be whatever value you setted on the HiddenServicePort directive of your service's torrc file. |

Now whatever you type from this point on, will be sended to your tor's service. Go to your service's log, and confirm it. (NOTE: the tor's network is slower than your normal network connection, so you may notice large delays)

## NOTE

You can use the client's container as a proxy for your docker host, in case you want to access the tor's network from the outside. Just forward the exposed port.
