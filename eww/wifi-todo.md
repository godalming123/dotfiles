# wifi todo

- get wifi network list:
`nmcli dev wifi list`

- get a clean wifi network list
`nmcli --fields "IN-USE,SSID,SECURITY" dev wifi list`

- turn wifi on/off:
`nmcli radio wifi on` /
`nmcli radio wifi off`

- get a quik status:
`nmcli -o`

- connect to a new wifi network
`sudo nmcli --ask dev wifi connect network-name`

- connect to a network with a known password:
`nmcli con up network-name`

- list already known networks:
`nmcli con show`

- disconnect from a network:
`nmcli con down network-name`