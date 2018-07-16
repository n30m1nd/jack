jack
====

By Chris Le Roy (@brompwnie) chris@sensepost.com - \*click\* Noice!

<a href="https://www.blackhat.com/eu-15/arsenal.html/"><img alt="Black Hat Arsenal" src="https://www.toolswatch.org/badges/arsenal/2015.svg" /></a>

Overview
=====
Jack is a web based ClickJacking PoC development assistance tool.
This fork in particular, helps bypassing JavaScript anti-clickjacking techniques.

This Fork
=====

This fork of Jack was done to bypass Frame Buster Scripts to demonstrate that the `X-Frame-Options` header should be implemented.
It also includes a `start_jack.sh` script to start it all with instructions.

Contents
====
Jack Contains:
* resources/**
* index.html
* sandbox.html
* start_jack.sh

Requirements
====
* Python
  * SimpleHTTPServer module
* Netcat

Running
====
Run `./start_jack.sh`, access the Jack Server's webpage and fill the inputs as needed.

Jack is web based and requires either a web server to serve its HTML and JS content or can be run locally. Typically something like Apache will suffice but anything that is able to serve HTML content to a browser will do. Simply download Jack's contents and open "index.html" with your browser locally and Jack is ready to go. Alternatively if you prefer the older UI for Jack, open "oldIndex.html" with your browser for the old UI.

Notes
====
Depending on your setup, you may need to configure your browser to allow Jack to load resources that are being served via encrypted channels.


License
===
Jack is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License (http://creativecommons.org/licenses/by-nc-sa/4.0) Permissions beyond the scope of this license may be available at http://sensepost.com/contact.
