# NuGet restore
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /anysrcdirectory
COPY *.sln .
COPY src/webapi/*.csproj src/webapi/
RUN dotnet restore
COPY . .

FROM build AS testing
WORKDIR /anysrcdirectory/src/webapi
RUN dotnet build

# publish
FROM build AS publish
WORKDIR /anysrcdirectory/src/webapi
RUN dotnet publish -c Release -o /anysrcdirectory/publish

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
WORKDIR /app
COPY --from=publish /anysrcdirectory/publish .
# ENTRYPOINT ["dotnet", "dotnet-heroku-sample.dll"]
# heroku uses the following
CMD ASPNETCORE_URLS=http://*:$PORT dotnet dotnet-heroku-sample.dll