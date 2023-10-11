-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 11, 2023 at 09:32 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lara-vue-blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keyword` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `title`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `image`, `description`, `user_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Updated Web What Is Web Design', 'updated-web-what-is-web-design', 'What Is Web Design', 'What Is Web Design', 'What Is Web Design', 'uploads/Blog/what-is-web-design-1.webp', 'Web design is the process of creating and arranging visual elements on a website to enhance its aesthetics, usability, and functionality. It involves designing layouts, selecting colors, fonts, and images, as well as ensuring a user-friendly interface. Good web design combines artistic creativity with technical proficiency to deliver a seamless and engaging online experience for visitors. It also considers factors like responsive design for various devices, accessibility, and user experience optimization. Effective web design plays a crucial role in attracting and retaining users, conveying information, and achieving the website\'s goals, whether it\'s for business, informational, or entertainment purposes.', 1, 1, '2023-09-27 13:39:21', '2023-10-06 09:44:32'),
(2, 'Things To Tell Your Designer Before Starting A Project', 'things-to-tell-your-designer-before-starting-a-project', 'Things To Tell Your Designer Before Starting A Project', 'Things To Tell Your Designer Before Starting A Project', 'Things To Tell Your Designer Before Starting A Project', 'uploads/Blog/things-to-tell-your-designer-before-starting-a-project-2.webp', 'Communicating effectively with your designer before starting a project is crucial for achieving the desired results. Whether you\'re working on a website, a logo, a brochure, or any other design project, here are some key things you should convey to your designer:\r\n\r\nProject Objectives: Clearly define the purpose and goals of the project. Explain what you aim to achieve, whether it\'s to increase brand visibility, improve user experience, or convey a specific message.\r\n\r\nTarget Audience: Describe your target audience in detail. Provide information about their demographics, preferences, and behaviors. Understanding your audience helps the designer tailor the visuals to appeal to them effectively.\r\n\r\nBrand Guidelines: Share your brand guidelines, including logos, color schemes, fonts, and any existing design elements. Consistency in branding is essential for maintaining a strong brand identity.\r\n\r\nCompetitor Analysis: Inform your designer about your competitors and their design strategies. Highlight what sets you apart and what elements you\'d like to avoid.\r\n\r\nBudget and Timeline: Clearly state your budget constraints and project timeline. This helps the designer plan accordingly and make recommendations that align with your resources and schedule.\r\n\r\nContent: Provide all necessary content, including text, images, and any other media. If you\'re unsure about specific content, discuss it with your designer to determine if they can assist in sourcing or creating it.\r\n\r\nPurpose and Usage: Explain where and how the design will be used. Different platforms and mediums may have varying requirements, so your designer needs to know if the design is intended for print, web, social media, or other channels.\r\n\r\nDesign Preferences: Share your design preferences and any inspiration you have in mind. This could be in the form of examples, mood boards, or references from other designs you admire. Be open to your designer\'s creative input as well.\r\n\r\nFunctionality: If your project involves interactive elements or specific functionalities (e.g., navigation menus for a website), provide detailed requirements to ensure a seamless user experience.\r\n\r\nFeedback and Revisions: Establish a clear process for feedback and revisions. Determine how many rounds of revisions are included in the project scope and how feedback will be communicated.\r\n\r\nLegal Considerations: If there are legal restrictions or copyright concerns related to the project, inform your designer so they can work within those constraints.\r\n\r\nCommunication Channels: Establish preferred communication channels and frequency. Regular updates and open communication help keep the project on track.', 5, 1, '2023-09-27 13:41:48', '2023-09-27 13:41:48'),
(3, 'A Day In The Life Of A Web Designer', 'a-day-in-the-life-of-a-web-designer', 'A Day In The Life Of A Web Designer', 'A Day In The Life Of A Web Designer', 'A Day In The Life Of A Web Designer', 'uploads/Blog/a-day-in-the-life-of-a-web-designer-3.webp', 'This is a fun way to create a closer relationship between you and your readers. Show them how you go about your day when you’re working on a project: do you set specific micro-deadlines or do the work all in one go? Do you do anything specific to get in the right mindset for work? Do you have any secret techniques you use to provide the best service out there?', 1, 1, '2023-09-27 13:43:25', '2023-09-27 13:43:25'),
(4, 'Different File Types Associated With Web Design', 'different-file-types-associated-with-web-design', 'Different File Types Associated With Web Design', 'Different File Types Associated With Web Design', 'Different File Types Associated With Web Design', 'uploads/Blog/different-file-types-associated-with-web-design-4.webp', 'This should cover all the basics of the different file formats your potential customers may encounter and need, such as HTML, JPEG, EXE, and many others. Most people looking for a web designer won’t know much about these formats, so make this as informative as possible. You may even be able to use this blog post as a reference to send to your customers to guide them when choosing file formats for their websites.', 1, 1, '2023-09-27 13:45:39', '2023-09-27 13:45:39'),
(5, 'What is Codrops', 'what-is-codrops', 'What is Codrops', 'What is Codrops', 'What is Codrops', 'uploads/Blog/what-is-codrops-5.webp', 'Codrops features blogs with topics ranging from UI design and page animations to image formatting and general JavaScript practices. It also includes a handy CSS reference, a web development experiment playground, tutorials, blueprints to get started from and Collective - a digital design magazine that makes it easy to keep up with trends.', 5, 2, '2023-09-27 13:51:22', '2023-09-27 13:51:22'),
(6, 'What is Doctor', 'what-is-doctor', 'What is Doctor', 'What is Doctor', 'What is Doctor', 'uploads/Blog/what-is-doctor-6.webp', 'Docker is a platform that enables you to manage your application\'s development, running, and shipping independent of the infrastructure you are using. Docker uses isolated environments with app-specific dependencies installed to run applications. These isolated environments are known as containers.\r\n\r\nDocker gives us the ability to run multiple containers at the same time. Since they are isolated, we don’t need to worry about containers interfering. Thus, Docker containers can simultaneously have different software versions running in different isolated environments. The added benefit is that we don’t need to clutter our host machine with multiple versions of the same software.\r\n\r\nDocker containers are built by following pre-written instructions. These instructions are written as part of a Docker image. A Docker image is a template created by the developer, and it contains the application code, libraries, tools, and other dependencies required to run the application inside a Docker container, making the Docker image portable and platform-independent.\r\n\r\nDocker images open for public use are available on Docker Hub (https://hub.docker.com/).', 5, 2, '2023-09-27 13:54:48', '2023-09-27 13:54:48'),
(7, 'Young Real Madrid fan wearing Vinicius Jr shirt', 'young-real-madrid-fan-wearing-vinicius-jr-shirt', 'Young Real Madrid fan wearing Vinicius Jr shirt', 'Young Real Madrid fan wearing Vinicius Jr shirt', 'Young Real Madrid fan wearing Vinicius Jr shirt', 'uploads/Blog/young-real-madrid-fan-wearing-vinicius-jr-shirt-7.webp', 'A young Real Madrid fan was allegedly the target of racist abuse from Atletico Madrid fans outside the Wanda Metropolitano on Sunday.\r\n\r\nThe supporter was wearing a shirt with Vinicius Junior\'s name and number on the back at the Madrid derby, which Atletico won 3-1.\r\n\r\nA young black girl, her mother and aunt were reportedly intimidated and the subject of abuse by Atletico fans.\r\n\r\nPolice have been alerted to the incident and the prosecutor\'s office has received an official complaint.\r\n\r\nArticle continues below\r\n\r\nAccording to The Athletic, ex-Madrid striker Emilio Butragueno has invited the girl to the club\'s hospitality box for their La Liga fixture against Las Palmas on Wednesday evening.\r\n\r\nIncidents of racist abuse from Atletico supporters towards Real players and their fans have been more frequent in recent meetings between the two rivals.\r\n\r\nIn September last year, Atletico fans made racist chants about Vinicius outside the stadium before the game. A section of supporters also made monkey noises throughout the game.\r\n\r\nAtletico denounced the supporters on that occasion, saying the chants \"provoke enormous repulsion and indignation. We will not allow any individual to hide behind our colours to utter insults of a racist or xenophobic nature\".\r\n\r\nThe incidents did not stop there, however, as the Brazilian winger hit out at La Liga after he was targeted by Valencia fans.\r\n\r\n\"I\'m so sorry. The championship that once belonged to Ronaldinho, Ronaldo, Cristiano [Ronaldo] and [Lionel] Messi today belongs to racists,\" he wrote before sharing a video compiling the many racist attacks he was the victim of throughout last season.', 1, 3, '2023-09-27 14:05:42', '2023-09-27 14:05:42'),
(8, 'Real Madrid player ratings vs Las Palmas: Brahim Diaz steps up in Jude Bellingham\'s', 'real-madrid-player-ratings-vs-las-palmas-brahim-diaz-steps-up-in-jude-bellinghams', 'Real Madrid player ratings vs Las Palmas: Brahim Diaz steps up in Jude Bellingham\'s', 'Real Madrid player ratings vs Las Palmas: Brahim Diaz steps up in Jude Bellingham\'s', 'Real Madrid player ratings vs Las Palmas: Brahim Diaz steps up in Jude Bellingham\'s', 'uploads/Blog/real-madrid-player-ratings-vs-las-palmas-brahim-diaz-steps-up-in-jude-bellinghams-8.webp', 'The former AC Milan loanee showed that Carlo Ancelotti\'s side can survive without their star man, at least against La Liga\'s lesser sides\r\n\r\nBrahim Diaz deputised admirably for the rested Jude Bellingham, scoring Real Madrid\'s opener and proving a creative nuisance in the middle of the park as they comfortably saw off an ambitious Las Palmas side on Wednesday. The attacking midfielder, making his first Madrid start in La Liga since 2019, proved that his team, if nothing else, have a viable alternative when Bellingham needs a rest.\r\n\r\nMadrid came close early on, Rodrygo stinging the palms of goalkeeper Alvaro Valles after the home side won the ball in the Las Palmas box. There were further chances, too, as Joselu was denied twice in quick succession, and Brahim squandered a one-on-one.\r\n\r\nBut the midfielder kept his composure in first-half stoppage-time, firing a shot into the top corner off a Lucas Vazquez cut-back. Madrid then doubled their advantage early in the second half, with Joselu nodding Rodrygo\'s cross into the top corner after a flowing move.', 5, 3, '2023-09-27 14:07:13', '2023-09-27 14:07:13'),
(9, 'Seram Island & Ora Beach Travel Guide (Maluku, Indonesia)', 'seram-island-ora-beach-travel-guide-maluku-indonesia', 'Seram Island & Ora Beach Travel Guide (Maluku, Indonesia)', 'Seram Island & Ora Beach Travel Guide (Maluku, Indonesia)', 'Seram Island & Ora Beach Travel Guide (Maluku, Indonesia)', 'uploads/Blog/seram-island-ora-beach-travel-guide-maluku-indonesia-9.webp', 'Seram island in Maluku is one of the best kept secrets of Indonesia. The beautiful Ora Beach Resort has views like Bora Bora, and most of the island is still relatively unexplored.\r\n\r\nThis is one of the best places to visit in Indonesia if you’re looking for a secluded paradise with jungles, mountains, beaches, and wildlife.\r\n\r\nSeram island is not exactly easy to reach, and Ora bay is even more isolated, but you’re rewarded with stunning scenery and lots of great snorkeling opportunities without the crowds you’d see in places like Bali.\r\n\r\nThis travel guide will explain how to get to Seram island and Ora beach, where to stay, best things to do in the area, and everything else you need to know before you go!', 1, 4, '2023-09-27 14:08:35', '2023-09-27 14:08:35'),
(10, 'Rock Islands Palau Boat Tour: Milky Way, Long Beach & More', 'rock-islands-palau-boat-tour-milky-way-long-beach-more', 'Rock Islands Palau Boat Tour: Milky Way, Long Beach & More', 'Rock Islands Palau Boat Tour: Milky Way, Long Beach & More', 'Rock Islands Palau Boat Tour: Milky Way, Long Beach & More', 'uploads/Blog/update-6520524788370.webp', 'The Palau Rock Islands have earned UNESCO status for their incredible scenery, and they’re one of the main tourist sights in the country of Palau. While many people choose to see the islands with a scenic flight, another great option is to visit them with a boat tour.\r\n\r\nOn a speed boat tour to the Rock Islands of Palau, you can do lots of fun activities like swimming in a bright turquoise lagoon nicknamed the Milky Way, walking on a soft white sandbar called Long Beach, and even snorkeling in a lake full of stingless jellyfish!\r\n\r\nThis travel guide will explain everything you need to know about visiting the Palau Rock Islands by boat, including the best tour company, current tour prices, a map of the islands, and the best things to see and do in the islands on a day trip from the town of Koror.', 1, 4, '2023-09-27 14:09:36', '2023-10-06 12:30:31');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Web Design', '2023-09-27 04:13:56', '2023-09-27 04:13:56'),
(2, 'Web Development', '2023-09-27 04:14:11', '2023-09-27 04:14:11'),
(3, 'Sport', '2023-09-27 04:14:16', '2023-09-27 13:56:00'),
(4, 'Travel', '2023-09-27 04:14:20', '2023-09-27 13:56:15'),
(5, 'Science and Technology', '2023-09-27 04:14:25', '2023-09-27 13:57:00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_09_24_180238_create_categories_table', 2),
(7, '2023_09_25_200831_create_blog_posts_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_check` tinyint DEFAULT '0',
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `admin_check`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sohel Rana', 'sohel@gmail.com', NULL, '$2y$10$hqsyXloSaRRkLoTBJzIEuupcjz2lRLNnmpJpVuiFqxz9RwV.NrNrK', 1, NULL, NULL, NULL, '2023-09-21 05:59:41', '2023-09-21 05:59:41'),
(2, 'Sohel Rana', 'ss@gmail.com', NULL, '$2y$10$ti.gIRFUipyKG2BhTl.fWOb4NU/Nzah0Cq/mkHB3d/H3tKj6a1vMe', 0, NULL, NULL, NULL, '2023-09-21 06:29:47', '2023-09-21 06:29:47'),
(3, 'sdsdsd', 'sdsd@gmail.com', NULL, '$2y$10$dsMSe8Tdh4JAz7.tOPNq0uz/R/IdgC66Jm.GGhPPVtUx9MOxBpu66', 0, NULL, NULL, NULL, '2023-09-23 06:00:20', '2023-09-23 06:00:20'),
(4, 'rrr', 'rasel@gmail.com', NULL, '$2y$10$99KE8H/uVHJZlZBdQb7NnedCOZqsi8EnOLhIGliuFzy8QF96Owu8C', 0, NULL, NULL, NULL, '2023-09-23 09:27:15', '2023-09-23 09:27:15'),
(5, 'test', 'test@gmail.com', NULL, '$2y$10$hqsyXloSaRRkLoTBJzIEuupcjz2lRLNnmpJpVuiFqxz9RwV.NrNrK', 0, NULL, NULL, NULL, '2023-09-23 09:31:02', '2023-09-23 09:31:02'),
(6, 'Postman', 'postman@gmail.com', NULL, '$2y$10$WObjZGuLPnV6EnncS7ulAepTmiI/W2hmLKlxN8o8joQYvd2/6h/p.', 0, NULL, NULL, NULL, '2023-10-02 09:07:04', '2023-10-02 09:07:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_posts_user_id_foreign` (`user_id`),
  ADD KEY `blog_posts_category_id_foreign` (`category_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
