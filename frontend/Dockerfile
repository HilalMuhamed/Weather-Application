
FROM ghcr.io/cirruslabs/flutter:latest AS build

WORKDIR /app


RUN git config --global --add safe.directory /sdks/flutter


RUN flutter config --no-analytics


COPY frontend/pubspec.* ./
RUN flutter pub get


COPY frontend/ ./


RUN flutter build web --release


FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
