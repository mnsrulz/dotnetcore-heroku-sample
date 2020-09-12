# NuGet restore
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /AnyWorkDirectory
COPY . .

# publish
FROM build AS publish
WORKDIR /AnyWorkDirectory/src/webapi
RUN dotnet publish -c Release -o /AnyWorkDirectory/publish

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
WORKDIR /app
COPY --from=publish /AnyWorkDirectory/publish .
# ENTRYPOINT ["dotnet", "dotnet-heroku-sample.dll"]
# heroku uses the following
CMD ASPNETCORE_URLS=http://*:$PORT dotnet dotnet-heroku-sample.dll