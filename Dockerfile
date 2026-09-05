FROM nginx:1.27-alpine

COPY articles/demo-irrigation/taiwan-md-preview.html /usr/share/nginx/html/index.html
COPY articles/demo-irrigation/taiwan-md-preview.html /usr/share/nginx/html/articles/demo-irrigation/taiwan-md-preview.html
COPY articles/demo-irrigation/taiwan-md-preview.html /usr/share/nginx/html/articles/demo-irrigation/index.html
COPY articles/bathymetry/taiwan-md-preview.html /usr/share/nginx/html/articles/bathymetry/taiwan-md-preview.html
COPY articles/bathymetry/taiwan-md-preview.html /usr/share/nginx/html/articles/bathymetry/index.html
COPY articles/bathymetry/article.md /usr/share/nginx/html/articles/bathymetry/article.md
COPY articles/bathymetry/data.json /usr/share/nginx/html/articles/bathymetry/data.json
COPY articles/bathymetry/embeds.json /usr/share/nginx/html/articles/bathymetry/embeds.json
COPY articles/bathymetry/figures/hero-isobath.png /usr/share/nginx/html/articles/bathymetry/figures/hero-isobath.png
COPY articles/bathymetry/figures/hero-isobath-final.png /usr/share/nginx/html/articles/bathymetry/figures/hero-isobath-final.png
COPY articles/bathymetry/figures/islands-isobath.png /usr/share/nginx/html/articles/bathymetry/figures/islands-isobath.png

RUN sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf

EXPOSE 8080
