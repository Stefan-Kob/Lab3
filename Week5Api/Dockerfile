# Build stage
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /source

# Copy and restore NuGet packages first for better caching
COPY *.sln .
COPY *.csproj ./
RUN dotnet restore

# Copy source and publish
COPY . ./
RUN dotnet publish -c release -o /app --no-restore

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app
COPY --from=build /app .

# Expose port
EXPOSE 10000

ENTRYPOINT ["dotnet", "Week5Api.dll"]
    
