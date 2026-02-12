# Build stage
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

# Copy csproj and restore as single project
COPY ["WeekApi.csproj", "./"]
RUN dotnet restore "WeekApi.csproj"

# Copy source and publish
COPY . .
WORKDIR "/src"
RUN dotnet publish "WeekApi.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 10000
ENTRYPOINT ["dotnet", "WeekApi.dll"]
