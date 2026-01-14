@echo off
@echo This cmd file creates a Data API Builder configuration based on the chosen database objects.
@echo To run the cmd, create an .env file with the following contents:
@echo dab-connection-string=your connection string
@echo ** Make sure to exclude the .env file from source control **
@echo **
dotnet tool install -g Microsoft.DataApiBuilder
dab init -c dab-config.json --database-type mssql --connection-string "@env('dab-connection-string')" --host-mode Development
@echo Adding tables
dab add "AspNetRoleClaim" --source "[dbo].[AspNetRoleClaims]" --fields.include "Id,RoleId,ClaimType,ClaimValue" --permissions "anonymous:*" 
dab add "AspNetRole" --source "[dbo].[AspNetRoles]" --fields.include "Id,Name,NormalizedName,ConcurrencyStamp" --permissions "anonymous:*" 
dab add "AspNetUserClaim" --source "[dbo].[AspNetUserClaims]" --fields.include "Id,UserId,ClaimType,ClaimValue" --permissions "anonymous:*" 
dab add "AspNetUserLogin" --source "[dbo].[AspNetUserLogins]" --fields.include "LoginProvider,ProviderKey,ProviderDisplayName,UserId" --permissions "anonymous:*" 
dab add "AspNetUserRole" --source "[dbo].[AspNetUserRoles]" --fields.include "UserId,RoleId" --permissions "anonymous:*" 
dab add "AspNetUser" --source "[dbo].[AspNetUsers]" --fields.include "Id,FullName,UserName,NormalizedUserName,Email,NormalizedEmail,EmailConfirmed,PasswordHash,SecurityStamp,ConcurrencyStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEnd,LockoutEnabled,AccessFailedCount" --permissions "anonymous:*" 
dab add "AspNetUserToken" --source "[dbo].[AspNetUserTokens]" --fields.include "UserId,LoginProvider,Name,Value" --permissions "anonymous:*" 
@echo Adding views and tables without primary key
@echo Adding relationships
dab update AspNetRoleClaim --relationship AspNetRole --target.entity AspNetRole --cardinality one
dab update AspNetRole --relationship AspNetRoleClaim --target.entity AspNetRoleClaim --cardinality many
dab update AspNetUserClaim --relationship AspNetUser --target.entity AspNetUser --cardinality one
dab update AspNetUser --relationship AspNetUserClaim --target.entity AspNetUserClaim --cardinality many
dab update AspNetUserLogin --relationship AspNetUser --target.entity AspNetUser --cardinality one
dab update AspNetUser --relationship AspNetUserLogin --target.entity AspNetUserLogin --cardinality many
dab update AspNetUserRole --relationship AspNetRole --target.entity AspNetRole --cardinality one
dab update AspNetRole --relationship AspNetUserRole --target.entity AspNetUserRole --cardinality many
dab update AspNetUserRole --relationship AspNetUser --target.entity AspNetUser --cardinality one
dab update AspNetUser --relationship AspNetUserRole --target.entity AspNetUserRole --cardinality many
dab update AspNetUserToken --relationship AspNetUser --target.entity AspNetUser --cardinality one
dab update AspNetUser --relationship AspNetUserToken --target.entity AspNetUserToken --cardinality many
@echo Adding stored procedures
@echo **
@echo ** run 'dab validate' to validate your configuration **
@echo ** run 'dab start' to start the development API host **
