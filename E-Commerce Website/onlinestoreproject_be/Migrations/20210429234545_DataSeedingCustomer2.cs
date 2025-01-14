﻿using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace OnlineStoreProject.Migrations
{
    public partial class DataSeedingCustomer2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 6);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 7);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 8);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 9);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 10);

            migrationBuilder.UpdateData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 11,
                columns: new[] { "PasswordHash", "PasswordSalt", "Username" },
                values: new object[] { new byte[] { 33, 197, 45, 38, 200, 203, 181, 113, 222, 243, 44, 82, 227, 225, 207, 71, 115, 84, 103, 117, 184, 40, 211, 168, 248, 147, 172, 209, 235, 71, 83, 4, 48, 77, 124, 6, 98, 31, 224, 35, 50, 63, 156, 104, 251, 183, 35, 122, 116, 95, 235, 50, 49, 118, 204, 42, 98, 4, 216, 248, 232, 144, 182, 34 }, new byte[] { 134, 130, 170, 250, 55, 205, 34, 248, 214, 131, 234, 168, 39, 162, 32, 254, 203, 202, 11, 163, 249, 214, 95, 226, 225, 215, 205, 202, 25, 194, 215, 96, 61, 47, 3, 30, 189, 79, 60, 169, 120, 114, 169, 79, 233, 92, 9, 7, 202, 192, 210, 242, 166, 54, 189, 174, 54, 36, 51, 49, 6, 72, 54, 235, 37, 41, 219, 93, 22, 192, 214, 202, 128, 185, 40, 164, 191, 134, 178, 97, 156, 82, 147, 217, 240, 47, 22, 170, 160, 132, 94, 211, 76, 43, 68, 87, 207, 207, 199, 39, 29, 223, 186, 138, 113, 233, 86, 14, 238, 119, 148, 69, 197, 120, 242, 96, 246, 177, 78, 234, 123, 22, 159, 198, 68, 7, 80, 219 }, "seco" });

            migrationBuilder.UpdateData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 12,
                columns: new[] { "PasswordHash", "PasswordSalt", "Username" },
                values: new object[] { new byte[] { 33, 197, 45, 38, 200, 203, 181, 113, 222, 243, 44, 82, 227, 225, 207, 71, 115, 84, 103, 117, 184, 40, 211, 168, 248, 147, 172, 209, 235, 71, 83, 4, 48, 77, 124, 6, 98, 31, 224, 35, 50, 63, 156, 104, 251, 183, 35, 122, 116, 95, 235, 50, 49, 118, 204, 42, 98, 4, 216, 248, 232, 144, 182, 34 }, new byte[] { 134, 130, 170, 250, 55, 205, 34, 248, 214, 131, 234, 168, 39, 162, 32, 254, 203, 202, 11, 163, 249, 214, 95, 226, 225, 215, 205, 202, 25, 194, 215, 96, 61, 47, 3, 30, 189, 79, 60, 169, 120, 114, 169, 79, 233, 92, 9, 7, 202, 192, 210, 242, 166, 54, 189, 174, 54, 36, 51, 49, 6, 72, 54, 235, 37, 41, 219, 93, 22, 192, 214, 202, 128, 185, 40, 164, 191, 134, 178, 97, 156, 82, 147, 217, 240, 47, 22, 170, 160, 132, 94, 211, 76, 43, 68, 87, 207, 207, 199, 39, 29, 223, 186, 138, 113, 233, 86, 14, 238, 119, 148, 69, 197, 120, 242, 96, 246, 177, 78, 234, 123, 22, 159, 198, 68, 7, 80, 219 }, "ege" });

            migrationBuilder.InsertData(
                table: "Customers",
                columns: new[] { "Id", "MailAddress", "Name", "PasswordHash", "PasswordSalt", "PhoneNumber", "Surname", "Username" },
                values: new object[,]
                {
                    { 13, null, null, new byte[] { 33, 197, 45, 38, 200, 203, 181, 113, 222, 243, 44, 82, 227, 225, 207, 71, 115, 84, 103, 117, 184, 40, 211, 168, 248, 147, 172, 209, 235, 71, 83, 4, 48, 77, 124, 6, 98, 31, 224, 35, 50, 63, 156, 104, 251, 183, 35, 122, 116, 95, 235, 50, 49, 118, 204, 42, 98, 4, 216, 248, 232, 144, 182, 34 }, new byte[] { 134, 130, 170, 250, 55, 205, 34, 248, 214, 131, 234, 168, 39, 162, 32, 254, 203, 202, 11, 163, 249, 214, 95, 226, 225, 215, 205, 202, 25, 194, 215, 96, 61, 47, 3, 30, 189, 79, 60, 169, 120, 114, 169, 79, 233, 92, 9, 7, 202, 192, 210, 242, 166, 54, 189, 174, 54, 36, 51, 49, 6, 72, 54, 235, 37, 41, 219, 93, 22, 192, 214, 202, 128, 185, 40, 164, 191, 134, 178, 97, 156, 82, 147, 217, 240, 47, 22, 170, 160, 132, 94, 211, 76, 43, 68, 87, 207, 207, 199, 39, 29, 223, 186, 138, 113, 233, 86, 14, 238, 119, 148, 69, 197, 120, 242, 96, 246, 177, 78, 234, 123, 22, 159, 198, 68, 7, 80, 219 }, null, null, "ahmet" },
                    { 14, null, null, new byte[] { 33, 197, 45, 38, 200, 203, 181, 113, 222, 243, 44, 82, 227, 225, 207, 71, 115, 84, 103, 117, 184, 40, 211, 168, 248, 147, 172, 209, 235, 71, 83, 4, 48, 77, 124, 6, 98, 31, 224, 35, 50, 63, 156, 104, 251, 183, 35, 122, 116, 95, 235, 50, 49, 118, 204, 42, 98, 4, 216, 248, 232, 144, 182, 34 }, new byte[] { 134, 130, 170, 250, 55, 205, 34, 248, 214, 131, 234, 168, 39, 162, 32, 254, 203, 202, 11, 163, 249, 214, 95, 226, 225, 215, 205, 202, 25, 194, 215, 96, 61, 47, 3, 30, 189, 79, 60, 169, 120, 114, 169, 79, 233, 92, 9, 7, 202, 192, 210, 242, 166, 54, 189, 174, 54, 36, 51, 49, 6, 72, 54, 235, 37, 41, 219, 93, 22, 192, 214, 202, 128, 185, 40, 164, 191, 134, 178, 97, 156, 82, 147, 217, 240, 47, 22, 170, 160, 132, 94, 211, 76, 43, 68, 87, 207, 207, 199, 39, 29, 223, 186, 138, 113, 233, 86, 14, 238, 119, 148, 69, 197, 120, 242, 96, 246, 177, 78, 234, 123, 22, 159, 198, 68, 7, 80, 219 }, null, null, "zeynep" },
                    { 15, null, null, new byte[] { 33, 197, 45, 38, 200, 203, 181, 113, 222, 243, 44, 82, 227, 225, 207, 71, 115, 84, 103, 117, 184, 40, 211, 168, 248, 147, 172, 209, 235, 71, 83, 4, 48, 77, 124, 6, 98, 31, 224, 35, 50, 63, 156, 104, 251, 183, 35, 122, 116, 95, 235, 50, 49, 118, 204, 42, 98, 4, 216, 248, 232, 144, 182, 34 }, new byte[] { 134, 130, 170, 250, 55, 205, 34, 248, 214, 131, 234, 168, 39, 162, 32, 254, 203, 202, 11, 163, 249, 214, 95, 226, 225, 215, 205, 202, 25, 194, 215, 96, 61, 47, 3, 30, 189, 79, 60, 169, 120, 114, 169, 79, 233, 92, 9, 7, 202, 192, 210, 242, 166, 54, 189, 174, 54, 36, 51, 49, 6, 72, 54, 235, 37, 41, 219, 93, 22, 192, 214, 202, 128, 185, 40, 164, 191, 134, 178, 97, 156, 82, 147, 217, 240, 47, 22, 170, 160, 132, 94, 211, 76, 43, 68, 87, 207, 207, 199, 39, 29, 223, 186, 138, 113, 233, 86, 14, 238, 119, 148, 69, 197, 120, 242, 96, 246, 177, 78, 234, 123, 22, 159, 198, 68, 7, 80, 219 }, null, null, "baris" },
                    { 16, null, null, new byte[] { 33, 197, 45, 38, 200, 203, 181, 113, 222, 243, 44, 82, 227, 225, 207, 71, 115, 84, 103, 117, 184, 40, 211, 168, 248, 147, 172, 209, 235, 71, 83, 4, 48, 77, 124, 6, 98, 31, 224, 35, 50, 63, 156, 104, 251, 183, 35, 122, 116, 95, 235, 50, 49, 118, 204, 42, 98, 4, 216, 248, 232, 144, 182, 34 }, new byte[] { 134, 130, 170, 250, 55, 205, 34, 248, 214, 131, 234, 168, 39, 162, 32, 254, 203, 202, 11, 163, 249, 214, 95, 226, 225, 215, 205, 202, 25, 194, 215, 96, 61, 47, 3, 30, 189, 79, 60, 169, 120, 114, 169, 79, 233, 92, 9, 7, 202, 192, 210, 242, 166, 54, 189, 174, 54, 36, 51, 49, 6, 72, 54, 235, 37, 41, 219, 93, 22, 192, 214, 202, 128, 185, 40, 164, 191, 134, 178, 97, 156, 82, 147, 217, 240, 47, 22, 170, 160, 132, 94, 211, 76, 43, 68, 87, 207, 207, 199, 39, 29, 223, 186, 138, 113, 233, 86, 14, 238, 119, 148, 69, 197, 120, 242, 96, 246, 177, 78, 234, 123, 22, 159, 198, 68, 7, 80, 219 }, null, null, "ilayda" },
                    { 17, null, null, new byte[] { 33, 197, 45, 38, 200, 203, 181, 113, 222, 243, 44, 82, 227, 225, 207, 71, 115, 84, 103, 117, 184, 40, 211, 168, 248, 147, 172, 209, 235, 71, 83, 4, 48, 77, 124, 6, 98, 31, 224, 35, 50, 63, 156, 104, 251, 183, 35, 122, 116, 95, 235, 50, 49, 118, 204, 42, 98, 4, 216, 248, 232, 144, 182, 34 }, new byte[] { 134, 130, 170, 250, 55, 205, 34, 248, 214, 131, 234, 168, 39, 162, 32, 254, 203, 202, 11, 163, 249, 214, 95, 226, 225, 215, 205, 202, 25, 194, 215, 96, 61, 47, 3, 30, 189, 79, 60, 169, 120, 114, 169, 79, 233, 92, 9, 7, 202, 192, 210, 242, 166, 54, 189, 174, 54, 36, 51, 49, 6, 72, 54, 235, 37, 41, 219, 93, 22, 192, 214, 202, 128, 185, 40, 164, 191, 134, 178, 97, 156, 82, 147, 217, 240, 47, 22, 170, 160, 132, 94, 211, 76, 43, 68, 87, 207, 207, 199, 39, 29, 223, 186, 138, 113, 233, 86, 14, 238, 119, 148, 69, 197, 120, 242, 96, 246, 177, 78, 234, 123, 22, 159, 198, 68, 7, 80, 219 }, null, null, "merve" },
                    { 18, null, null, new byte[] { 33, 197, 45, 38, 200, 203, 181, 113, 222, 243, 44, 82, 227, 225, 207, 71, 115, 84, 103, 117, 184, 40, 211, 168, 248, 147, 172, 209, 235, 71, 83, 4, 48, 77, 124, 6, 98, 31, 224, 35, 50, 63, 156, 104, 251, 183, 35, 122, 116, 95, 235, 50, 49, 118, 204, 42, 98, 4, 216, 248, 232, 144, 182, 34 }, new byte[] { 134, 130, 170, 250, 55, 205, 34, 248, 214, 131, 234, 168, 39, 162, 32, 254, 203, 202, 11, 163, 249, 214, 95, 226, 225, 215, 205, 202, 25, 194, 215, 96, 61, 47, 3, 30, 189, 79, 60, 169, 120, 114, 169, 79, 233, 92, 9, 7, 202, 192, 210, 242, 166, 54, 189, 174, 54, 36, 51, 49, 6, 72, 54, 235, 37, 41, 219, 93, 22, 192, 214, 202, 128, 185, 40, 164, 191, 134, 178, 97, 156, 82, 147, 217, 240, 47, 22, 170, 160, 132, 94, 211, 76, 43, 68, 87, 207, 207, 199, 39, 29, 223, 186, 138, 113, 233, 86, 14, 238, 119, 148, 69, 197, 120, 242, 96, 246, 177, 78, 234, 123, 22, 159, 198, 68, 7, 80, 219 }, null, null, "gulce" },
                    { 19, null, null, new byte[] { 33, 197, 45, 38, 200, 203, 181, 113, 222, 243, 44, 82, 227, 225, 207, 71, 115, 84, 103, 117, 184, 40, 211, 168, 248, 147, 172, 209, 235, 71, 83, 4, 48, 77, 124, 6, 98, 31, 224, 35, 50, 63, 156, 104, 251, 183, 35, 122, 116, 95, 235, 50, 49, 118, 204, 42, 98, 4, 216, 248, 232, 144, 182, 34 }, new byte[] { 134, 130, 170, 250, 55, 205, 34, 248, 214, 131, 234, 168, 39, 162, 32, 254, 203, 202, 11, 163, 249, 214, 95, 226, 225, 215, 205, 202, 25, 194, 215, 96, 61, 47, 3, 30, 189, 79, 60, 169, 120, 114, 169, 79, 233, 92, 9, 7, 202, 192, 210, 242, 166, 54, 189, 174, 54, 36, 51, 49, 6, 72, 54, 235, 37, 41, 219, 93, 22, 192, 214, 202, 128, 185, 40, 164, 191, 134, 178, 97, 156, 82, 147, 217, 240, 47, 22, 170, 160, 132, 94, 211, 76, 43, 68, 87, 207, 207, 199, 39, 29, 223, 186, 138, 113, 233, 86, 14, 238, 119, 148, 69, 197, 120, 242, 96, 246, 177, 78, 234, 123, 22, 159, 198, 68, 7, 80, 219 }, null, null, "yusuf" },
                    { 20, null, null, new byte[] { 33, 197, 45, 38, 200, 203, 181, 113, 222, 243, 44, 82, 227, 225, 207, 71, 115, 84, 103, 117, 184, 40, 211, 168, 248, 147, 172, 209, 235, 71, 83, 4, 48, 77, 124, 6, 98, 31, 224, 35, 50, 63, 156, 104, 251, 183, 35, 122, 116, 95, 235, 50, 49, 118, 204, 42, 98, 4, 216, 248, 232, 144, 182, 34 }, new byte[] { 134, 130, 170, 250, 55, 205, 34, 248, 214, 131, 234, 168, 39, 162, 32, 254, 203, 202, 11, 163, 249, 214, 95, 226, 225, 215, 205, 202, 25, 194, 215, 96, 61, 47, 3, 30, 189, 79, 60, 169, 120, 114, 169, 79, 233, 92, 9, 7, 202, 192, 210, 242, 166, 54, 189, 174, 54, 36, 51, 49, 6, 72, 54, 235, 37, 41, 219, 93, 22, 192, 214, 202, 128, 185, 40, 164, 191, 134, 178, 97, 156, 82, 147, 217, 240, 47, 22, 170, 160, 132, 94, 211, 76, 43, 68, 87, 207, 207, 199, 39, 29, 223, 186, 138, 113, 233, 86, 14, 238, 119, 148, 69, 197, 120, 242, 96, 246, 177, 78, 234, 123, 22, 159, 198, 68, 7, 80, 219 }, null, null, "volkan" },
                    { 21, null, null, new byte[] { 33, 197, 45, 38, 200, 203, 181, 113, 222, 243, 44, 82, 227, 225, 207, 71, 115, 84, 103, 117, 184, 40, 211, 168, 248, 147, 172, 209, 235, 71, 83, 4, 48, 77, 124, 6, 98, 31, 224, 35, 50, 63, 156, 104, 251, 183, 35, 122, 116, 95, 235, 50, 49, 118, 204, 42, 98, 4, 216, 248, 232, 144, 182, 34 }, new byte[] { 134, 130, 170, 250, 55, 205, 34, 248, 214, 131, 234, 168, 39, 162, 32, 254, 203, 202, 11, 163, 249, 214, 95, 226, 225, 215, 205, 202, 25, 194, 215, 96, 61, 47, 3, 30, 189, 79, 60, 169, 120, 114, 169, 79, 233, 92, 9, 7, 202, 192, 210, 242, 166, 54, 189, 174, 54, 36, 51, 49, 6, 72, 54, 235, 37, 41, 219, 93, 22, 192, 214, 202, 128, 185, 40, 164, 191, 134, 178, 97, 156, 82, 147, 217, 240, 47, 22, 170, 160, 132, 94, 211, 76, 43, 68, 87, 207, 207, 199, 39, 29, 223, 186, 138, 113, 233, 86, 14, 238, 119, 148, 69, 197, 120, 242, 96, 246, 177, 78, 234, 123, 22, 159, 198, 68, 7, 80, 219 }, null, null, "Mehmet" },
                    { 22, null, null, new byte[] { 33, 197, 45, 38, 200, 203, 181, 113, 222, 243, 44, 82, 227, 225, 207, 71, 115, 84, 103, 117, 184, 40, 211, 168, 248, 147, 172, 209, 235, 71, 83, 4, 48, 77, 124, 6, 98, 31, 224, 35, 50, 63, 156, 104, 251, 183, 35, 122, 116, 95, 235, 50, 49, 118, 204, 42, 98, 4, 216, 248, 232, 144, 182, 34 }, new byte[] { 134, 130, 170, 250, 55, 205, 34, 248, 214, 131, 234, 168, 39, 162, 32, 254, 203, 202, 11, 163, 249, 214, 95, 226, 225, 215, 205, 202, 25, 194, 215, 96, 61, 47, 3, 30, 189, 79, 60, 169, 120, 114, 169, 79, 233, 92, 9, 7, 202, 192, 210, 242, 166, 54, 189, 174, 54, 36, 51, 49, 6, 72, 54, 235, 37, 41, 219, 93, 22, 192, 214, 202, 128, 185, 40, 164, 191, 134, 178, 97, 156, 82, 147, 217, 240, 47, 22, 170, 160, 132, 94, 211, 76, 43, 68, 87, 207, 207, 199, 39, 29, 223, 186, 138, 113, 233, 86, 14, 238, 119, 148, 69, 197, 120, 242, 96, 246, 177, 78, 234, 123, 22, 159, 198, 68, 7, 80, 219 }, null, null, "Ismail" }
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 13);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 14);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 15);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 16);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 17);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 18);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 19);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 20);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 21);

            migrationBuilder.DeleteData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 22);

            migrationBuilder.UpdateData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 11,
                columns: new[] { "PasswordHash", "PasswordSalt", "Username" },
                values: new object[] { new byte[] { 116, 237, 80, 249, 64, 41, 55, 164, 241, 204, 128, 121, 186, 97, 106, 161, 76, 130, 73, 147, 220, 136, 216, 4, 23, 221, 242, 188, 161, 181, 143, 210, 229, 40, 243, 164, 139, 83, 115, 104, 25, 100, 122, 224, 91, 194, 183, 142, 89, 49, 80, 31, 114, 254, 208, 44, 151, 54, 126, 166, 47, 192, 57, 119 }, new byte[] { 88, 184, 38, 58, 79, 201, 249, 150, 248, 4, 254, 222, 69, 194, 116, 43, 167, 112, 220, 250, 227, 130, 8, 230, 114, 109, 96, 89, 162, 104, 97, 109, 155, 235, 94, 13, 128, 7, 233, 96, 96, 192, 61, 66, 64, 153, 200, 226, 21, 45, 173, 103, 100, 123, 114, 118, 149, 176, 126, 125, 203, 186, 43, 151, 103, 1, 214, 140, 243, 57, 245, 245, 142, 124, 232, 70, 253, 73, 165, 217, 93, 188, 80, 208, 181, 124, 150, 181, 63, 175, 246, 90, 76, 205, 91, 2, 40, 151, 131, 74, 27, 87, 137, 227, 126, 103, 22, 39, 14, 23, 180, 44, 141, 196, 104, 237, 101, 31, 147, 13, 248, 118, 155, 38, 47, 135, 135, 238 }, "Mehmet" });

            migrationBuilder.UpdateData(
                table: "Customers",
                keyColumn: "Id",
                keyValue: 12,
                columns: new[] { "PasswordHash", "PasswordSalt", "Username" },
                values: new object[] { new byte[] { 116, 237, 80, 249, 64, 41, 55, 164, 241, 204, 128, 121, 186, 97, 106, 161, 76, 130, 73, 147, 220, 136, 216, 4, 23, 221, 242, 188, 161, 181, 143, 210, 229, 40, 243, 164, 139, 83, 115, 104, 25, 100, 122, 224, 91, 194, 183, 142, 89, 49, 80, 31, 114, 254, 208, 44, 151, 54, 126, 166, 47, 192, 57, 119 }, new byte[] { 88, 184, 38, 58, 79, 201, 249, 150, 248, 4, 254, 222, 69, 194, 116, 43, 167, 112, 220, 250, 227, 130, 8, 230, 114, 109, 96, 89, 162, 104, 97, 109, 155, 235, 94, 13, 128, 7, 233, 96, 96, 192, 61, 66, 64, 153, 200, 226, 21, 45, 173, 103, 100, 123, 114, 118, 149, 176, 126, 125, 203, 186, 43, 151, 103, 1, 214, 140, 243, 57, 245, 245, 142, 124, 232, 70, 253, 73, 165, 217, 93, 188, 80, 208, 181, 124, 150, 181, 63, 175, 246, 90, 76, 205, 91, 2, 40, 151, 131, 74, 27, 87, 137, 227, 126, 103, 22, 39, 14, 23, 180, 44, 141, 196, 104, 237, 101, 31, 147, 13, 248, 118, 155, 38, 47, 135, 135, 238 }, "Ismail" });

            migrationBuilder.InsertData(
                table: "Customers",
                columns: new[] { "Id", "MailAddress", "Name", "PasswordHash", "PasswordSalt", "PhoneNumber", "Surname", "Username" },
                values: new object[,]
                {
                    { 1, null, null, new byte[] { 116, 237, 80, 249, 64, 41, 55, 164, 241, 204, 128, 121, 186, 97, 106, 161, 76, 130, 73, 147, 220, 136, 216, 4, 23, 221, 242, 188, 161, 181, 143, 210, 229, 40, 243, 164, 139, 83, 115, 104, 25, 100, 122, 224, 91, 194, 183, 142, 89, 49, 80, 31, 114, 254, 208, 44, 151, 54, 126, 166, 47, 192, 57, 119 }, new byte[] { 88, 184, 38, 58, 79, 201, 249, 150, 248, 4, 254, 222, 69, 194, 116, 43, 167, 112, 220, 250, 227, 130, 8, 230, 114, 109, 96, 89, 162, 104, 97, 109, 155, 235, 94, 13, 128, 7, 233, 96, 96, 192, 61, 66, 64, 153, 200, 226, 21, 45, 173, 103, 100, 123, 114, 118, 149, 176, 126, 125, 203, 186, 43, 151, 103, 1, 214, 140, 243, 57, 245, 245, 142, 124, 232, 70, 253, 73, 165, 217, 93, 188, 80, 208, 181, 124, 150, 181, 63, 175, 246, 90, 76, 205, 91, 2, 40, 151, 131, 74, 27, 87, 137, 227, 126, 103, 22, 39, 14, 23, 180, 44, 141, 196, 104, 237, 101, 31, 147, 13, 248, 118, 155, 38, 47, 135, 135, 238 }, null, null, "seco" },
                    { 2, null, null, new byte[] { 116, 237, 80, 249, 64, 41, 55, 164, 241, 204, 128, 121, 186, 97, 106, 161, 76, 130, 73, 147, 220, 136, 216, 4, 23, 221, 242, 188, 161, 181, 143, 210, 229, 40, 243, 164, 139, 83, 115, 104, 25, 100, 122, 224, 91, 194, 183, 142, 89, 49, 80, 31, 114, 254, 208, 44, 151, 54, 126, 166, 47, 192, 57, 119 }, new byte[] { 88, 184, 38, 58, 79, 201, 249, 150, 248, 4, 254, 222, 69, 194, 116, 43, 167, 112, 220, 250, 227, 130, 8, 230, 114, 109, 96, 89, 162, 104, 97, 109, 155, 235, 94, 13, 128, 7, 233, 96, 96, 192, 61, 66, 64, 153, 200, 226, 21, 45, 173, 103, 100, 123, 114, 118, 149, 176, 126, 125, 203, 186, 43, 151, 103, 1, 214, 140, 243, 57, 245, 245, 142, 124, 232, 70, 253, 73, 165, 217, 93, 188, 80, 208, 181, 124, 150, 181, 63, 175, 246, 90, 76, 205, 91, 2, 40, 151, 131, 74, 27, 87, 137, 227, 126, 103, 22, 39, 14, 23, 180, 44, 141, 196, 104, 237, 101, 31, 147, 13, 248, 118, 155, 38, 47, 135, 135, 238 }, null, null, "ege" },
                    { 3, null, null, new byte[] { 116, 237, 80, 249, 64, 41, 55, 164, 241, 204, 128, 121, 186, 97, 106, 161, 76, 130, 73, 147, 220, 136, 216, 4, 23, 221, 242, 188, 161, 181, 143, 210, 229, 40, 243, 164, 139, 83, 115, 104, 25, 100, 122, 224, 91, 194, 183, 142, 89, 49, 80, 31, 114, 254, 208, 44, 151, 54, 126, 166, 47, 192, 57, 119 }, new byte[] { 88, 184, 38, 58, 79, 201, 249, 150, 248, 4, 254, 222, 69, 194, 116, 43, 167, 112, 220, 250, 227, 130, 8, 230, 114, 109, 96, 89, 162, 104, 97, 109, 155, 235, 94, 13, 128, 7, 233, 96, 96, 192, 61, 66, 64, 153, 200, 226, 21, 45, 173, 103, 100, 123, 114, 118, 149, 176, 126, 125, 203, 186, 43, 151, 103, 1, 214, 140, 243, 57, 245, 245, 142, 124, 232, 70, 253, 73, 165, 217, 93, 188, 80, 208, 181, 124, 150, 181, 63, 175, 246, 90, 76, 205, 91, 2, 40, 151, 131, 74, 27, 87, 137, 227, 126, 103, 22, 39, 14, 23, 180, 44, 141, 196, 104, 237, 101, 31, 147, 13, 248, 118, 155, 38, 47, 135, 135, 238 }, null, null, "ahmet" },
                    { 4, null, null, new byte[] { 116, 237, 80, 249, 64, 41, 55, 164, 241, 204, 128, 121, 186, 97, 106, 161, 76, 130, 73, 147, 220, 136, 216, 4, 23, 221, 242, 188, 161, 181, 143, 210, 229, 40, 243, 164, 139, 83, 115, 104, 25, 100, 122, 224, 91, 194, 183, 142, 89, 49, 80, 31, 114, 254, 208, 44, 151, 54, 126, 166, 47, 192, 57, 119 }, new byte[] { 88, 184, 38, 58, 79, 201, 249, 150, 248, 4, 254, 222, 69, 194, 116, 43, 167, 112, 220, 250, 227, 130, 8, 230, 114, 109, 96, 89, 162, 104, 97, 109, 155, 235, 94, 13, 128, 7, 233, 96, 96, 192, 61, 66, 64, 153, 200, 226, 21, 45, 173, 103, 100, 123, 114, 118, 149, 176, 126, 125, 203, 186, 43, 151, 103, 1, 214, 140, 243, 57, 245, 245, 142, 124, 232, 70, 253, 73, 165, 217, 93, 188, 80, 208, 181, 124, 150, 181, 63, 175, 246, 90, 76, 205, 91, 2, 40, 151, 131, 74, 27, 87, 137, 227, 126, 103, 22, 39, 14, 23, 180, 44, 141, 196, 104, 237, 101, 31, 147, 13, 248, 118, 155, 38, 47, 135, 135, 238 }, null, null, "zeynep" },
                    { 5, null, null, new byte[] { 116, 237, 80, 249, 64, 41, 55, 164, 241, 204, 128, 121, 186, 97, 106, 161, 76, 130, 73, 147, 220, 136, 216, 4, 23, 221, 242, 188, 161, 181, 143, 210, 229, 40, 243, 164, 139, 83, 115, 104, 25, 100, 122, 224, 91, 194, 183, 142, 89, 49, 80, 31, 114, 254, 208, 44, 151, 54, 126, 166, 47, 192, 57, 119 }, new byte[] { 88, 184, 38, 58, 79, 201, 249, 150, 248, 4, 254, 222, 69, 194, 116, 43, 167, 112, 220, 250, 227, 130, 8, 230, 114, 109, 96, 89, 162, 104, 97, 109, 155, 235, 94, 13, 128, 7, 233, 96, 96, 192, 61, 66, 64, 153, 200, 226, 21, 45, 173, 103, 100, 123, 114, 118, 149, 176, 126, 125, 203, 186, 43, 151, 103, 1, 214, 140, 243, 57, 245, 245, 142, 124, 232, 70, 253, 73, 165, 217, 93, 188, 80, 208, 181, 124, 150, 181, 63, 175, 246, 90, 76, 205, 91, 2, 40, 151, 131, 74, 27, 87, 137, 227, 126, 103, 22, 39, 14, 23, 180, 44, 141, 196, 104, 237, 101, 31, 147, 13, 248, 118, 155, 38, 47, 135, 135, 238 }, null, null, "baris" },
                    { 6, null, null, new byte[] { 116, 237, 80, 249, 64, 41, 55, 164, 241, 204, 128, 121, 186, 97, 106, 161, 76, 130, 73, 147, 220, 136, 216, 4, 23, 221, 242, 188, 161, 181, 143, 210, 229, 40, 243, 164, 139, 83, 115, 104, 25, 100, 122, 224, 91, 194, 183, 142, 89, 49, 80, 31, 114, 254, 208, 44, 151, 54, 126, 166, 47, 192, 57, 119 }, new byte[] { 88, 184, 38, 58, 79, 201, 249, 150, 248, 4, 254, 222, 69, 194, 116, 43, 167, 112, 220, 250, 227, 130, 8, 230, 114, 109, 96, 89, 162, 104, 97, 109, 155, 235, 94, 13, 128, 7, 233, 96, 96, 192, 61, 66, 64, 153, 200, 226, 21, 45, 173, 103, 100, 123, 114, 118, 149, 176, 126, 125, 203, 186, 43, 151, 103, 1, 214, 140, 243, 57, 245, 245, 142, 124, 232, 70, 253, 73, 165, 217, 93, 188, 80, 208, 181, 124, 150, 181, 63, 175, 246, 90, 76, 205, 91, 2, 40, 151, 131, 74, 27, 87, 137, 227, 126, 103, 22, 39, 14, 23, 180, 44, 141, 196, 104, 237, 101, 31, 147, 13, 248, 118, 155, 38, 47, 135, 135, 238 }, null, null, "ilayda" },
                    { 7, null, null, new byte[] { 116, 237, 80, 249, 64, 41, 55, 164, 241, 204, 128, 121, 186, 97, 106, 161, 76, 130, 73, 147, 220, 136, 216, 4, 23, 221, 242, 188, 161, 181, 143, 210, 229, 40, 243, 164, 139, 83, 115, 104, 25, 100, 122, 224, 91, 194, 183, 142, 89, 49, 80, 31, 114, 254, 208, 44, 151, 54, 126, 166, 47, 192, 57, 119 }, new byte[] { 88, 184, 38, 58, 79, 201, 249, 150, 248, 4, 254, 222, 69, 194, 116, 43, 167, 112, 220, 250, 227, 130, 8, 230, 114, 109, 96, 89, 162, 104, 97, 109, 155, 235, 94, 13, 128, 7, 233, 96, 96, 192, 61, 66, 64, 153, 200, 226, 21, 45, 173, 103, 100, 123, 114, 118, 149, 176, 126, 125, 203, 186, 43, 151, 103, 1, 214, 140, 243, 57, 245, 245, 142, 124, 232, 70, 253, 73, 165, 217, 93, 188, 80, 208, 181, 124, 150, 181, 63, 175, 246, 90, 76, 205, 91, 2, 40, 151, 131, 74, 27, 87, 137, 227, 126, 103, 22, 39, 14, 23, 180, 44, 141, 196, 104, 237, 101, 31, 147, 13, 248, 118, 155, 38, 47, 135, 135, 238 }, null, null, "merve" },
                    { 8, null, null, new byte[] { 116, 237, 80, 249, 64, 41, 55, 164, 241, 204, 128, 121, 186, 97, 106, 161, 76, 130, 73, 147, 220, 136, 216, 4, 23, 221, 242, 188, 161, 181, 143, 210, 229, 40, 243, 164, 139, 83, 115, 104, 25, 100, 122, 224, 91, 194, 183, 142, 89, 49, 80, 31, 114, 254, 208, 44, 151, 54, 126, 166, 47, 192, 57, 119 }, new byte[] { 88, 184, 38, 58, 79, 201, 249, 150, 248, 4, 254, 222, 69, 194, 116, 43, 167, 112, 220, 250, 227, 130, 8, 230, 114, 109, 96, 89, 162, 104, 97, 109, 155, 235, 94, 13, 128, 7, 233, 96, 96, 192, 61, 66, 64, 153, 200, 226, 21, 45, 173, 103, 100, 123, 114, 118, 149, 176, 126, 125, 203, 186, 43, 151, 103, 1, 214, 140, 243, 57, 245, 245, 142, 124, 232, 70, 253, 73, 165, 217, 93, 188, 80, 208, 181, 124, 150, 181, 63, 175, 246, 90, 76, 205, 91, 2, 40, 151, 131, 74, 27, 87, 137, 227, 126, 103, 22, 39, 14, 23, 180, 44, 141, 196, 104, 237, 101, 31, 147, 13, 248, 118, 155, 38, 47, 135, 135, 238 }, null, null, "gulce" },
                    { 9, null, null, new byte[] { 116, 237, 80, 249, 64, 41, 55, 164, 241, 204, 128, 121, 186, 97, 106, 161, 76, 130, 73, 147, 220, 136, 216, 4, 23, 221, 242, 188, 161, 181, 143, 210, 229, 40, 243, 164, 139, 83, 115, 104, 25, 100, 122, 224, 91, 194, 183, 142, 89, 49, 80, 31, 114, 254, 208, 44, 151, 54, 126, 166, 47, 192, 57, 119 }, new byte[] { 88, 184, 38, 58, 79, 201, 249, 150, 248, 4, 254, 222, 69, 194, 116, 43, 167, 112, 220, 250, 227, 130, 8, 230, 114, 109, 96, 89, 162, 104, 97, 109, 155, 235, 94, 13, 128, 7, 233, 96, 96, 192, 61, 66, 64, 153, 200, 226, 21, 45, 173, 103, 100, 123, 114, 118, 149, 176, 126, 125, 203, 186, 43, 151, 103, 1, 214, 140, 243, 57, 245, 245, 142, 124, 232, 70, 253, 73, 165, 217, 93, 188, 80, 208, 181, 124, 150, 181, 63, 175, 246, 90, 76, 205, 91, 2, 40, 151, 131, 74, 27, 87, 137, 227, 126, 103, 22, 39, 14, 23, 180, 44, 141, 196, 104, 237, 101, 31, 147, 13, 248, 118, 155, 38, 47, 135, 135, 238 }, null, null, "yusuf" },
                    { 10, null, null, new byte[] { 116, 237, 80, 249, 64, 41, 55, 164, 241, 204, 128, 121, 186, 97, 106, 161, 76, 130, 73, 147, 220, 136, 216, 4, 23, 221, 242, 188, 161, 181, 143, 210, 229, 40, 243, 164, 139, 83, 115, 104, 25, 100, 122, 224, 91, 194, 183, 142, 89, 49, 80, 31, 114, 254, 208, 44, 151, 54, 126, 166, 47, 192, 57, 119 }, new byte[] { 88, 184, 38, 58, 79, 201, 249, 150, 248, 4, 254, 222, 69, 194, 116, 43, 167, 112, 220, 250, 227, 130, 8, 230, 114, 109, 96, 89, 162, 104, 97, 109, 155, 235, 94, 13, 128, 7, 233, 96, 96, 192, 61, 66, 64, 153, 200, 226, 21, 45, 173, 103, 100, 123, 114, 118, 149, 176, 126, 125, 203, 186, 43, 151, 103, 1, 214, 140, 243, 57, 245, 245, 142, 124, 232, 70, 253, 73, 165, 217, 93, 188, 80, 208, 181, 124, 150, 181, 63, 175, 246, 90, 76, 205, 91, 2, 40, 151, 131, 74, 27, 87, 137, 227, 126, 103, 22, 39, 14, 23, 180, 44, 141, 196, 104, 237, 101, 31, 147, 13, 248, 118, 155, 38, 47, 135, 135, 238 }, null, null, "volkan" }
                });
        }
    }
}
