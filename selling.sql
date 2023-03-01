-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 01 2023 г., 11:13
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `selling`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertArrivals` (IN `A` VARCHAR(50) CHARSET utf8, IN `B` BIGINT UNSIGNED, IN `C` INT, IN `D` INT, IN `E` DATE)  NO SQL
INSERT INTO arrivals(number, name_id, amount, price, data) 
VALUES (A, B, C, D, E)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `arrivals`
--

CREATE TABLE `arrivals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` char(50) COLLATE utf8_bin NOT NULL,
  `name_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `arrivals`
--

INSERT INTO `arrivals` (`id`, `number`, `name_id`, `amount`, `price`, `data`) VALUES
(1, '1', 1, 300, 5000, '2021-01-01'),
(2, 't-500', 2, 10, 6000, '2021-01-02'),
(3, '12-TP-777', 3, 100, 500, '2021-01-13'),
(4, '12-TP-778', 3, 50, 300, '2021-01-14'),
(5, '12-TP-779', 3, 77, 539, '2021-01-20'),
(6, '12-TP-877', 3, 32, 176, '2021-01-30'),
(7, '12-TP-977', 3, 94, 554, '2021-02-01'),
(8, '12-TP-979', 3, 200, 1000, '2021-02-05');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`) VALUES
(1, 'Колбаса'),
(3, 'Левый носок'),
(2, 'Пармезан');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `arrivals`
--
ALTER TABLE `arrivals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name_id` (`name_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `arrivals`
--
ALTER TABLE `arrivals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `arrivals`
--
ALTER TABLE `arrivals`
  ADD CONSTRAINT `arrivals_ibfk_1` FOREIGN KEY (`name_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
