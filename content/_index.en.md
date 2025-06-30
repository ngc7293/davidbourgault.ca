+++
title = "David Bourgault"
author = "David Bourgault <contact@davidbourgault.ca>"
+++

# David Bourgault

Hi! I'm a software developer. By day I work on pathfinding and data
compression at [Transit](https://transit.app), and by night I sometimes do other
things.

- [Projects](#projects)
- [Contact](#contact)

## Projects

### Hixi

Historical Bixi = Hixi, a GBFS station status archiver. Scrapes a configured
[GBFS](https://gbfs.org/) feed and ingest every station's bikes and docks
availability into a time series database. The hope is that, with enough data, I
could create models to predict availability for any station at any given time.
This could lead to better origin or arrival stations when planning a bikeshare
trip.

It comes with a simple frontend to see any stations' current and historical
availability over the last 24 hours. I'm running an instance for my local
service (Bixi) at mtl.hixi.ca.

The backend is written in Golang and relies heavily on TimescaleDB and PostGIS.
The frontend is built with Svelte and Leaflet.

[Website](https://mtl.hixi.ca) / [Github](https://github.com/ngc7293/hixi)

### qqr

A simple, no bullshit QR code generator. I was getting fed up with seeing
non-tech people fall into the trap of using online generators that charge you
for every "scan" by enforcing redirects through their servers. Open-sourced QR
code generating tools and libraries are plenty, but few of them have b
interfaces, rendering them unusable to the less technically inclined.

QQR will generate high-resolution PNG images for any textual input. No styling.
You can either visit the site's main page and use the text input, or `GET` any
sub-path: the server will QR-encode any path element after the initial `/`. This
means you can, in theory, use it as source for `<img>` tags, but please don't.

The server's built with Rust, the frontend is a few lines of raw HTML and JS
inlined in the server.

[Website](https://davidbourgault.ca/qr/) / [Github](https://github.com/ngc7293/qqr)

### Mappe

A simple online tool, built to help me visualize multiple GeoJSON and encoded 
polylines side-by-side. Built with Svelte and Mapbox GL.

[Website](https://davidbourgault.ca/map/) / [Github](https://github.com/ngc7293/mappe)

## Contact

 - [contact@davidbourgault.ca](mailto:contact@davidbourgault.ca)
 - [linkedin](https://linkedin.com/in/davidbourgault)
