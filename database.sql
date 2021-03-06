USE [master]
GO
/****** Object:  Database [ecommerce]    Script Date: 06/07/2020 10:57:10 ******/
CREATE DATABASE [ecommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ecommerce', FILENAME = N'D:\Programmi\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ecommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ecommerce_log', FILENAME = N'D:\Programmi\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ecommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ecommerce] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ecommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ecommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ecommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ecommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ecommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [ecommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ecommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ecommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ecommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ecommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ecommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ecommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ecommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ecommerce] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ecommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ecommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ecommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ecommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ecommerce] SET RECOVERY FULL 
GO
ALTER DATABASE [ecommerce] SET  MULTI_USER 
GO
ALTER DATABASE [ecommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ecommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ecommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ecommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ecommerce] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ecommerce', N'ON'
GO
ALTER DATABASE [ecommerce] SET QUERY_STORE = OFF
GO
USE [ecommerce]
GO
/****** Object:  Table [dbo].[account]    Script Date: 06/07/2020 10:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[IDlogin] [int] IDENTITY(1,1) NOT NULL,
	[password] [char](50) NOT NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[IDlogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[amministratore]    Script Date: 06/07/2020 10:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[amministratore](
	[email] [char](50) NOT NULL,
	[nome] [char](50) NULL,
	[cognome] [char](50) NULL,
	[IDlogin] [int] NOT NULL,
 CONSTRAINT [PK_amministratore] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 06/07/2020 10:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[IDcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nome_categoria] [char](50) NOT NULL,
 CONSTRAINT [PK_categoria] PRIMARY KEY CLUSTERED 
(
	[IDcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[citta]    Script Date: 06/07/2020 10:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[citta](
	[IDcitta] [char](5) NOT NULL,
	[nome_citta] [char](50) NOT NULL,
	[IDprovincia] [int] NOT NULL,
 CONSTRAINT [PK_citta] PRIMARY KEY CLUSTERED 
(
	[IDcitta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 06/07/2020 10:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[email] [char](50) NOT NULL,
	[nome] [char](50) NOT NULL,
	[cognome] [char](50) NOT NULL,
	[indirizzo] [char](50) NOT NULL,
	[data_nascita] [date] NOT NULL,
	[telefono] [char](13) NOT NULL,
	[IDcitta] [char](5) NOT NULL,
	[IDlogin] [int] NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[composizione]    Script Date: 06/07/2020 10:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[composizione](
	[IDordine] [int] NOT NULL,
	[IDprodotto] [int] NOT NULL,
	[quantita] [int] NOT NULL,
 CONSTRAINT [PK_composizione] PRIMARY KEY CLUSTERED 
(
	[IDordine] ASC,
	[IDprodotto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[metodo_pagamento]    Script Date: 06/07/2020 10:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metodo_pagamento](
	[IDmp] [int] IDENTITY(1,1) NOT NULL,
	[descrizione] [char](50) NOT NULL,
 CONSTRAINT [PK_metodo_pagamento] PRIMARY KEY CLUSTERED 
(
	[IDmp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[metodo_spedizione]    Script Date: 06/07/2020 10:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metodo_spedizione](
	[IDms] [int] IDENTITY(1,1) NOT NULL,
	[descrizione] [char](50) NOT NULL,
	[costo] [float] NOT NULL,
 CONSTRAINT [PK_metodo_spedizione] PRIMARY KEY CLUSTERED 
(
	[IDms] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordine]    Script Date: 06/07/2020 10:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordine](
	[IDordine] [int] IDENTITY(1,1) NOT NULL,
	[data_ora] [datetime] NOT NULL,
	[IDcliente] [char](50) NOT NULL,
	[IDstatoOrdine] [int] NOT NULL,
 CONSTRAINT [PK_ordine] PRIMARY KEY CLUSTERED 
(
	[IDordine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pagamento]    Script Date: 06/07/2020 10:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagamento](
	[IDpagamento] [int] IDENTITY(1,1) NOT NULL,
	[data_ora] [datetime] NOT NULL,
	[importo] [float] NOT NULL,
	[IDmetodoPagamento] [int] NOT NULL,
	[IDordine] [int] NOT NULL,
 CONSTRAINT [PK_pagamento] PRIMARY KEY CLUSTERED 
(
	[IDpagamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[preferito]    Script Date: 06/07/2020 10:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preferito](
	[IDcliente] [char](50) NOT NULL,
	[IDprodotto] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[IDcliente] ASC,
	[IDprodotto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prodotto]    Script Date: 06/07/2020 10:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prodotto](
	[IDprodotto] [int] IDENTITY(1,1) NOT NULL,
	[nome] [char](50) NOT NULL,
	[descrizione] [char](200) NULL,
	[disponibilita] [bit] NOT NULL,
	[prezzo] [float] NOT NULL,
	[IDcategoria] [int] NOT NULL,
 CONSTRAINT [PK_prodotto] PRIMARY KEY CLUSTERED 
(
	[IDprodotto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincia]    Script Date: 06/07/2020 10:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincia](
	[IDprovincia] [int] IDENTITY(1,1) NOT NULL,
	[provincia] [char](10) NOT NULL,
 CONSTRAINT [PK_provincia] PRIMARY KEY CLUSTERED 
(
	[IDprovincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rubrica_indirizzi]    Script Date: 06/07/2020 10:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rubrica_indirizzi](
	[IDindirizzo] [int] IDENTITY(1,1) NOT NULL,
	[alias] [char](50) NOT NULL,
	[nome] [char](50) NOT NULL,
	[cognome] [char](50) NOT NULL,
	[indirizzo] [char](50) NOT NULL,
	[IDcitta] [char](5) NOT NULL,
	[IDcliente] [char](50) NOT NULL,
 CONSTRAINT [PK_rubrica_indirizzi] PRIMARY KEY CLUSTERED 
(
	[IDindirizzo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[spedizione]    Script Date: 06/07/2020 10:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[spedizione](
	[IDspedizione] [int] IDENTITY(1,1) NOT NULL,
	[data_ora] [datetime] NOT NULL,
	[IDMetodoSpedizione] [int] NOT NULL,
	[IDordine] [int] NOT NULL,
	[IDindirizzo] [int] NOT NULL,
 CONSTRAINT [PK_spedizione] PRIMARY KEY CLUSTERED 
(
	[IDspedizione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stato_ordine]    Script Date: 06/07/2020 10:57:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stato_ordine](
	[IDstato] [int] IDENTITY(1,1) NOT NULL,
	[stato_ordine] [char](50) NOT NULL,
 CONSTRAINT [PK_stato_ordine] PRIMARY KEY CLUSTERED 
(
	[IDstato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([IDlogin], [password]) VALUES (1, N'1234                                              ')
INSERT [dbo].[account] ([IDlogin], [password]) VALUES (2, N'1234                                              ')
INSERT [dbo].[account] ([IDlogin], [password]) VALUES (9, N'1234                                              ')
INSERT [dbo].[account] ([IDlogin], [password]) VALUES (18, N'1234                                              ')
SET IDENTITY_INSERT [dbo].[account] OFF
GO
INSERT [dbo].[amministratore] ([email], [nome], [cognome], [IDlogin]) VALUES (N'admin@gmail.com                                   ', NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[categoria] ON 

INSERT [dbo].[categoria] ([IDcategoria], [nome_categoria]) VALUES (1, N'smartphone                                        ')
INSERT [dbo].[categoria] ([IDcategoria], [nome_categoria]) VALUES (4, N'smartwatch                                        ')
SET IDENTITY_INSERT [dbo].[categoria] OFF
GO
INSERT [dbo].[citta] ([IDcitta], [nome_citta], [IDprovincia]) VALUES (N'43120', N'parma                                             ', 2)
INSERT [dbo].[citta] ([IDcitta], [nome_citta], [IDprovincia]) VALUES (N'73037', N'poggiardo                                         ', 1)
INSERT [dbo].[citta] ([IDcitta], [nome_citta], [IDprovincia]) VALUES (N'73100', N'lecce                                             ', 1)
GO
INSERT [dbo].[cliente] ([email], [nome], [cognome], [indirizzo], [data_nascita], [telefono], [IDcitta], [IDlogin]) VALUES (N'cliente1@gmail.com                                ', N'mario                                             ', N'rossi                                             ', N'via umberto I 23                                  ', CAST(N'2000-02-23' AS Date), N'1234567890   ', N'73037', 2)
INSERT [dbo].[cliente] ([email], [nome], [cognome], [indirizzo], [data_nascita], [telefono], [IDcitta], [IDlogin]) VALUES (N'cliente2@gmail.com                                ', N'federico                                          ', N'del sole                                          ', N'via gioberti 51                                   ', CAST(N'1999-10-05' AS Date), N'1234567890   ', N'73037', 9)
INSERT [dbo].[cliente] ([email], [nome], [cognome], [indirizzo], [data_nascita], [telefono], [IDcitta], [IDlogin]) VALUES (N'cliente3@gmail.com                                ', N'giuseppe                                          ', N'orlando                                           ', N'via ccc 22                                        ', CAST(N'2000-10-10' AS Date), N'1234567890   ', N'43120', 18)
GO
INSERT [dbo].[composizione] ([IDordine], [IDprodotto], [quantita]) VALUES (49, 23, 1)
INSERT [dbo].[composizione] ([IDordine], [IDprodotto], [quantita]) VALUES (50, 23, 1)
INSERT [dbo].[composizione] ([IDordine], [IDprodotto], [quantita]) VALUES (51, 3, 1)
INSERT [dbo].[composizione] ([IDordine], [IDprodotto], [quantita]) VALUES (51, 4, 5)
GO
SET IDENTITY_INSERT [dbo].[metodo_pagamento] ON 

INSERT [dbo].[metodo_pagamento] ([IDmp], [descrizione]) VALUES (1, N'paypal                                            ')
INSERT [dbo].[metodo_pagamento] ([IDmp], [descrizione]) VALUES (2, N'carta di credito                                  ')
SET IDENTITY_INSERT [dbo].[metodo_pagamento] OFF
GO
SET IDENTITY_INSERT [dbo].[metodo_spedizione] ON 

INSERT [dbo].[metodo_spedizione] ([IDms], [descrizione], [costo]) VALUES (1, N'corriere                                          ', 0)
INSERT [dbo].[metodo_spedizione] ([IDms], [descrizione], [costo]) VALUES (2, N'corriere espresso                                 ', 7.5)
SET IDENTITY_INSERT [dbo].[metodo_spedizione] OFF
GO
SET IDENTITY_INSERT [dbo].[ordine] ON 

INSERT [dbo].[ordine] ([IDordine], [data_ora], [IDcliente], [IDstatoOrdine]) VALUES (49, CAST(N'2020-07-05T11:46:36.787' AS DateTime), N'cliente1@gmail.com                                ', 1)
INSERT [dbo].[ordine] ([IDordine], [data_ora], [IDcliente], [IDstatoOrdine]) VALUES (50, CAST(N'2020-07-05T17:22:58.910' AS DateTime), N'cliente1@gmail.com                                ', 1)
INSERT [dbo].[ordine] ([IDordine], [data_ora], [IDcliente], [IDstatoOrdine]) VALUES (51, CAST(N'2020-07-06T09:47:16.150' AS DateTime), N'cliente1@gmail.com                                ', 1)
SET IDENTITY_INSERT [dbo].[ordine] OFF
GO
SET IDENTITY_INSERT [dbo].[pagamento] ON 

INSERT [dbo].[pagamento] ([IDpagamento], [data_ora], [importo], [IDmetodoPagamento], [IDordine]) VALUES (20, CAST(N'2020-07-05T11:46:36.883' AS DateTime), 250, 1, 49)
INSERT [dbo].[pagamento] ([IDpagamento], [data_ora], [importo], [IDmetodoPagamento], [IDordine]) VALUES (21, CAST(N'2020-07-05T17:22:59.020' AS DateTime), 280.5, 2, 50)
INSERT [dbo].[pagamento] ([IDpagamento], [data_ora], [importo], [IDmetodoPagamento], [IDordine]) VALUES (22, CAST(N'2020-07-06T09:47:16.250' AS DateTime), 6257.5, 2, 51)
SET IDENTITY_INSERT [dbo].[pagamento] OFF
GO
INSERT [dbo].[preferito] ([IDcliente], [IDprodotto]) VALUES (N'cliente1@gmail.com                                ', 3)
INSERT [dbo].[preferito] ([IDcliente], [IDprodotto]) VALUES (N'cliente1@gmail.com                                ', 8)
GO
SET IDENTITY_INSERT [dbo].[prodotto] ON 

INSERT [dbo].[prodotto] ([IDprodotto], [nome], [descrizione], [disponibilita], [prezzo], [IDcategoria]) VALUES (3, N'iphone 11                                         ', N'...                                                                                                                                                                                                     ', 1, 750, 1)
INSERT [dbo].[prodotto] ([IDprodotto], [nome], [descrizione], [disponibilita], [prezzo], [IDcategoria]) VALUES (4, N'iphone 11 pro                                     ', N'...                                                                                                                                                                                                     ', 1, 1100, 1)
INSERT [dbo].[prodotto] ([IDprodotto], [nome], [descrizione], [disponibilita], [prezzo], [IDcategoria]) VALUES (8, N'iphone 11 pro max                                 ', N'...                                                                                                                                                                                                     ', 1, 1300, 1)
INSERT [dbo].[prodotto] ([IDprodotto], [nome], [descrizione], [disponibilita], [prezzo], [IDcategoria]) VALUES (10, N'iphone se 2020                                    ', N'...                                                                                                                                                                                                     ', 1, 500, 1)
INSERT [dbo].[prodotto] ([IDprodotto], [nome], [descrizione], [disponibilita], [prezzo], [IDcategoria]) VALUES (12, N'samsung s20                                       ', N'...                                                                                                                                                                                                     ', 1, 600, 1)
INSERT [dbo].[prodotto] ([IDprodotto], [nome], [descrizione], [disponibilita], [prezzo], [IDcategoria]) VALUES (13, N'samsung s20+                                      ', N'...                                                                                                                                                                                                     ', 1, 850, 1)
INSERT [dbo].[prodotto] ([IDprodotto], [nome], [descrizione], [disponibilita], [prezzo], [IDcategoria]) VALUES (14, N'samsung s20 ultra 5g                              ', N'...                                                                                                                                                                                                     ', 1, 1020, 1)
INSERT [dbo].[prodotto] ([IDprodotto], [nome], [descrizione], [disponibilita], [prezzo], [IDcategoria]) VALUES (15, N'apple watch series 5                              ', N'...                                                                                                                                                                                                     ', 1, 460, 4)
INSERT [dbo].[prodotto] ([IDprodotto], [nome], [descrizione], [disponibilita], [prezzo], [IDcategoria]) VALUES (16, N'apple watch series 3                              ', N'...                                                                                                                                                                                                     ', 1, 300, 4)
INSERT [dbo].[prodotto] ([IDprodotto], [nome], [descrizione], [disponibilita], [prezzo], [IDcategoria]) VALUES (18, N'samsung galaxy watch                              ', N'...                                                                                                                                                                                                     ', 1, 300, 4)
INSERT [dbo].[prodotto] ([IDprodotto], [nome], [descrizione], [disponibilita], [prezzo], [IDcategoria]) VALUES (21, N'samsung galaxy s8+                                ', N'...                                                                                                                                                                                                     ', 0, 300, 1)
INSERT [dbo].[prodotto] ([IDprodotto], [nome], [descrizione], [disponibilita], [prezzo], [IDcategoria]) VALUES (22, N'iphone 8                                          ', N'...                                                                                                                                                                                                     ', 1, 450, 1)
INSERT [dbo].[prodotto] ([IDprodotto], [nome], [descrizione], [disponibilita], [prezzo], [IDcategoria]) VALUES (23, N'iphone 7                                          ', N'...                                                                                                                                                                                                     ', 1, 280.5, 1)
INSERT [dbo].[prodotto] ([IDprodotto], [nome], [descrizione], [disponibilita], [prezzo], [IDcategoria]) VALUES (24, N'iphone 8 plus                                     ', N'rigenerato                                                                                                                                                                                              ', 1, 350, 1)
SET IDENTITY_INSERT [dbo].[prodotto] OFF
GO
SET IDENTITY_INSERT [dbo].[provincia] ON 

INSERT [dbo].[provincia] ([IDprovincia], [provincia]) VALUES (1, N'le        ')
INSERT [dbo].[provincia] ([IDprovincia], [provincia]) VALUES (2, N'pr        ')
SET IDENTITY_INSERT [dbo].[provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[rubrica_indirizzi] ON 

INSERT [dbo].[rubrica_indirizzi] ([IDindirizzo], [alias], [nome], [cognome], [indirizzo], [IDcitta], [IDcliente]) VALUES (1, N'casa                                              ', N'mario                                             ', N'verdi                                             ', N'via della chiesa 51                               ', N'73037', N'cliente1@gmail.com                                ')
INSERT [dbo].[rubrica_indirizzi] ([IDindirizzo], [alias], [nome], [cognome], [indirizzo], [IDcitta], [IDcliente]) VALUES (3, N'ufficio                                           ', N'federico                                          ', N'del sole                                          ', N'via digione 4                                     ', N'43120', N'cliente2@gmail.com                                ')
INSERT [dbo].[rubrica_indirizzi] ([IDindirizzo], [alias], [nome], [cognome], [indirizzo], [IDcitta], [IDcliente]) VALUES (7, N'casa                                              ', N'roberto                                           ', N'orlando                                           ', N'via orlando 67                                    ', N'43120', N'cliente3@gmail.com                                ')
INSERT [dbo].[rubrica_indirizzi] ([IDindirizzo], [alias], [nome], [cognome], [indirizzo], [IDcitta], [IDcliente]) VALUES (8, N'ufficio                                           ', N'mario                                             ', N'verdi                                             ', N'piazza del popolo 8                               ', N'73100', N'cliente1@gmail.com                                ')
SET IDENTITY_INSERT [dbo].[rubrica_indirizzi] OFF
GO
SET IDENTITY_INSERT [dbo].[spedizione] ON 

INSERT [dbo].[spedizione] ([IDspedizione], [data_ora], [IDMetodoSpedizione], [IDordine], [IDindirizzo]) VALUES (32, CAST(N'2020-07-05T11:46:36.883' AS DateTime), 1, 49, 1)
INSERT [dbo].[spedizione] ([IDspedizione], [data_ora], [IDMetodoSpedizione], [IDordine], [IDindirizzo]) VALUES (33, CAST(N'2020-07-05T17:22:59.003' AS DateTime), 1, 50, 1)
INSERT [dbo].[spedizione] ([IDspedizione], [data_ora], [IDMetodoSpedizione], [IDordine], [IDindirizzo]) VALUES (34, CAST(N'2020-07-06T09:47:16.210' AS DateTime), 2, 51, 1)
SET IDENTITY_INSERT [dbo].[spedizione] OFF
GO
SET IDENTITY_INSERT [dbo].[stato_ordine] ON 

INSERT [dbo].[stato_ordine] ([IDstato], [stato_ordine]) VALUES (1, N'confermato                                        ')
INSERT [dbo].[stato_ordine] ([IDstato], [stato_ordine]) VALUES (2, N'spedito                                           ')
INSERT [dbo].[stato_ordine] ([IDstato], [stato_ordine]) VALUES (3, N'consegnato                                        ')
SET IDENTITY_INSERT [dbo].[stato_ordine] OFF
GO
ALTER TABLE [dbo].[amministratore]  WITH CHECK ADD  CONSTRAINT [FK_amministratore_account] FOREIGN KEY([IDlogin])
REFERENCES [dbo].[account] ([IDlogin])
GO
ALTER TABLE [dbo].[amministratore] CHECK CONSTRAINT [FK_amministratore_account]
GO
ALTER TABLE [dbo].[citta]  WITH CHECK ADD  CONSTRAINT [FK_citta_provincia] FOREIGN KEY([IDprovincia])
REFERENCES [dbo].[provincia] ([IDprovincia])
GO
ALTER TABLE [dbo].[citta] CHECK CONSTRAINT [FK_citta_provincia]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_account] FOREIGN KEY([IDlogin])
REFERENCES [dbo].[account] ([IDlogin])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_account]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_citta] FOREIGN KEY([IDcitta])
REFERENCES [dbo].[citta] ([IDcitta])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_citta]
GO
ALTER TABLE [dbo].[composizione]  WITH CHECK ADD  CONSTRAINT [FK_composizione_ordine] FOREIGN KEY([IDordine])
REFERENCES [dbo].[ordine] ([IDordine])
GO
ALTER TABLE [dbo].[composizione] CHECK CONSTRAINT [FK_composizione_ordine]
GO
ALTER TABLE [dbo].[composizione]  WITH CHECK ADD  CONSTRAINT [FK_composizione_prodotto] FOREIGN KEY([IDprodotto])
REFERENCES [dbo].[prodotto] ([IDprodotto])
GO
ALTER TABLE [dbo].[composizione] CHECK CONSTRAINT [FK_composizione_prodotto]
GO
ALTER TABLE [dbo].[ordine]  WITH CHECK ADD  CONSTRAINT [FK_ordine_cliente] FOREIGN KEY([IDcliente])
REFERENCES [dbo].[cliente] ([email])
GO
ALTER TABLE [dbo].[ordine] CHECK CONSTRAINT [FK_ordine_cliente]
GO
ALTER TABLE [dbo].[ordine]  WITH CHECK ADD  CONSTRAINT [FK_ordine_stato_ordine] FOREIGN KEY([IDstatoOrdine])
REFERENCES [dbo].[stato_ordine] ([IDstato])
GO
ALTER TABLE [dbo].[ordine] CHECK CONSTRAINT [FK_ordine_stato_ordine]
GO
ALTER TABLE [dbo].[pagamento]  WITH CHECK ADD  CONSTRAINT [FK_pagamento_metodo_pagamento] FOREIGN KEY([IDmetodoPagamento])
REFERENCES [dbo].[metodo_pagamento] ([IDmp])
GO
ALTER TABLE [dbo].[pagamento] CHECK CONSTRAINT [FK_pagamento_metodo_pagamento]
GO
ALTER TABLE [dbo].[pagamento]  WITH CHECK ADD  CONSTRAINT [FK_pagamento_ordine] FOREIGN KEY([IDordine])
REFERENCES [dbo].[ordine] ([IDordine])
GO
ALTER TABLE [dbo].[pagamento] CHECK CONSTRAINT [FK_pagamento_ordine]
GO
ALTER TABLE [dbo].[preferito]  WITH CHECK ADD  CONSTRAINT [FK_preferito_cliente] FOREIGN KEY([IDcliente])
REFERENCES [dbo].[cliente] ([email])
GO
ALTER TABLE [dbo].[preferito] CHECK CONSTRAINT [FK_preferito_cliente]
GO
ALTER TABLE [dbo].[preferito]  WITH CHECK ADD  CONSTRAINT [FK_preferito_prodotto] FOREIGN KEY([IDprodotto])
REFERENCES [dbo].[prodotto] ([IDprodotto])
GO
ALTER TABLE [dbo].[preferito] CHECK CONSTRAINT [FK_preferito_prodotto]
GO
ALTER TABLE [dbo].[prodotto]  WITH CHECK ADD  CONSTRAINT [FK_prodotto_categoria] FOREIGN KEY([IDcategoria])
REFERENCES [dbo].[categoria] ([IDcategoria])
GO
ALTER TABLE [dbo].[prodotto] CHECK CONSTRAINT [FK_prodotto_categoria]
GO
ALTER TABLE [dbo].[rubrica_indirizzi]  WITH CHECK ADD  CONSTRAINT [FK_rubrica_indirizzi_citta] FOREIGN KEY([IDcitta])
REFERENCES [dbo].[citta] ([IDcitta])
GO
ALTER TABLE [dbo].[rubrica_indirizzi] CHECK CONSTRAINT [FK_rubrica_indirizzi_citta]
GO
ALTER TABLE [dbo].[rubrica_indirizzi]  WITH CHECK ADD  CONSTRAINT [FK_rubrica_indirizzi_cliente] FOREIGN KEY([IDcliente])
REFERENCES [dbo].[cliente] ([email])
GO
ALTER TABLE [dbo].[rubrica_indirizzi] CHECK CONSTRAINT [FK_rubrica_indirizzi_cliente]
GO
ALTER TABLE [dbo].[spedizione]  WITH CHECK ADD  CONSTRAINT [FK_spedizione_metodo_spedizione] FOREIGN KEY([IDMetodoSpedizione])
REFERENCES [dbo].[metodo_spedizione] ([IDms])
GO
ALTER TABLE [dbo].[spedizione] CHECK CONSTRAINT [FK_spedizione_metodo_spedizione]
GO
ALTER TABLE [dbo].[spedizione]  WITH CHECK ADD  CONSTRAINT [FK_spedizione_ordine] FOREIGN KEY([IDordine])
REFERENCES [dbo].[ordine] ([IDordine])
GO
ALTER TABLE [dbo].[spedizione] CHECK CONSTRAINT [FK_spedizione_ordine]
GO
ALTER TABLE [dbo].[spedizione]  WITH CHECK ADD  CONSTRAINT [FK_spedizione_rubrica_indirizzi] FOREIGN KEY([IDindirizzo])
REFERENCES [dbo].[rubrica_indirizzi] ([IDindirizzo])
GO
ALTER TABLE [dbo].[spedizione] CHECK CONSTRAINT [FK_spedizione_rubrica_indirizzi]
GO
USE [master]
GO
ALTER DATABASE [ecommerce] SET  READ_WRITE 
GO
