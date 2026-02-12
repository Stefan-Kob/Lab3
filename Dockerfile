# Build stage
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

# Copy sln + all csprojs for restore (preserves folder structure)
COPY ["Lab3.sln", "./"]
COPY ["Week5Api/Week5Api.csproj", "Week5Api/"]
RUN dotnet restore "Lab3.sln"

# Copy source
COPY . .

# Publish from subdir context
WORKDIR "/src/Week5Api"
RUN dotnet publish "Week5Api.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Runtime
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 10000
ENTRYPOINT ["dotnet", "Week5Api.dll"]
