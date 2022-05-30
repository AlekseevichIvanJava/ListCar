-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Фев 22 2022 г., 01:16
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cars`
--

-- --------------------------------------------------------

--
-- Структура таблицы `marki`
--

CREATE TABLE `marki` (
  `id` int NOT NULL,
  `marka` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `marki`
--

INSERT INTO `marki` (`id`, `marka`) VALUES
(1, 'Ауди'),
(2, 'БМВ'),
(3, 'VW'),
(4, 'Skoda');

-- --------------------------------------------------------

--
-- Структура таблицы `models`
--

CREATE TABLE `models` (
  `id_model` int NOT NULL,
  `title` varchar(10) NOT NULL,
  `id_mark` int NOT NULL,
  `price` int NOT NULL COMMENT 'цена',
  `info` varchar(20) NOT NULL COMMENT 'описание'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `models`
--

INSERT INTO `models` (`id_model`, `title`, `id_mark`, `price`, `info`) VALUES
(1, 'А4', 1, 1000, 'В наличии'),
(2, 'А6', 1, 1100, 'Под заказ'),
(3, 'Q5', 1, 1200, 'В наличии'),
(4, 'X5', 2, 1300, 'В наличии'),
(5, 'x2', 2, 800, 'Под заказ'),
(6, 'Polo', 3, 500, 'Под заказ'),
(7, 'Passat', 3, 900, 'В наличии'),
(8, 'Oktavia', 4, 950, 'В наличии'),
(9, 'Superb', 4, 1050, 'Под заказ');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `marki`
--
ALTER TABLE `marki`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id_model`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `marki`
--
ALTER TABLE `marki`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `models`
--
ALTER TABLE `models`
  MODIFY `id_model` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
