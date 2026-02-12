# Build stage
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /source

# Copy sln and restore (copies csproj preserving paths)
COPY . ./
RUN dotnet restore "Lab3.sln"

# Publish specific project
RUN dotnet publish "Week5Api/Week5Api.csproj" -c release -o /app --no-restore

# Runtime stage (unchanged)
FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app
COPY --from=build /app .

ENTRYPOINT ["dotnet", "Week5Api.dll"]
