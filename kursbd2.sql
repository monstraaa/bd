-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 30 2023 г., 06:38
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
-- База данных: `kursbd2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `baggage`
--

CREATE TABLE `baggage` (
  `id` int(11) NOT NULL,
  `baggage_data` text NOT NULL COMMENT 'информация о багаже',
  `passenger_id` int(11) NOT NULL COMMENT 'пассажир с этим багажом'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='багажи пассажиров';

-- --------------------------------------------------------

--
-- Структура таблицы `brigades`
--

CREATE TABLE `brigades` (
  `id` int(11) NOT NULL,
  `brigade_type` varchar(50) NOT NULL COMMENT 'тип бригады'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='бригады работников';

-- --------------------------------------------------------

--
-- Структура таблицы `divisions`
--

CREATE TABLE `divisions` (
  `id` int(11) NOT NULL,
  `division_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Отделы работников';

-- --------------------------------------------------------

--
-- Структура таблицы `flights`
--

CREATE TABLE `flights` (
  `id` int(11) NOT NULL,
  `plane_id` int(11) NOT NULL COMMENT 'id самолёта на этом рейсе',
  `company_id` int(11) NOT NULL COMMENT 'id авиакомпании',
  `flight_departure_day` int(11) NOT NULL,
  `flight_departure_time` int(11) NOT NULL,
  `flight_arrival_day` int(11) NOT NULL,
  `flight_arrival_time` int(11) NOT NULL,
  `flight_duration` int(11) NOT NULL,
  `flight_delayed_reason` varchar(50) NOT NULL,
  `flight_delayed_time` int(11) NOT NULL,
  `flight_delayed_duration` int(11) NOT NULL,
  `flight_is_canceld` tinyint(4) NOT NULL COMMENT 'был ли рейс отменён?',
  `flight_vacant_seats` int(11) NOT NULL,
  `flight_vacant_seats_ratio` int(11) NOT NULL COMMENT 'отношение занятых и свободных мест'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `foreign_passports`
--

CREATE TABLE `foreign_passports` (
  `id` int(11) NOT NULL,
  `foreign_passport_data` text NOT NULL COMMENT 'информация о загранпаспорте',
  `passenger_id` int(11) NOT NULL COMMENT 'пассажир с этим загранпаспортом'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='загранпаспорта пассажиров';

-- --------------------------------------------------------

--
-- Структура таблицы `passengers`
--

CREATE TABLE `passengers` (
  `id` int(11) NOT NULL,
  `passenger_age` int(11) NOT NULL COMMENT 'возраст пассажира',
  `passenger_is_inspected` tinyint(4) NOT NULL COMMENT 'был ли пассажир досмотрен?'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='пассажиры и данные о них';

-- --------------------------------------------------------

--
-- Структура таблицы `passports`
--

CREATE TABLE `passports` (
  `id` int(11) NOT NULL,
  `passport_data` text NOT NULL COMMENT 'информация о паспорте',
  `passenger_id` int(11) NOT NULL COMMENT 'пассажир с этим паспортом'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='паспорта пассажиров ';

-- --------------------------------------------------------

--
-- Структура таблицы `planes`
--

CREATE TABLE `planes` (
  `id` int(11) NOT NULL,
  `plane_type` varchar(50) NOT NULL,
  `brigade_pilots` int(11) NOT NULL,
  `brigade_techs` int(11) NOT NULL,
  `brigade_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Самолёты и работающий с ними персонал';

-- --------------------------------------------------------

--
-- Структура таблицы `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `route_name` varchar(50) NOT NULL COMMENT 'название маршрута',
  `route_start` varchar(50) NOT NULL COMMENT 'пункт отправки',
  `route_end` varchar(50) NOT NULL COMMENT 'пункт прибытия',
  `route_transfers` int(11) NOT NULL COMMENT 'кол-во пересадок',
  `route_minimum` int(11) NOT NULL COMMENT 'рейс по этому маршруту отменяется если продано билетов меньше минимума'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='маршруты для рейсов';

-- --------------------------------------------------------

--
-- Структура таблицы `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `ticket_is_preordered` tinyint(4) NOT NULL COMMENT 'был ли билет предзаказан?',
  `ticket_is_reserved` tinyint(4) NOT NULL COMMENT 'был ли билет забронирован?',
  `ticket_price` int(11) NOT NULL,
  `ticket_return_time` int(11) NOT NULL COMMENT 'дата возврата билета',
  `flight_id` int(11) NOT NULL COMMENT 'рейс этого билета',
  `passenger_id` int(11) NOT NULL COMMENT 'пассажир с этим билетом',
  `route_id` int(11) NOT NULL COMMENT 'маршрут этого билета'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='билеты и их информация';

-- --------------------------------------------------------

--
-- Структура таблицы `workers`
--

CREATE TABLE `workers` (
  `id` int(11) NOT NULL,
  `worker_name` varchar(50) NOT NULL COMMENT 'имя работника',
  `worker_lname` varchar(50) NOT NULL COMMENT 'фамилия работника',
  `division_id` int(11) NOT NULL COMMENT 'отдел этого работника',
  `brigade_id` int(11) NOT NULL COMMENT 'бригада этого работника',
  `worker_position` varchar(50) NOT NULL COMMENT 'должность работника',
  `worker_salary` int(11) NOT NULL COMMENT 'зарплата работника',
  `worker_experience` int(11) NOT NULL COMMENT 'стаж работника',
  `worker_gender` varchar(3) NOT NULL COMMENT 'пол работника',
  `worker_age` int(11) NOT NULL,
  `worker_kids` int(11) NOT NULL COMMENT 'кол-во детей работника'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Работники их данные';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `baggage`
--
ALTER TABLE `baggage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `passenger_id` (`passenger_id`);

--
-- Индексы таблицы `brigades`
--
ALTER TABLE `brigades`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plane_id` (`plane_id`);

--
-- Индексы таблицы `foreign_passports`
--
ALTER TABLE `foreign_passports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `passenger_id` (`passenger_id`);

--
-- Индексы таблицы `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `passports`
--
ALTER TABLE `passports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `passenger_id` (`passenger_id`);

--
-- Индексы таблицы `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_ibfk_1` (`flight_id`),
  ADD KEY `passenger_id` (`passenger_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Индексы таблицы `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brigade_id` (`brigade_id`),
  ADD KEY `division_id` (`division_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `baggage`
--
ALTER TABLE `baggage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `brigades`
--
ALTER TABLE `brigades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `flights`
--
ALTER TABLE `flights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `foreign_passports`
--
ALTER TABLE `foreign_passports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `passengers`
--
ALTER TABLE `passengers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `passports`
--
ALTER TABLE `passports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `planes`
--
ALTER TABLE `planes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `workers`
--
ALTER TABLE `workers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `baggage`
--
ALTER TABLE `baggage`
  ADD CONSTRAINT `baggage_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`plane_id`) REFERENCES `planes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `foreign_passports`
--
ALTER TABLE `foreign_passports`
  ADD CONSTRAINT `foreign_passports_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `passports`
--
ALTER TABLE `passports`
  ADD CONSTRAINT `passports_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`brigade_id`) REFERENCES `brigades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `workers_ibfk_2` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
