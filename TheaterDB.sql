-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Май 08 2026 г., 20:17
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `TheaterDB`
--

-- --------------------------------------------------------

--
-- Структура таблицы `группа_спектакля`
--

CREATE TABLE `группа_спектакля` (
  `id` int NOT NULL,
  `спектакль_id` int DEFAULT NULL,
  `работник_id` int DEFAULT NULL,
  `роль` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `работники`
--

CREATE TABLE `работники` (
  `id` int NOT NULL,
  `фио` varchar(100) NOT NULL,
  `должность` varchar(50) DEFAULT NULL,
  `телефон` varchar(20) DEFAULT NULL,
  `зарплата` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `работники`
--

INSERT INTO `работники` (`id`, `фио`, `должность`, `телефон`, `зарплата`) VALUES
(1, 'Иванов Иван Иванович', 'Актер', '+7(999)123-45-67', '50000.00'),
(2, 'Петрова Мария Сергеевна', 'Режиссер', '+7(999)234-56-78', '70000.00'),
(3, 'Сидоров Алексей Петрович', 'Художник', '+7(999)345-67-89', '45000.00');

-- --------------------------------------------------------

--
-- Структура таблицы `расписание_гастролей`
--

CREATE TABLE `расписание_гастролей` (
  `id` int NOT NULL,
  `спектакль_id` int DEFAULT NULL,
  `город` varchar(100) DEFAULT NULL,
  `дата` date DEFAULT NULL,
  `место` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `репертуар`
--

CREATE TABLE `репертуар` (
  `id` int NOT NULL,
  `спектакль_id` int DEFAULT NULL,
  `дата_показа` date DEFAULT NULL,
  `цена_билета` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `спектакли`
--

CREATE TABLE `спектакли` (
  `id` int NOT NULL,
  `название` varchar(100) NOT NULL,
  `жанр` varchar(50) DEFAULT NULL,
  `длительность` int DEFAULT NULL,
  `режиссер` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `спектакли`
--

INSERT INTO `спектакли` (`id`, `название`, `жанр`, `длительность`, `режиссер`) VALUES
(2, 'Вишневый сад', 'Драма', 150, 'Немирович-Данченко'),
(3, 'Лебединое озеро', 'Балет', 130, 'Петипа'),
(4, 'ркеркер', 'рапрап', 65, 'арапра'),
(5, 'вапвап', 'ыпв', 54, 'ыпывп');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `группа_спектакля`
--
ALTER TABLE `группа_спектакля`
  ADD PRIMARY KEY (`id`),
  ADD KEY `спектакль_id` (`спектакль_id`),
  ADD KEY `работник_id` (`работник_id`);

--
-- Индексы таблицы `работники`
--
ALTER TABLE `работники`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `расписание_гастролей`
--
ALTER TABLE `расписание_гастролей`
  ADD PRIMARY KEY (`id`),
  ADD KEY `спектакль_id` (`спектакль_id`);

--
-- Индексы таблицы `репертуар`
--
ALTER TABLE `репертуар`
  ADD PRIMARY KEY (`id`),
  ADD KEY `спектакль_id` (`спектакль_id`);

--
-- Индексы таблицы `спектакли`
--
ALTER TABLE `спектакли`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `группа_спектакля`
--
ALTER TABLE `группа_спектакля`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `работники`
--
ALTER TABLE `работники`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `расписание_гастролей`
--
ALTER TABLE `расписание_гастролей`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `репертуар`
--
ALTER TABLE `репертуар`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `спектакли`
--
ALTER TABLE `спектакли`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `группа_спектакля`
--
ALTER TABLE `группа_спектакля`
  ADD CONSTRAINT `группа_спектакля_ibfk_1` FOREIGN KEY (`спектакль_id`) REFERENCES `спектакли` (`id`),
  ADD CONSTRAINT `группа_спектакля_ibfk_2` FOREIGN KEY (`работник_id`) REFERENCES `работники` (`id`);

--
-- Ограничения внешнего ключа таблицы `расписание_гастролей`
--
ALTER TABLE `расписание_гастролей`
  ADD CONSTRAINT `расписание_гастролей_ibfk_1` FOREIGN KEY (`спектакль_id`) REFERENCES `спектакли` (`id`);

--
-- Ограничения внешнего ключа таблицы `репертуар`
--
ALTER TABLE `репертуар`
  ADD CONSTRAINT `репертуар_ibfk_1` FOREIGN KEY (`спектакль_id`) REFERENCES `спектакли` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
