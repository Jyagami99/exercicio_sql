CREATE DATABASE profilesdriven;
CREATE TABLE states (id SERIAL PRIMARY KEY, "name" TEXT NOT NULL);
CREATE TABLE cities (id SERIAL PRIMARY KEY, "name" TEXT NOT NULL, "stateId" INTEGER NOT NULL REFERENCES "states"("id"));
CREATE TABLE customers (id SERIAL PRIMARY KEY, "fullName" TEXT NOT NULL, "cpf" INTEGER NOT NULL, "email" TEXT, "password" TEXT);
CREATE TABLE "customerAddresses" (id SERIAL PRIMARY KEY, "customerId" INTEGER NOT NULL REFERENCES "customers"("id"), street TEXT NOT NULL, "number" INTEGER, "complement" TEXT, postalCode TEXT NOT NULL, "cityId" INTEGER NOT NULL REFERENCES "cities"("id"));
CREATE TABLE "customerPhones" (id SERIAL PRIMARY KEY, "customerId" INTEGER NOT NULL REFERENCES "customers"("id"), "number" INTEGER NOT NULL, "type" TEXT );
CREATE TABLE "bankAccount" (id SERIAL PRIMARY KEY, "customerId" INTEGER NOT NULL REFERENCES "customers"("id"), "accountNumber" INTEGER NOT NULL, "agency" INTEGER NOT NULL, "openDate" TIMESTAMP NOT NULL, "closeDate" TIMESTAMP);
CREATE TABLE transactions (id SERIAL PRIMARY KEY, "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"), "amount" DOUBLE PRECISION, "type" TEXT NOT NULL, "time" TIMESTAMP, "description" TEXT, "cancelled" BOOLEAN DEFAULT FALSE);
CREATE TABLE "creditCards" (id SERIAL PRIMARY KEY, "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"), "name" TEXT, "number" INTEGER, "securityCode" TEXT, "expirationMonth" INTEGER NOT NULL, "expirationYear" INTEGER NOT NULL, "password" TEXT, "limit" INTEGER);