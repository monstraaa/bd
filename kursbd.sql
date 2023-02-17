-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 17 2023 г., 06:52
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kursbd`
--

-- --------------------------------------------------------

--
-- Структура таблицы `baggage`
--

CREATE TABLE `baggage` (
  `ID_baggage` int(11) NOT NULL,
  `Baggage_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `brigades`
--

CREATE TABLE `brigades` (
  `ID_brigade` int(11) NOT NULL,
  `Brigade_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `divisions`
--

CREATE TABLE `divisions` (
  `ID_division` int(11) NOT NULL,
  `Division_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `flights`
--

CREATE TABLE `flights` (
  `ID_flight` int(11) NOT NULL,
  `ID_plane` int(11) NOT NULL,
  `ID_company` int(11) NOT NULL,
  `Flight_departure_day` int(11) NOT NULL,
  `Flight_departure_time` int(11) NOT NULL,
  `Flight_arrival_day` int(11) NOT NULL,
  `Flight_arrival_time` int(11) NOT NULL,
  `Flight_duration` int(11) NOT NULL,
  `ID_ticket` int(11) NOT NULL,
  `Flight_is_delayed` tinyint(1) NOT NULL,
  `Flight_delayed_reason` varchar(50) NOT NULL,
  `Flight_delayed_time` int(11) NOT NULL,
  `Flight_delayed_duration` int(11) NOT NULL,
  `Flight_is_canceld` tinyint(1) NOT NULL,
  `ID_route` int(11) NOT NULL,
  `Flight_vacant_seats` int(11) NOT NULL,
  `Flight_ratio` int(11) NOT NULL,
  `Flight_passengers_amount` int(11) NOT NULL,
  `Flight_passengers` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `foreign_passports`
--

CREATE TABLE `foreign_passports` (
  `ID_foreign_passport` int(11) NOT NULL,
  `Foreign_passport_data` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `passengers`
--

CREATE TABLE `passengers` (
  `ID_passenger` int(11) NOT NULL,
  `Passenger_is_ticket` tinyint(1) NOT NULL,
  `Passenger_age` int(11) NOT NULL,
  `Passenger_is_passport` tinyint(1) NOT NULL,
  `ID_passport` int(11) NOT NULL,
  `Passenger_is_foregin_passport` tinyint(1) NOT NULL,
  `ID_foregin_passport` int(11) NOT NULL,
  `Passenger_is_inspected` tinyint(1) NOT NULL,
  `Passenger_is_baggage` tinyint(1) NOT NULL,
  `ID_baggage` int(11) NOT NULL,
  `Passenger_is_departed` tinyint(1) NOT NULL,
  `Passenger_is_abroad` tinyint(1) NOT NULL,
  `Passenger_departure_date` int(11) NOT NULL,
  `ID_flight` int(11) NOT NULL,
  `ID_ticket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `passports`
--

CREATE TABLE `passports` (
  `ID_passport` int(11) NOT NULL,
  `Passport_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `planes`
--

CREATE TABLE `planes` (
  `ID_plane` int(11) NOT NULL,
  `Plane_type` int(11) NOT NULL,
  `Brigade_pilots` int(11) NOT NULL,
  `Brigade_techs` int(11) NOT NULL,
  `Brigade_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `routes`
--

CREATE TABLE `routes` (
  `ID_route` int(11) NOT NULL,
  `Route_name` varchar(50) NOT NULL,
  `Route_start` varchar(50) NOT NULL,
  `Route_end` varchar(50) NOT NULL,
  `Route_transfers` int(11) NOT NULL,
  `Rote_minimum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `ticket`
--

CREATE TABLE `ticket` (
  `ID_ticket` int(11) NOT NULL,
  `Ticket_is_preorder` tinyint(1) NOT NULL,
  `Ticket_is_reserved` tinyint(1) NOT NULL,
  `Ticket_price` int(11) NOT NULL,
  `Ticket_is_returned` tinyint(1) NOT NULL,
  `Ticket_return_time` int(11) NOT NULL,
  `ID_flight` int(11) NOT NULL,
  `ID_route` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `workers`
--

CREATE TABLE `workers` (
  `ID_worker` int(11) NOT NULL,
  `worker_name` varchar(50) NOT NULL,
  `worker_famname` varchar(50) NOT NULL,
  `ID_division` int(11) NOT NULL,
  `ID_brigade` int(11) NOT NULL,
  `Worker_position` varchar(50) NOT NULL,
  `Worker_salary` int(11) NOT NULL,
  `Worker_experience` int(11) NOT NULL,
  `Worker_gender` varchar(50) NOT NULL,
  `Worker_age` int(11) NOT NULL,
  `Worker_is_kids` tinyint(1) NOT NULL,
  `Worker_kids` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `baggage`
--
ALTER TABLE `baggage`
  ADD PRIMARY KEY (`ID_baggage`);

--
-- Индексы таблицы `brigades`
--
ALTER TABLE `brigades`
  ADD PRIMARY KEY (`ID_brigade`);

--
-- Индексы таблицы `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`ID_division`);

--
-- Индексы таблицы `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`ID_flight`),
  ADD KEY `ID_plane` (`ID_plane`),
  ADD KEY `ID_route` (`ID_route`),
  ADD KEY `ID_ticket` (`ID_ticket`);

--
-- Индексы таблицы `foreign_passports`
--
ALTER TABLE `foreign_passports`
  ADD PRIMARY KEY (`ID_foreign_passport`);

--
-- Индексы таблицы `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`ID_passenger`),
  ADD KEY `ID_flight` (`ID_flight`),
  ADD KEY `ID_ticket` (`ID_ticket`),
  ADD KEY `ID_baggage` (`ID_baggage`),
  ADD KEY `ID_foregin_passport` (`ID_foregin_passport`),
  ADD KEY `ID_passport` (`ID_passport`);

--
-- Индексы таблицы `passports`
--
ALTER TABLE `passports`
  ADD PRIMARY KEY (`ID_passport`);

--
-- Индексы таблицы `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`ID_plane`);

--
-- Индексы таблицы `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`ID_route`);

--
-- Индексы таблицы `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ID_ticket`),
  ADD KEY `ID_flight` (`ID_flight`),
  ADD KEY `ID_route` (`ID_route`);

--
-- Индексы таблицы `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`ID_worker`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `baggage`
--
ALTER TABLE `baggage`
  MODIFY `ID_baggage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `brigades`
--
ALTER TABLE `brigades`
  MODIFY `ID_brigade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `divisions`
--
ALTER TABLE `divisions`
  MODIFY `ID_division` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `flights`
--
ALTER TABLE `flights`
  MODIFY `ID_flight` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `foreign_passports`
--
ALTER TABLE `foreign_passports`
  MODIFY `ID_foreign_passport` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `passengers`
--
ALTER TABLE `passengers`
  MODIFY `ID_passenger` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `passports`
--
ALTER TABLE `passports`
  MODIFY `ID_passport` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `planes`
--
ALTER TABLE `planes`
  MODIFY `ID_plane` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `routes`
--
ALTER TABLE `routes`
  MODIFY `ID_route` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ID_ticket` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `workers`
--
ALTER TABLE `workers`
  MODIFY `ID_worker` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`ID_plane`) REFERENCES `planes` (`ID_plane`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`ID_route`) REFERENCES `routes` (`ID_route`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flights_ibfk_3` FOREIGN KEY (`ID_ticket`) REFERENCES `ticket` (`ID_ticket`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`ID_flight`) REFERENCES `flights` (`ID_flight`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `passengers_ibfk_2` FOREIGN KEY (`ID_ticket`) REFERENCES `ticket` (`ID_ticket`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `passengers_ibfk_3` FOREIGN KEY (`ID_baggage`) REFERENCES `baggage` (`ID_baggage`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `passengers_ibfk_4` FOREIGN KEY (`ID_foregin_passport`) REFERENCES `foreign_passports` (`ID_foreign_passport`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `passengers_ibfk_5` FOREIGN KEY (`ID_passport`) REFERENCES `passports` (`ID_passport`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`ID_flight`) REFERENCES `flights` (`ID_flight`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`ID_route`) REFERENCES `routes` (`ID_route`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
