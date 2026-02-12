FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

# Copy csproj with path for caching
COPY ["Week5Api/Week5Api.csproj", "Week5Api/"]
RUN dotnet restore "Week5Api/Week5Api.csproj"

# Copy source
COPY . .

# Publish
WORKDIR /src/Week5Api
RUN dotnet publish "Week5Api.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 10000
ENTRYPOINT ["dotnet", "Week5Api.dll"]
