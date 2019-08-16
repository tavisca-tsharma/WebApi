FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS runtime
WORKDIR /app
COPY ./WebApplication10/publish ./
ENTRYPOINT ["dotnet", "WebApplication10.dll"]