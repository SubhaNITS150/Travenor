FROM ghcr.io/cirruslabs/flutter:stable

WORKDIR /app

COPY pubspec.* ./
RUN flutter pub get

COPY . .

EXPOSE 5037

CMD ["flutter", "run"]