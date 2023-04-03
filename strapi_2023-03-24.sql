# ************************************************************
# Antares - SQL Client
# Version 0.7.0
# 
# https://antares-sql.app/
# https://github.com/antares-sql/antares
# 
# Host: 127.0.0.1 (mariadb.org binary distribution 10.9.3)
# Database: strapi
# Generation time: 2023-03-24T08:43:14+01:00
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_permissions`;

CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_permissions_created_by_id_fk` (`created_by_id`),
  KEY `admin_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;

INSERT INTO `admin_permissions` (`id`, `action`, `subject`, `properties`, `conditions`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
	(1, "plugin::content-manager.explorer.create", "api::article.article", "{\"fields\":[\"slug\",\"publicationState\",\"publicationStages\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:52.413000", "2023-03-21 17:39:52.413000", NULL, NULL),
	(2, "plugin::content-manager.explorer.create", "api::blog.blog", "{\"fields\":[\"slug\",\"categoryText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:52.513000", "2023-03-21 17:39:52.513000", NULL, NULL),
	(3, "plugin::content-manager.explorer.create", "api::category.category", "{\"fields\":[\"name\",\"slug\",\"products\",\"articles\",\"projects\"]}", "[]", "2023-03-21 17:39:52.666000", "2023-03-21 17:39:52.666000", NULL, NULL),
	(4, "plugin::content-manager.explorer.create", "api::global.global", "{\"fields\":[\"navigation.links.href\",\"navigation.links.label\",\"navigation.links.target\",\"navigation.links.isExternal\",\"navigation.logo\",\"navigation.leftButton.href\",\"navigation.leftButton.label\",\"navigation.leftButton.target\",\"navigation.leftButton.isExternal\",\"navigation.rightButton.href\",\"navigation.rightButton.label\",\"navigation.rightButton.target\",\"navigation.rightButton.isExternal\",\"footer.footerColumns.label\",\"footer.footerColumns.links.href\",\"footer.footerColumns.links.label\",\"footer.footerColumns.links.target\",\"footer.footerColumns.links.isExternal\",\"footer.socialNetworks.url\",\"footer.button.theme\",\"footer.button.link.href\",\"footer.button.link.label\",\"footer.button.link.target\",\"footer.button.link.isExternal\",\"footer.label\"]}", "[]", "2023-03-21 17:39:52.713000", "2023-03-21 17:39:52.713000", NULL, NULL),
	(5, "plugin::content-manager.explorer.create", "api::page.page", "{\"fields\":[\"title\",\"slug\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\",\"editors\"]}", "[]", "2023-03-21 17:39:52.773000", "2023-03-21 17:39:52.773000", NULL, NULL),
	(6, "plugin::content-manager.explorer.create", "api::product.product", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:52.847000", "2023-03-21 17:39:52.847000", NULL, NULL),
	(7, "plugin::content-manager.explorer.create", "api::project.project", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:52.951000", "2023-03-21 17:39:52.951000", NULL, NULL),
	(8, "plugin::content-manager.explorer.create", "api::review.review", "{\"fields\":[\"content\",\"note\",\"author\"]}", "[]", "2023-03-21 17:39:53.022000", "2023-03-21 17:39:53.022000", NULL, NULL),
	(9, "plugin::content-manager.explorer.create", "api::shop.shop", "{\"fields\":[\"slug\",\"categoryText\",\"TagText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:53.061000", "2023-03-21 17:39:53.061000", NULL, NULL),
	(10, "plugin::content-manager.explorer.create", "api::tag.tag", "{\"fields\":[\"name\",\"products\"]}", "[]", "2023-03-21 17:39:53.195000", "2023-03-21 17:39:53.195000", NULL, NULL),
	(11, "plugin::content-manager.explorer.create", "api::work.work", "{\"fields\":[\"slug\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:53.258000", "2023-03-21 17:39:53.258000", NULL, NULL),
	(12, "plugin::content-manager.explorer.read", "api::article.article", "{\"fields\":[\"slug\",\"publicationState\",\"publicationStages\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:53.335000", "2023-03-21 17:39:53.335000", NULL, NULL),
	(13, "plugin::content-manager.explorer.read", "api::blog.blog", "{\"fields\":[\"slug\",\"categoryText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:53.468000", "2023-03-21 17:39:53.468000", NULL, NULL),
	(14, "plugin::content-manager.explorer.read", "api::category.category", "{\"fields\":[\"name\",\"slug\",\"products\",\"articles\",\"projects\"]}", "[]", "2023-03-21 17:39:53.558000", "2023-03-21 17:39:53.558000", NULL, NULL),
	(15, "plugin::content-manager.explorer.read", "api::global.global", "{\"fields\":[\"navigation.links.href\",\"navigation.links.label\",\"navigation.links.target\",\"navigation.links.isExternal\",\"navigation.logo\",\"navigation.leftButton.href\",\"navigation.leftButton.label\",\"navigation.leftButton.target\",\"navigation.leftButton.isExternal\",\"navigation.rightButton.href\",\"navigation.rightButton.label\",\"navigation.rightButton.target\",\"navigation.rightButton.isExternal\",\"footer.footerColumns.label\",\"footer.footerColumns.links.href\",\"footer.footerColumns.links.label\",\"footer.footerColumns.links.target\",\"footer.footerColumns.links.isExternal\",\"footer.socialNetworks.url\",\"footer.button.theme\",\"footer.button.link.href\",\"footer.button.link.label\",\"footer.button.link.target\",\"footer.button.link.isExternal\",\"footer.label\"]}", "[]", "2023-03-21 17:39:53.777000", "2023-03-21 17:39:53.777000", NULL, NULL),
	(16, "plugin::content-manager.explorer.read", "api::page.page", "{\"fields\":[\"title\",\"slug\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\",\"editors\"]}", "[]", "2023-03-21 17:39:53.917000", "2023-03-21 17:39:53.917000", NULL, NULL),
	(17, "plugin::content-manager.explorer.read", "api::product.product", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:54.035000", "2023-03-21 17:39:54.035000", NULL, NULL),
	(18, "plugin::content-manager.explorer.read", "api::project.project", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:54.093000", "2023-03-21 17:39:54.093000", NULL, NULL),
	(19, "plugin::content-manager.explorer.read", "api::review.review", "{\"fields\":[\"content\",\"note\",\"author\"]}", "[]", "2023-03-21 17:39:54.190000", "2023-03-21 17:39:54.190000", NULL, NULL),
	(20, "plugin::content-manager.explorer.read", "api::shop.shop", "{\"fields\":[\"slug\",\"categoryText\",\"TagText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:54.291000", "2023-03-21 17:39:54.291000", NULL, NULL),
	(21, "plugin::content-manager.explorer.read", "api::tag.tag", "{\"fields\":[\"name\",\"products\"]}", "[]", "2023-03-21 17:39:54.400000", "2023-03-21 17:39:54.400000", NULL, NULL),
	(22, "plugin::content-manager.explorer.read", "api::work.work", "{\"fields\":[\"slug\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:54.500000", "2023-03-21 17:39:54.500000", NULL, NULL),
	(23, "plugin::content-manager.explorer.update", "api::article.article", "{\"fields\":[\"slug\",\"publicationState\",\"publicationStages\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:54.572000", "2023-03-21 17:39:54.572000", NULL, NULL),
	(24, "plugin::content-manager.explorer.update", "api::blog.blog", "{\"fields\":[\"slug\",\"categoryText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:54.643000", "2023-03-21 17:39:54.643000", NULL, NULL),
	(25, "plugin::content-manager.explorer.update", "api::category.category", "{\"fields\":[\"name\",\"slug\",\"products\",\"articles\",\"projects\"]}", "[]", "2023-03-21 17:39:54.709000", "2023-03-21 17:39:54.709000", NULL, NULL),
	(26, "plugin::content-manager.explorer.update", "api::global.global", "{\"fields\":[\"navigation.links.href\",\"navigation.links.label\",\"navigation.links.target\",\"navigation.links.isExternal\",\"navigation.logo\",\"navigation.leftButton.href\",\"navigation.leftButton.label\",\"navigation.leftButton.target\",\"navigation.leftButton.isExternal\",\"navigation.rightButton.href\",\"navigation.rightButton.label\",\"navigation.rightButton.target\",\"navigation.rightButton.isExternal\",\"footer.footerColumns.label\",\"footer.footerColumns.links.href\",\"footer.footerColumns.links.label\",\"footer.footerColumns.links.target\",\"footer.footerColumns.links.isExternal\",\"footer.socialNetworks.url\",\"footer.button.theme\",\"footer.button.link.href\",\"footer.button.link.label\",\"footer.button.link.target\",\"footer.button.link.isExternal\",\"footer.label\"]}", "[]", "2023-03-21 17:39:54.856000", "2023-03-21 17:39:54.856000", NULL, NULL),
	(27, "plugin::content-manager.explorer.update", "api::page.page", "{\"fields\":[\"title\",\"slug\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\",\"editors\"]}", "[]", "2023-03-21 17:39:54.926000", "2023-03-21 17:39:54.926000", NULL, NULL),
	(28, "plugin::content-manager.explorer.update", "api::product.product", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:54.977000", "2023-03-21 17:39:54.977000", NULL, NULL),
	(29, "plugin::content-manager.explorer.update", "api::project.project", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:55.030000", "2023-03-21 17:39:55.030000", NULL, NULL),
	(30, "plugin::content-manager.explorer.update", "api::review.review", "{\"fields\":[\"content\",\"note\",\"author\"]}", "[]", "2023-03-21 17:39:55.114000", "2023-03-21 17:39:55.114000", NULL, NULL),
	(31, "plugin::content-manager.explorer.update", "api::shop.shop", "{\"fields\":[\"slug\",\"categoryText\",\"TagText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:55.178000", "2023-03-21 17:39:55.178000", NULL, NULL),
	(32, "plugin::content-manager.explorer.update", "api::tag.tag", "{\"fields\":[\"name\",\"products\"]}", "[]", "2023-03-21 17:39:55.233000", "2023-03-21 17:39:55.233000", NULL, NULL),
	(33, "plugin::content-manager.explorer.update", "api::work.work", "{\"fields\":[\"slug\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[]", "2023-03-21 17:39:55.297000", "2023-03-21 17:39:55.297000", NULL, NULL),
	(36, "plugin::content-manager.explorer.delete", "api::category.category", "{}", "[]", "2023-03-21 17:39:55.583000", "2023-03-21 17:39:55.583000", NULL, NULL),
	(43, "plugin::content-manager.explorer.delete", "api::tag.tag", "{}", "[]", "2023-03-21 17:39:56.273000", "2023-03-21 17:39:56.273000", NULL, NULL),
	(53, "plugin::upload.read", NULL, "{}", "[]", "2023-03-21 17:39:56.969000", "2023-03-21 17:39:56.969000", NULL, NULL),
	(54, "plugin::upload.configure-view", NULL, "{}", "[]", "2023-03-21 17:39:57.037000", "2023-03-21 17:39:57.037000", NULL, NULL),
	(55, "plugin::upload.assets.create", NULL, "{}", "[]", "2023-03-21 17:39:57.068000", "2023-03-21 17:39:57.068000", NULL, NULL),
	(56, "plugin::upload.assets.update", NULL, "{}", "[]", "2023-03-21 17:39:57.133000", "2023-03-21 17:39:57.133000", NULL, NULL),
	(57, "plugin::upload.assets.download", NULL, "{}", "[]", "2023-03-21 17:39:57.201000", "2023-03-21 17:39:57.201000", NULL, NULL),
	(58, "plugin::upload.assets.copy-link", NULL, "{}", "[]", "2023-03-21 17:39:57.297000", "2023-03-21 17:39:57.297000", NULL, NULL),
	(59, "plugin::content-manager.explorer.create", "api::article.article", "{\"fields\":[\"slug\",\"publicationState\",\"publicationStages\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:57.358000", "2023-03-21 17:39:57.358000", NULL, NULL),
	(60, "plugin::content-manager.explorer.create", "api::blog.blog", "{\"fields\":[\"slug\",\"categoryText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:57.443000", "2023-03-21 17:39:57.443000", NULL, NULL),
	(61, "plugin::content-manager.explorer.create", "api::category.category", "{\"fields\":[\"name\",\"slug\",\"products\",\"articles\",\"projects\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:57.667000", "2023-03-21 17:39:57.667000", NULL, NULL),
	(62, "plugin::content-manager.explorer.create", "api::global.global", "{\"fields\":[\"navigation.links.href\",\"navigation.links.label\",\"navigation.links.target\",\"navigation.links.isExternal\",\"navigation.logo\",\"navigation.leftButton.href\",\"navigation.leftButton.label\",\"navigation.leftButton.target\",\"navigation.leftButton.isExternal\",\"navigation.rightButton.href\",\"navigation.rightButton.label\",\"navigation.rightButton.target\",\"navigation.rightButton.isExternal\",\"footer.footerColumns.label\",\"footer.footerColumns.links.href\",\"footer.footerColumns.links.label\",\"footer.footerColumns.links.target\",\"footer.footerColumns.links.isExternal\",\"footer.socialNetworks.url\",\"footer.button.theme\",\"footer.button.link.href\",\"footer.button.link.label\",\"footer.button.link.target\",\"footer.button.link.isExternal\",\"footer.label\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:57.746000", "2023-03-21 17:39:57.746000", NULL, NULL),
	(63, "plugin::content-manager.explorer.create", "api::page.page", "{\"fields\":[\"title\",\"slug\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\",\"editors\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:57.838000", "2023-03-21 17:39:57.838000", NULL, NULL),
	(64, "plugin::content-manager.explorer.create", "api::product.product", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:57.935000", "2023-03-21 17:39:57.935000", NULL, NULL),
	(65, "plugin::content-manager.explorer.create", "api::project.project", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:58.016000", "2023-03-21 17:39:58.016000", NULL, NULL),
	(66, "plugin::content-manager.explorer.create", "api::review.review", "{\"fields\":[\"content\",\"note\",\"author\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:58.059000", "2023-03-21 17:39:58.059000", NULL, NULL),
	(67, "plugin::content-manager.explorer.create", "api::shop.shop", "{\"fields\":[\"slug\",\"categoryText\",\"TagText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:58.139000", "2023-03-21 17:39:58.139000", NULL, NULL),
	(68, "plugin::content-manager.explorer.create", "api::tag.tag", "{\"fields\":[\"name\",\"products\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:58.237000", "2023-03-21 17:39:58.237000", NULL, NULL),
	(69, "plugin::content-manager.explorer.create", "api::work.work", "{\"fields\":[\"slug\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:58.323000", "2023-03-21 17:39:58.323000", NULL, NULL),
	(70, "plugin::content-manager.explorer.read", "api::article.article", "{\"fields\":[\"slug\",\"publicationState\",\"publicationStages\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:58.438000", "2023-03-21 17:39:58.438000", NULL, NULL),
	(71, "plugin::content-manager.explorer.read", "api::blog.blog", "{\"fields\":[\"slug\",\"categoryText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:58.536000", "2023-03-21 17:39:58.536000", NULL, NULL),
	(72, "plugin::content-manager.explorer.read", "api::category.category", "{\"fields\":[\"name\",\"slug\",\"products\",\"articles\",\"projects\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:58.642000", "2023-03-21 17:39:58.642000", NULL, NULL),
	(73, "plugin::content-manager.explorer.read", "api::global.global", "{\"fields\":[\"navigation.links.href\",\"navigation.links.label\",\"navigation.links.target\",\"navigation.links.isExternal\",\"navigation.logo\",\"navigation.leftButton.href\",\"navigation.leftButton.label\",\"navigation.leftButton.target\",\"navigation.leftButton.isExternal\",\"navigation.rightButton.href\",\"navigation.rightButton.label\",\"navigation.rightButton.target\",\"navigation.rightButton.isExternal\",\"footer.footerColumns.label\",\"footer.footerColumns.links.href\",\"footer.footerColumns.links.label\",\"footer.footerColumns.links.target\",\"footer.footerColumns.links.isExternal\",\"footer.socialNetworks.url\",\"footer.button.theme\",\"footer.button.link.href\",\"footer.button.link.label\",\"footer.button.link.target\",\"footer.button.link.isExternal\",\"footer.label\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:58.767000", "2023-03-21 17:39:58.767000", NULL, NULL),
	(74, "plugin::content-manager.explorer.read", "api::page.page", "{\"fields\":[\"title\",\"slug\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\",\"editors\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:58.887000", "2023-03-21 17:39:58.887000", NULL, NULL),
	(75, "plugin::content-manager.explorer.read", "api::product.product", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:58.953000", "2023-03-21 17:39:58.953000", NULL, NULL),
	(76, "plugin::content-manager.explorer.read", "api::project.project", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:59.051000", "2023-03-21 17:39:59.051000", NULL, NULL),
	(77, "plugin::content-manager.explorer.read", "api::review.review", "{\"fields\":[\"content\",\"note\",\"author\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:59.179000", "2023-03-21 17:39:59.179000", NULL, NULL),
	(78, "plugin::content-manager.explorer.read", "api::shop.shop", "{\"fields\":[\"slug\",\"categoryText\",\"TagText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:59.265000", "2023-03-21 17:39:59.265000", NULL, NULL),
	(79, "plugin::content-manager.explorer.read", "api::tag.tag", "{\"fields\":[\"name\",\"products\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:59.360000", "2023-03-21 17:39:59.360000", NULL, NULL),
	(80, "plugin::content-manager.explorer.read", "api::work.work", "{\"fields\":[\"slug\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:59.414000", "2023-03-21 17:39:59.414000", NULL, NULL),
	(81, "plugin::content-manager.explorer.update", "api::article.article", "{\"fields\":[\"slug\",\"publicationState\",\"publicationStages\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:39:59.499000", "2023-03-21 17:39:59.499000", NULL, NULL),
	(82, "plugin::content-manager.explorer.update", "api::blog.blog", "{\"fields\":[\"slug\",\"categoryText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:40:00.069000", "2023-03-21 17:40:00.069000", NULL, NULL),
	(83, "plugin::content-manager.explorer.update", "api::category.category", "{\"fields\":[\"name\",\"slug\",\"products\",\"articles\",\"projects\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:40:00.822000", "2023-03-21 17:40:00.822000", NULL, NULL),
	(84, "plugin::content-manager.explorer.update", "api::global.global", "{\"fields\":[\"navigation.links.href\",\"navigation.links.label\",\"navigation.links.target\",\"navigation.links.isExternal\",\"navigation.logo\",\"navigation.leftButton.href\",\"navigation.leftButton.label\",\"navigation.leftButton.target\",\"navigation.leftButton.isExternal\",\"navigation.rightButton.href\",\"navigation.rightButton.label\",\"navigation.rightButton.target\",\"navigation.rightButton.isExternal\",\"footer.footerColumns.label\",\"footer.footerColumns.links.href\",\"footer.footerColumns.links.label\",\"footer.footerColumns.links.target\",\"footer.footerColumns.links.isExternal\",\"footer.socialNetworks.url\",\"footer.button.theme\",\"footer.button.link.href\",\"footer.button.link.label\",\"footer.button.link.target\",\"footer.button.link.isExternal\",\"footer.label\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:40:01.984000", "2023-03-21 17:40:01.984000", NULL, NULL),
	(85, "plugin::content-manager.explorer.update", "api::page.page", "{\"fields\":[\"title\",\"slug\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\",\"editors\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:40:02.771000", "2023-03-21 17:40:02.771000", NULL, NULL),
	(86, "plugin::content-manager.explorer.update", "api::product.product", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:40:03.529000", "2023-03-21 17:40:03.529000", NULL, NULL),
	(87, "plugin::content-manager.explorer.update", "api::project.project", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:40:05.051000", "2023-03-21 17:40:05.051000", NULL, NULL),
	(88, "plugin::content-manager.explorer.update", "api::review.review", "{\"fields\":[\"content\",\"note\",\"author\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:40:13.188000", "2023-03-21 17:40:13.188000", NULL, NULL),
	(89, "plugin::content-manager.explorer.update", "api::shop.shop", "{\"fields\":[\"slug\",\"categoryText\",\"TagText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:40:13.279000", "2023-03-21 17:40:13.279000", NULL, NULL),
	(90, "plugin::content-manager.explorer.update", "api::tag.tag", "{\"fields\":[\"name\",\"products\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:40:13.332000", "2023-03-21 17:40:13.332000", NULL, NULL),
	(91, "plugin::content-manager.explorer.update", "api::work.work", "{\"fields\":[\"slug\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"]}", "[\"admin::is-creator\"]", "2023-03-21 17:40:13.388000", "2023-03-21 17:40:13.388000", NULL, NULL),
	(94, "plugin::content-manager.explorer.delete", "api::category.category", "{}", "[\"admin::is-creator\"]", "2023-03-21 17:40:13.584000", "2023-03-21 17:40:13.584000", NULL, NULL),
	(101, "plugin::content-manager.explorer.delete", "api::tag.tag", "{}", "[\"admin::is-creator\"]", "2023-03-21 17:40:14.001000", "2023-03-21 17:40:14.001000", NULL, NULL),
	(103, "plugin::upload.read", NULL, "{}", "[\"admin::is-creator\"]", "2023-03-21 17:40:14.136000", "2023-03-21 17:40:14.136000", NULL, NULL),
	(104, "plugin::upload.configure-view", NULL, "{}", "[]", "2023-03-21 17:40:14.163000", "2023-03-21 17:40:14.163000", NULL, NULL),
	(105, "plugin::upload.assets.create", NULL, "{}", "[]", "2023-03-21 17:40:14.209000", "2023-03-21 17:40:14.209000", NULL, NULL),
	(106, "plugin::upload.assets.update", NULL, "{}", "[\"admin::is-creator\"]", "2023-03-21 17:40:14.268000", "2023-03-21 17:40:14.268000", NULL, NULL),
	(107, "plugin::upload.assets.download", NULL, "{}", "[]", "2023-03-21 17:40:14.363000", "2023-03-21 17:40:14.363000", NULL, NULL),
	(108, "plugin::upload.assets.copy-link", NULL, "{}", "[]", "2023-03-21 17:40:14.406000", "2023-03-21 17:40:14.406000", NULL, NULL),
	(109, "plugin::content-manager.explorer.create", "plugin::users-permissions.user", "{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"reviews\",\"articles\",\"picture\",\"job\"]}", "[]", "2023-03-21 17:40:15.282000", "2023-03-21 17:40:15.282000", NULL, NULL),
	(110, "plugin::content-manager.explorer.create", "api::article.article", "{\"fields\":[\"slug\",\"publicationState\",\"publicationStages\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:15.401000", "2023-03-21 17:40:15.401000", NULL, NULL),
	(111, "plugin::content-manager.explorer.create", "api::blog.blog", "{\"fields\":[\"slug\",\"categoryText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:15.461000", "2023-03-21 17:40:15.461000", NULL, NULL),
	(112, "plugin::content-manager.explorer.create", "api::category.category", "{\"fields\":[\"name\",\"slug\",\"products\",\"articles\",\"projects\"]}", "[]", "2023-03-21 17:40:15.536000", "2023-03-21 17:40:15.536000", NULL, NULL),
	(113, "plugin::content-manager.explorer.create", "api::global.global", "{\"fields\":[\"navigation.links.href\",\"navigation.links.label\",\"navigation.links.target\",\"navigation.links.isExternal\",\"navigation.logo\",\"navigation.leftButton.href\",\"navigation.leftButton.label\",\"navigation.leftButton.target\",\"navigation.leftButton.isExternal\",\"navigation.rightButton.href\",\"navigation.rightButton.label\",\"navigation.rightButton.target\",\"navigation.rightButton.isExternal\",\"footer.footerColumns.label\",\"footer.footerColumns.links.href\",\"footer.footerColumns.links.label\",\"footer.footerColumns.links.target\",\"footer.footerColumns.links.isExternal\",\"footer.socialNetworks.url\",\"footer.button.theme\",\"footer.button.link.href\",\"footer.button.link.label\",\"footer.button.link.target\",\"footer.button.link.isExternal\",\"footer.label\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:15.615000", "2023-03-21 17:40:15.615000", NULL, NULL),
	(114, "plugin::content-manager.explorer.create", "api::page.page", "{\"fields\":[\"title\",\"slug\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\",\"editors\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:15.699000", "2023-03-21 17:40:15.699000", NULL, NULL),
	(115, "plugin::content-manager.explorer.create", "api::product.product", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:15.770000", "2023-03-21 17:40:15.770000", NULL, NULL),
	(116, "plugin::content-manager.explorer.create", "api::project.project", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:15.858000", "2023-03-21 17:40:15.858000", NULL, NULL),
	(117, "plugin::content-manager.explorer.create", "api::review.review", "{\"fields\":[\"content\",\"note\",\"author\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:15.905000", "2023-03-21 17:40:15.905000", NULL, NULL),
	(118, "plugin::content-manager.explorer.create", "api::shop.shop", "{\"fields\":[\"slug\",\"categoryText\",\"TagText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:15.981000", "2023-03-21 17:40:15.981000", NULL, NULL),
	(119, "plugin::content-manager.explorer.create", "api::tag.tag", "{\"fields\":[\"name\",\"products\"]}", "[]", "2023-03-21 17:40:16.142000", "2023-03-21 17:40:16.142000", NULL, NULL),
	(120, "plugin::content-manager.explorer.create", "api::work.work", "{\"fields\":[\"slug\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:16.246000", "2023-03-21 17:40:16.246000", NULL, NULL),
	(121, "plugin::content-manager.explorer.read", "plugin::users-permissions.user", "{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"reviews\",\"articles\",\"picture\",\"job\"]}", "[]", "2023-03-21 17:40:16.306000", "2023-03-21 17:40:16.306000", NULL, NULL),
	(122, "plugin::content-manager.explorer.read", "api::article.article", "{\"fields\":[\"slug\",\"publicationState\",\"publicationStages\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:16.408000", "2023-03-21 17:40:16.408000", NULL, NULL),
	(123, "plugin::content-manager.explorer.read", "api::blog.blog", "{\"fields\":[\"slug\",\"categoryText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:16.476000", "2023-03-21 17:40:16.476000", NULL, NULL),
	(124, "plugin::content-manager.explorer.read", "api::category.category", "{\"fields\":[\"name\",\"slug\",\"products\",\"articles\",\"projects\"]}", "[]", "2023-03-21 17:40:16.572000", "2023-03-21 17:40:16.572000", NULL, NULL),
	(125, "plugin::content-manager.explorer.read", "api::global.global", "{\"fields\":[\"navigation.links.href\",\"navigation.links.label\",\"navigation.links.target\",\"navigation.links.isExternal\",\"navigation.logo\",\"navigation.leftButton.href\",\"navigation.leftButton.label\",\"navigation.leftButton.target\",\"navigation.leftButton.isExternal\",\"navigation.rightButton.href\",\"navigation.rightButton.label\",\"navigation.rightButton.target\",\"navigation.rightButton.isExternal\",\"footer.footerColumns.label\",\"footer.footerColumns.links.href\",\"footer.footerColumns.links.label\",\"footer.footerColumns.links.target\",\"footer.footerColumns.links.isExternal\",\"footer.socialNetworks.url\",\"footer.button.theme\",\"footer.button.link.href\",\"footer.button.link.label\",\"footer.button.link.target\",\"footer.button.link.isExternal\",\"footer.label\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:16.696000", "2023-03-21 17:40:16.696000", NULL, NULL),
	(126, "plugin::content-manager.explorer.read", "api::page.page", "{\"fields\":[\"title\",\"slug\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\",\"editors\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:16.801000", "2023-03-21 17:40:16.801000", NULL, NULL),
	(127, "plugin::content-manager.explorer.read", "api::product.product", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:16.872000", "2023-03-21 17:40:16.872000", NULL, NULL),
	(128, "plugin::content-manager.explorer.read", "api::project.project", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:16.934000", "2023-03-21 17:40:16.934000", NULL, NULL),
	(129, "plugin::content-manager.explorer.read", "api::review.review", "{\"fields\":[\"content\",\"note\",\"author\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:17.101000", "2023-03-21 17:40:17.101000", NULL, NULL),
	(130, "plugin::content-manager.explorer.read", "api::shop.shop", "{\"fields\":[\"slug\",\"categoryText\",\"TagText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:17.187000", "2023-03-21 17:40:17.187000", NULL, NULL),
	(131, "plugin::content-manager.explorer.read", "api::tag.tag", "{\"fields\":[\"name\",\"products\"]}", "[]", "2023-03-21 17:40:17.294000", "2023-03-21 17:40:17.294000", NULL, NULL),
	(132, "plugin::content-manager.explorer.read", "api::work.work", "{\"fields\":[\"slug\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:17.383000", "2023-03-21 17:40:17.383000", NULL, NULL),
	(133, "plugin::content-manager.explorer.update", "plugin::users-permissions.user", "{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"reviews\",\"articles\",\"picture\",\"job\"]}", "[]", "2023-03-21 17:40:17.458000", "2023-03-21 17:40:17.458000", NULL, NULL),
	(134, "plugin::content-manager.explorer.update", "api::article.article", "{\"fields\":[\"slug\",\"publicationState\",\"publicationStages\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:17.552000", "2023-03-21 17:40:17.552000", NULL, NULL),
	(135, "plugin::content-manager.explorer.update", "api::blog.blog", "{\"fields\":[\"slug\",\"categoryText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:17.621000", "2023-03-21 17:40:17.621000", NULL, NULL),
	(136, "plugin::content-manager.explorer.update", "api::category.category", "{\"fields\":[\"name\",\"slug\",\"products\",\"articles\",\"projects\"]}", "[]", "2023-03-21 17:40:17.701000", "2023-03-21 17:40:17.701000", NULL, NULL),
	(137, "plugin::content-manager.explorer.update", "api::global.global", "{\"fields\":[\"navigation.links.href\",\"navigation.links.label\",\"navigation.links.target\",\"navigation.links.isExternal\",\"navigation.logo\",\"navigation.leftButton.href\",\"navigation.leftButton.label\",\"navigation.leftButton.target\",\"navigation.leftButton.isExternal\",\"navigation.rightButton.href\",\"navigation.rightButton.label\",\"navigation.rightButton.target\",\"navigation.rightButton.isExternal\",\"footer.footerColumns.label\",\"footer.footerColumns.links.href\",\"footer.footerColumns.links.label\",\"footer.footerColumns.links.target\",\"footer.footerColumns.links.isExternal\",\"footer.socialNetworks.url\",\"footer.button.theme\",\"footer.button.link.href\",\"footer.button.link.label\",\"footer.button.link.target\",\"footer.button.link.isExternal\",\"footer.label\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:17.759000", "2023-03-21 17:40:17.759000", NULL, NULL),
	(138, "plugin::content-manager.explorer.update", "api::page.page", "{\"fields\":[\"title\",\"slug\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\",\"editors\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:17.884000", "2023-03-21 17:40:17.884000", NULL, NULL),
	(139, "plugin::content-manager.explorer.update", "api::product.product", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:17.968000", "2023-03-21 17:40:17.968000", NULL, NULL),
	(140, "plugin::content-manager.explorer.update", "api::project.project", "{\"fields\":[\"slug\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:18.142000", "2023-03-21 17:40:18.142000", NULL, NULL),
	(141, "plugin::content-manager.explorer.update", "api::review.review", "{\"fields\":[\"content\",\"note\",\"author\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:18.208000", "2023-03-21 17:40:18.208000", NULL, NULL),
	(142, "plugin::content-manager.explorer.update", "api::shop.shop", "{\"fields\":[\"slug\",\"categoryText\",\"TagText\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:18.318000", "2023-03-21 17:40:18.318000", NULL, NULL),
	(143, "plugin::content-manager.explorer.update", "api::tag.tag", "{\"fields\":[\"name\",\"products\"]}", "[]", "2023-03-21 17:40:18.375000", "2023-03-21 17:40:18.375000", NULL, NULL),
	(144, "plugin::content-manager.explorer.update", "api::work.work", "{\"fields\":[\"slug\",\"perPage\",\"main\",\"blocks\",\"seo.metaTitle\",\"seo.metaDescription\",\"seo.metaImage\",\"seo.metaSocial.socialNetwork\",\"seo.metaSocial.title\",\"seo.metaSocial.description\",\"seo.metaSocial.image\",\"seo.keywords\",\"seo.metaRobots\",\"seo.structuredData\",\"seo.metaViewport\",\"seo.canonicalURL\"],\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:18.483000", "2023-03-21 17:40:18.483000", NULL, NULL),
	(145, "plugin::content-manager.explorer.delete", "plugin::users-permissions.user", "{}", "[]", "2023-03-21 17:40:18.595000", "2023-03-21 17:40:18.595000", NULL, NULL),
	(146, "plugin::content-manager.explorer.delete", "api::article.article", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:18.671000", "2023-03-21 17:40:18.671000", NULL, NULL),
	(147, "plugin::content-manager.explorer.delete", "api::blog.blog", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:18.854000", "2023-03-21 17:40:18.854000", NULL, NULL),
	(148, "plugin::content-manager.explorer.delete", "api::category.category", "{}", "[]", "2023-03-21 17:40:18.934000", "2023-03-21 17:40:18.934000", NULL, NULL),
	(149, "plugin::content-manager.explorer.delete", "api::global.global", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:19.055000", "2023-03-21 17:40:19.055000", NULL, NULL),
	(150, "plugin::content-manager.explorer.delete", "api::page.page", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:19.119000", "2023-03-21 17:40:19.119000", NULL, NULL),
	(151, "plugin::content-manager.explorer.delete", "api::product.product", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:19.215000", "2023-03-21 17:40:19.215000", NULL, NULL),
	(152, "plugin::content-manager.explorer.delete", "api::project.project", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:19.287000", "2023-03-21 17:40:19.287000", NULL, NULL),
	(153, "plugin::content-manager.explorer.delete", "api::review.review", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:19.422000", "2023-03-21 17:40:19.422000", NULL, NULL),
	(154, "plugin::content-manager.explorer.delete", "api::shop.shop", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:19.497000", "2023-03-21 17:40:19.497000", NULL, NULL),
	(155, "plugin::content-manager.explorer.delete", "api::tag.tag", "{}", "[]", "2023-03-21 17:40:19.537000", "2023-03-21 17:40:19.537000", NULL, NULL),
	(156, "plugin::content-manager.explorer.delete", "api::work.work", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:19.614000", "2023-03-21 17:40:19.614000", NULL, NULL),
	(157, "plugin::content-manager.explorer.publish", "api::article.article", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:19.674000", "2023-03-21 17:40:19.674000", NULL, NULL),
	(158, "plugin::content-manager.explorer.publish", "api::blog.blog", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:19.773000", "2023-03-21 17:40:19.773000", NULL, NULL),
	(159, "plugin::content-manager.explorer.publish", "api::global.global", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:19.839000", "2023-03-21 17:40:19.839000", NULL, NULL),
	(160, "plugin::content-manager.explorer.publish", "api::page.page", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:19.953000", "2023-03-21 17:40:19.953000", NULL, NULL),
	(161, "plugin::content-manager.explorer.publish", "api::product.product", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:20.098000", "2023-03-21 17:40:20.098000", NULL, NULL),
	(162, "plugin::content-manager.explorer.publish", "api::project.project", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:20.159000", "2023-03-21 17:40:20.159000", NULL, NULL),
	(163, "plugin::content-manager.explorer.publish", "api::shop.shop", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:20.229000", "2023-03-21 17:40:20.229000", NULL, NULL),
	(164, "plugin::content-manager.explorer.publish", "api::work.work", "{\"locales\":[\"en\"]}", "[]", "2023-03-21 17:40:20.283000", "2023-03-21 17:40:20.283000", NULL, NULL),
	(165, "plugin::content-manager.single-types.configure-view", NULL, "{}", "[]", "2023-03-21 17:40:20.340000", "2023-03-21 17:40:20.340000", NULL, NULL),
	(166, "plugin::content-manager.collection-types.configure-view", NULL, "{}", "[]", "2023-03-21 17:40:20.401000", "2023-03-21 17:40:20.401000", NULL, NULL),
	(167, "plugin::content-manager.components.configure-layout", NULL, "{}", "[]", "2023-03-21 17:40:20.472000", "2023-03-21 17:40:20.472000", NULL, NULL),
	(168, "plugin::content-type-builder.read", NULL, "{}", "[]", "2023-03-21 17:40:20.533000", "2023-03-21 17:40:20.533000", NULL, NULL),
	(169, "plugin::email.settings.read", NULL, "{}", "[]", "2023-03-21 17:40:20.675000", "2023-03-21 17:40:20.675000", NULL, NULL),
	(170, "plugin::upload.read", NULL, "{}", "[]", "2023-03-21 17:40:20.720000", "2023-03-21 17:40:20.720000", NULL, NULL),
	(171, "plugin::upload.assets.create", NULL, "{}", "[]", "2023-03-21 17:40:20.794000", "2023-03-21 17:40:20.794000", NULL, NULL),
	(172, "plugin::upload.assets.update", NULL, "{}", "[]", "2023-03-21 17:40:20.863000", "2023-03-21 17:40:20.863000", NULL, NULL),
	(173, "plugin::upload.assets.download", NULL, "{}", "[]", "2023-03-21 17:40:20.925000", "2023-03-21 17:40:20.925000", NULL, NULL),
	(174, "plugin::upload.assets.copy-link", NULL, "{}", "[]", "2023-03-21 17:40:20.960000", "2023-03-21 17:40:20.960000", NULL, NULL),
	(175, "plugin::upload.configure-view", NULL, "{}", "[]", "2023-03-21 17:40:21.002000", "2023-03-21 17:40:21.002000", NULL, NULL),
	(176, "plugin::upload.settings.read", NULL, "{}", "[]", "2023-03-21 17:40:21.078000", "2023-03-21 17:40:21.078000", NULL, NULL),
	(177, "plugin::i18n.locale.create", NULL, "{}", "[]", "2023-03-21 17:40:21.166000", "2023-03-21 17:40:21.166000", NULL, NULL),
	(178, "plugin::i18n.locale.read", NULL, "{}", "[]", "2023-03-21 17:40:21.205000", "2023-03-21 17:40:21.205000", NULL, NULL),
	(179, "plugin::i18n.locale.update", NULL, "{}", "[]", "2023-03-21 17:40:21.268000", "2023-03-21 17:40:21.268000", NULL, NULL),
	(180, "plugin::i18n.locale.delete", NULL, "{}", "[]", "2023-03-21 17:40:21.328000", "2023-03-21 17:40:21.328000", NULL, NULL),
	(181, "plugin::users-permissions.roles.create", NULL, "{}", "[]", "2023-03-21 17:40:21.384000", "2023-03-21 17:40:21.384000", NULL, NULL),
	(182, "plugin::users-permissions.roles.read", NULL, "{}", "[]", "2023-03-21 17:40:21.463000", "2023-03-21 17:40:21.463000", NULL, NULL),
	(183, "plugin::users-permissions.roles.update", NULL, "{}", "[]", "2023-03-21 17:40:21.535000", "2023-03-21 17:40:21.535000", NULL, NULL),
	(184, "plugin::users-permissions.roles.delete", NULL, "{}", "[]", "2023-03-21 17:40:21.713000", "2023-03-21 17:40:21.713000", NULL, NULL),
	(185, "plugin::users-permissions.providers.read", NULL, "{}", "[]", "2023-03-21 17:40:21.824000", "2023-03-21 17:40:21.824000", NULL, NULL),
	(186, "plugin::users-permissions.providers.update", NULL, "{}", "[]", "2023-03-21 17:40:21.931000", "2023-03-21 17:40:21.931000", NULL, NULL),
	(187, "plugin::users-permissions.email-templates.read", NULL, "{}", "[]", "2023-03-21 17:40:21.983000", "2023-03-21 17:40:21.983000", NULL, NULL),
	(188, "plugin::users-permissions.email-templates.update", NULL, "{}", "[]", "2023-03-21 17:40:22.087000", "2023-03-21 17:40:22.087000", NULL, NULL),
	(189, "plugin::users-permissions.advanced-settings.read", NULL, "{}", "[]", "2023-03-21 17:40:22.186000", "2023-03-21 17:40:22.186000", NULL, NULL),
	(190, "plugin::users-permissions.advanced-settings.update", NULL, "{}", "[]", "2023-03-21 17:40:22.286000", "2023-03-21 17:40:22.286000", NULL, NULL),
	(191, "plugin::sitemap.settings.read", NULL, "{}", "[]", "2023-03-21 17:40:22.482000", "2023-03-21 17:40:22.482000", NULL, NULL),
	(192, "plugin::sitemap.menu-link", NULL, "{}", "[]", "2023-03-21 17:40:22.567000", "2023-03-21 17:40:22.567000", NULL, NULL),
	(193, "admin::marketplace.read", NULL, "{}", "[]", "2023-03-21 17:40:22.680000", "2023-03-21 17:40:22.680000", NULL, NULL),
	(194, "admin::marketplace.plugins.install", NULL, "{}", "[]", "2023-03-21 17:40:22.795000", "2023-03-21 17:40:22.795000", NULL, NULL),
	(195, "admin::marketplace.plugins.uninstall", NULL, "{}", "[]", "2023-03-21 17:40:22.908000", "2023-03-21 17:40:22.908000", NULL, NULL),
	(196, "admin::webhooks.create", NULL, "{}", "[]", "2023-03-21 17:40:23.008000", "2023-03-21 17:40:23.008000", NULL, NULL),
	(197, "admin::webhooks.read", NULL, "{}", "[]", "2023-03-21 17:40:23.118000", "2023-03-21 17:40:23.118000", NULL, NULL),
	(198, "admin::webhooks.update", NULL, "{}", "[]", "2023-03-21 17:40:23.264000", "2023-03-21 17:40:23.264000", NULL, NULL),
	(199, "admin::webhooks.delete", NULL, "{}", "[]", "2023-03-21 17:40:23.380000", "2023-03-21 17:40:23.380000", NULL, NULL),
	(200, "admin::users.create", NULL, "{}", "[]", "2023-03-21 17:40:23.544000", "2023-03-21 17:40:23.544000", NULL, NULL),
	(201, "admin::users.read", NULL, "{}", "[]", "2023-03-21 17:40:23.586000", "2023-03-21 17:40:23.586000", NULL, NULL),
	(202, "admin::users.update", NULL, "{}", "[]", "2023-03-21 17:40:23.649000", "2023-03-21 17:40:23.649000", NULL, NULL),
	(203, "admin::users.delete", NULL, "{}", "[]", "2023-03-21 17:40:23.760000", "2023-03-21 17:40:23.760000", NULL, NULL),
	(204, "admin::roles.create", NULL, "{}", "[]", "2023-03-21 17:40:23.841000", "2023-03-21 17:40:23.841000", NULL, NULL),
	(205, "admin::roles.read", NULL, "{}", "[]", "2023-03-21 17:40:23.914000", "2023-03-21 17:40:23.914000", NULL, NULL),
	(206, "admin::roles.update", NULL, "{}", "[]", "2023-03-21 17:40:23.992000", "2023-03-21 17:40:23.992000", NULL, NULL),
	(207, "admin::roles.delete", NULL, "{}", "[]", "2023-03-21 17:40:24.175000", "2023-03-21 17:40:24.175000", NULL, NULL),
	(208, "admin::api-tokens.access", NULL, "{}", "[]", "2023-03-21 17:40:24.307000", "2023-03-21 17:40:24.307000", NULL, NULL),
	(209, "admin::api-tokens.create", NULL, "{}", "[]", "2023-03-21 17:40:24.374000", "2023-03-21 17:40:24.374000", NULL, NULL),
	(210, "admin::api-tokens.read", NULL, "{}", "[]", "2023-03-21 17:40:24.410000", "2023-03-21 17:40:24.410000", NULL, NULL),
	(211, "admin::api-tokens.update", NULL, "{}", "[]", "2023-03-21 17:40:24.493000", "2023-03-21 17:40:24.493000", NULL, NULL),
	(212, "admin::api-tokens.regenerate", NULL, "{}", "[]", "2023-03-21 17:40:24.586000", "2023-03-21 17:40:24.586000", NULL, NULL),
	(213, "admin::api-tokens.delete", NULL, "{}", "[]", "2023-03-21 17:40:24.742000", "2023-03-21 17:40:24.742000", NULL, NULL),
	(214, "admin::project-settings.update", NULL, "{}", "[]", "2023-03-21 17:40:24.834000", "2023-03-21 17:40:24.834000", NULL, NULL),
	(215, "admin::project-settings.read", NULL, "{}", "[]", "2023-03-21 17:40:24.890000", "2023-03-21 17:40:24.890000", NULL, NULL);

/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table admin_permissions_role_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_permissions_role_links`;

CREATE TABLE `admin_permissions_role_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_role_links_unique` (`permission_id`,`role_id`),
  KEY `admin_permissions_role_links_fk` (`permission_id`),
  KEY `admin_permissions_role_links_inv_fk` (`role_id`),
  KEY `admin_permissions_role_links_order_inv_fk` (`permission_order`),
  CONSTRAINT `admin_permissions_role_links_fk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_permissions_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `admin_permissions_role_links` WRITE;
/*!40000 ALTER TABLE `admin_permissions_role_links` DISABLE KEYS */;

INSERT INTO `admin_permissions_role_links` (`id`, `permission_id`, `role_id`, `permission_order`) VALUES
	(1, 1, 2, 1),
	(2, 2, 2, 2),
	(3, 3, 2, 3),
	(4, 4, 2, 4),
	(5, 5, 2, 5),
	(6, 6, 2, 6),
	(7, 7, 2, 7),
	(8, 8, 2, 8),
	(9, 9, 2, 9),
	(10, 10, 2, 10),
	(11, 11, 2, 11),
	(12, 12, 2, 12),
	(13, 13, 2, 13),
	(14, 14, 2, 14),
	(15, 15, 2, 15),
	(16, 16, 2, 16),
	(17, 17, 2, 17),
	(18, 18, 2, 18),
	(19, 19, 2, 19),
	(20, 20, 2, 20),
	(21, 21, 2, 21),
	(22, 22, 2, 22),
	(23, 23, 2, 23),
	(24, 24, 2, 24),
	(25, 25, 2, 25),
	(26, 26, 2, 26),
	(27, 27, 2, 27),
	(28, 28, 2, 28),
	(29, 29, 2, 29),
	(30, 30, 2, 30),
	(31, 31, 2, 31),
	(32, 32, 2, 32),
	(33, 33, 2, 33),
	(36, 36, 2, 36),
	(43, 43, 2, 43),
	(53, 53, 2, 53),
	(54, 54, 2, 54),
	(55, 55, 2, 55),
	(56, 56, 2, 56),
	(57, 57, 2, 57),
	(58, 58, 2, 58),
	(59, 59, 3, 1),
	(60, 60, 3, 2),
	(61, 61, 3, 3),
	(62, 62, 3, 4),
	(63, 63, 3, 5),
	(64, 64, 3, 6),
	(65, 65, 3, 7),
	(66, 66, 3, 8),
	(67, 67, 3, 9),
	(68, 68, 3, 10),
	(69, 69, 3, 11),
	(70, 70, 3, 12),
	(71, 71, 3, 13),
	(72, 72, 3, 14),
	(73, 73, 3, 15),
	(74, 74, 3, 16),
	(75, 75, 3, 17),
	(76, 76, 3, 18),
	(77, 77, 3, 19),
	(78, 78, 3, 20),
	(79, 79, 3, 21),
	(80, 80, 3, 22),
	(81, 81, 3, 23),
	(82, 82, 3, 24),
	(83, 83, 3, 25),
	(84, 84, 3, 26),
	(85, 85, 3, 27),
	(86, 86, 3, 28),
	(87, 87, 3, 29),
	(88, 88, 3, 30),
	(89, 89, 3, 31),
	(90, 90, 3, 32),
	(91, 91, 3, 33),
	(94, 94, 3, 36),
	(101, 101, 3, 43),
	(103, 103, 3, 45),
	(104, 104, 3, 46),
	(105, 105, 3, 47),
	(106, 106, 3, 48),
	(107, 107, 3, 49),
	(108, 108, 3, 50),
	(109, 109, 1, 1),
	(110, 110, 1, 2),
	(111, 111, 1, 3),
	(112, 112, 1, 4),
	(113, 113, 1, 5),
	(114, 114, 1, 6),
	(115, 115, 1, 7),
	(116, 116, 1, 8),
	(117, 117, 1, 9),
	(118, 118, 1, 10),
	(119, 119, 1, 11),
	(120, 120, 1, 12),
	(121, 121, 1, 13),
	(122, 122, 1, 14),
	(123, 123, 1, 15),
	(124, 124, 1, 16),
	(125, 125, 1, 17),
	(126, 126, 1, 18),
	(127, 127, 1, 19),
	(128, 128, 1, 20),
	(129, 129, 1, 21),
	(130, 130, 1, 22),
	(131, 131, 1, 23),
	(132, 132, 1, 24),
	(133, 133, 1, 25),
	(134, 134, 1, 26),
	(135, 135, 1, 27),
	(136, 136, 1, 28),
	(137, 137, 1, 29),
	(138, 138, 1, 30),
	(139, 139, 1, 31),
	(140, 140, 1, 32),
	(141, 141, 1, 33),
	(142, 142, 1, 34),
	(143, 143, 1, 35),
	(144, 144, 1, 36),
	(145, 145, 1, 37),
	(146, 146, 1, 38),
	(147, 147, 1, 39),
	(148, 148, 1, 40),
	(149, 149, 1, 41),
	(150, 150, 1, 42),
	(151, 151, 1, 43),
	(152, 152, 1, 44),
	(153, 153, 1, 45),
	(154, 154, 1, 46),
	(155, 155, 1, 47),
	(156, 156, 1, 48),
	(157, 157, 1, 49),
	(158, 158, 1, 50),
	(159, 159, 1, 51),
	(160, 160, 1, 52),
	(161, 161, 1, 53),
	(162, 162, 1, 54),
	(163, 163, 1, 55),
	(164, 164, 1, 56),
	(165, 165, 1, 57),
	(166, 166, 1, 58),
	(167, 167, 1, 59),
	(168, 168, 1, 60),
	(169, 169, 1, 61),
	(170, 170, 1, 62),
	(171, 171, 1, 63),
	(172, 172, 1, 64),
	(173, 173, 1, 65),
	(174, 174, 1, 66),
	(175, 175, 1, 67),
	(176, 176, 1, 68),
	(177, 177, 1, 69),
	(178, 178, 1, 70),
	(179, 179, 1, 71),
	(180, 180, 1, 72),
	(181, 181, 1, 73),
	(182, 182, 1, 74),
	(183, 183, 1, 75),
	(184, 184, 1, 76),
	(185, 185, 1, 77),
	(186, 186, 1, 78),
	(187, 187, 1, 79),
	(188, 188, 1, 80),
	(189, 189, 1, 81),
	(190, 190, 1, 82),
	(191, 191, 1, 83),
	(192, 192, 1, 84),
	(193, 193, 1, 85),
	(194, 194, 1, 86),
	(195, 195, 1, 87),
	(196, 196, 1, 88),
	(197, 197, 1, 89),
	(198, 198, 1, 90),
	(199, 199, 1, 91),
	(200, 200, 1, 92),
	(201, 201, 1, 93),
	(202, 202, 1, 94),
	(203, 203, 1, 95),
	(204, 204, 1, 96),
	(205, 205, 1, 97),
	(206, 206, 1, 98),
	(207, 207, 1, 99),
	(208, 208, 1, 100),
	(209, 209, 1, 101),
	(210, 210, 1, 102),
	(211, 211, 1, 103),
	(212, 212, 1, 104),
	(213, 213, 1, 105),
	(214, 214, 1, 106),
	(215, 215, 1, 107);

/*!40000 ALTER TABLE `admin_permissions_role_links` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table admin_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_roles`;

CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_roles_created_by_id_fk` (`created_by_id`),
  KEY `admin_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;

INSERT INTO `admin_roles` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
	(1, "Super Admin", "strapi-super-admin", "Super Admins can access and manage all features and settings.", "2023-03-21 17:39:52.034000", "2023-03-21 17:39:52.034000", NULL, NULL),
	(2, "Editor", "strapi-editor", "Editors can manage and publish contents including those of other users.", "2023-03-21 17:39:52.069000", "2023-03-21 17:39:52.069000", NULL, NULL),
	(3, "Author", "strapi-author", "Authors can manage the content they have created.", "2023-03-21 17:39:52.087000", "2023-03-21 17:39:52.087000", NULL, NULL);

/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `registration_token` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `prefered_language` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_users_created_by_id_fk` (`created_by_id`),
  KEY `admin_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;

INSERT INTO `admin_users` (`id`, `firstname`, `lastname`, `username`, `email`, `password`, `reset_password_token`, `registration_token`, `is_active`, `blocked`, `prefered_language`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
	(1, "Taavetti", "Digital", NULL, "webmaster@taavetti.digital", "$2a$10$4rsklZGxEQRJDX6Kg5/viOJfkNxbr/kFT9HPVECIVJMmpqsHH8Ece", NULL, NULL, 1, 0, NULL, "2023-03-21 20:21:36.945000", "2023-03-21 20:21:36.945000", NULL, NULL);

/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table admin_users_roles_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users_roles_links`;

CREATE TABLE `admin_users_roles_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `role_order` double unsigned DEFAULT NULL,
  `user_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_roles_links_unique` (`user_id`,`role_id`),
  KEY `admin_users_roles_links_fk` (`user_id`),
  KEY `admin_users_roles_links_inv_fk` (`role_id`),
  KEY `admin_users_roles_links_order_fk` (`role_order`),
  KEY `admin_users_roles_links_order_inv_fk` (`user_order`),
  CONSTRAINT `admin_users_roles_links_fk` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_users_roles_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `admin_users_roles_links` WRITE;
/*!40000 ALTER TABLE `admin_users_roles_links` DISABLE KEYS */;

INSERT INTO `admin_users_roles_links` (`id`, `user_id`, `role_id`, `role_order`, `user_order`) VALUES
	(1, 1, 1, 1, 1);

/*!40000 ALTER TABLE `admin_users_roles_links` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `publication_state` varchar(255) DEFAULT NULL,
  `publication_stages` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`publication_stages`)),
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_slug_unique` (`slug`),
  KEY `article_created_by_id_fk` (`created_by_id`),
  KEY `article_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `article_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `article_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table article_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_components`;

CREATE TABLE `article_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `article_field_index` (`field`),
  KEY `article_component_type_index` (`component_type`),
  KEY `article_entity_fk` (`entity_id`),
  CONSTRAINT `article_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `article` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table article_localizations_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_localizations_links`;

CREATE TABLE `article_localizations_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned DEFAULT NULL,
  `inv_article_id` int(10) unsigned DEFAULT NULL,
  `article_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_localizations_links_unique` (`article_id`,`inv_article_id`),
  KEY `article_localizations_links_fk` (`article_id`),
  KEY `article_localizations_links_inv_fk` (`inv_article_id`),
  KEY `article_localizations_links_order_fk` (`article_order`),
  CONSTRAINT `article_localizations_links_fk` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `article_localizations_links_inv_fk` FOREIGN KEY (`inv_article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table blog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `category_text` varchar(255) DEFAULT NULL,
  `per_page` int(11) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_created_by_id_fk` (`created_by_id`),
  KEY `blog_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `blog_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `blog_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table blog_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_components`;

CREATE TABLE `blog_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `blog_field_index` (`field`),
  KEY `blog_component_type_index` (`component_type`),
  KEY `blog_entity_fk` (`entity_id`),
  CONSTRAINT `blog_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table blog_localizations_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_localizations_links`;

CREATE TABLE `blog_localizations_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(10) unsigned DEFAULT NULL,
  `inv_blog_id` int(10) unsigned DEFAULT NULL,
  `blog_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_localizations_links_unique` (`blog_id`,`inv_blog_id`),
  KEY `blog_localizations_links_fk` (`blog_id`),
  KEY `blog_localizations_links_inv_fk` (`inv_blog_id`),
  KEY `blog_localizations_links_order_fk` (`blog_order`),
  CONSTRAINT `blog_localizations_links_fk` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blog_localizations_links_inv_fk` FOREIGN KEY (`inv_blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_created_by_id_fk` (`created_by_id`),
  KEY `categories_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `categories_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_bio
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_bio`;

CREATE TABLE `components___lib_bio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `headline` varchar(255) DEFAULT NULL,
  `text` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components___lib_bio` WRITE;
/*!40000 ALTER TABLE `components___lib_bio` DISABLE KEYS */;

INSERT INTO `components___lib_bio` (`id`, `headline`, `text`) VALUES
	(1, "Hi, my name is David. I am a software engineer passionate about scaling the impact of founders and creators with tech. I am particularly fond of afrocentric startups and companies.", "With over 7 years of IT related work experience, I have developed a very unique skill set with software engineering at the center. In those years, I have developed competencies in digital strategy, product management, product design, and project management.\n\nWith my skills and experience, given the opportunity, I will grow the reach, effectiveness and efficiency of your products and solutions.");

/*!40000 ALTER TABLE `components___lib_bio` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components___lib_bio_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_bio_components`;

CREATE TABLE `components___lib_bio_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components___lib_bio_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components___lib_bio_field_index` (`field`),
  KEY `components___lib_bio_component_type_index` (`component_type`),
  KEY `components___lib_bio_entity_fk` (`entity_id`),
  CONSTRAINT `components___lib_bio_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components___lib_bio` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components___lib_bio_components` WRITE;
/*!40000 ALTER TABLE `components___lib_bio_components` DISABLE KEYS */;

INSERT INTO `components___lib_bio_components` (`id`, `entity_id`, `component_id`, `component_type`, `field`, `order`) VALUES
	(1, 1, 12, "__lib.link", "currentProject", NULL);

/*!40000 ALTER TABLE `components___lib_bio_components` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components___lib_buttons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_buttons`;

CREATE TABLE `components___lib_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_buttons_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_buttons_components`;

CREATE TABLE `components___lib_buttons_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components___lib_buttons_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components___lib_buttons_field_index` (`field`),
  KEY `components___lib_buttons_component_type_index` (`component_type`),
  KEY `components___lib_buttons_entity_fk` (`entity_id`),
  CONSTRAINT `components___lib_buttons_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components___lib_buttons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_cards
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_cards`;

CREATE TABLE `components___lib_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_comments`;

CREATE TABLE `components___lib_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_faqs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_faqs`;

CREATE TABLE `components___lib_faqs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_faqs_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_faqs_components`;

CREATE TABLE `components___lib_faqs_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components___lib_faqs_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components___lib_faqs_field_index` (`field`),
  KEY `components___lib_faqs_component_type_index` (`component_type`),
  KEY `components___lib_faqs_entity_fk` (`entity_id`),
  CONSTRAINT `components___lib_faqs_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components___lib_faqs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_features_checks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_features_checks`;

CREATE TABLE `components___lib_features_checks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_footer_columns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_footer_columns`;

CREATE TABLE `components___lib_footer_columns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components___lib_footer_columns` WRITE;
/*!40000 ALTER TABLE `components___lib_footer_columns` DISABLE KEYS */;

INSERT INTO `components___lib_footer_columns` (`id`, `label`) VALUES
	(1, "Contact");

/*!40000 ALTER TABLE `components___lib_footer_columns` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components___lib_footer_columns_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_footer_columns_components`;

CREATE TABLE `components___lib_footer_columns_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components___lib_footer_columns_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components___lib_footer_columns_field_index` (`field`),
  KEY `components___lib_footer_columns_component_type_index` (`component_type`),
  KEY `components___lib_footer_columns_entity_fk` (`entity_id`),
  CONSTRAINT `components___lib_footer_columns_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components___lib_footer_columns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components___lib_footer_columns_components` WRITE;
/*!40000 ALTER TABLE `components___lib_footer_columns_components` DISABLE KEYS */;

INSERT INTO `components___lib_footer_columns_components` (`id`, `entity_id`, `component_id`, `component_type`, `field`, `order`) VALUES
	(1, 1, 6, "__lib.link", "links", 1),
	(2, 1, 7, "__lib.link", "links", 2),
	(3, 1, 8, "__lib.link", "links", 3),
	(4, 1, 9, "__lib.link", "links", 4),
	(5, 1, 10, "__lib.link", "links", 5);

/*!40000 ALTER TABLE `components___lib_footer_columns_components` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components___lib_headers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_headers`;

CREATE TABLE `components___lib_headers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `text` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components___lib_headers` WRITE;
/*!40000 ALTER TABLE `components___lib_headers` DISABLE KEYS */;

INSERT INTO `components___lib_headers` (`id`, `theme`, `title`, `subtitle`, `text`) VALUES
	(1, "primary", "Hero", NULL, NULL),
	(2, "primary", "Featured Projects", NULL, NULL),
	(3, "primary", "Latest Code", NULL, NULL);

/*!40000 ALTER TABLE `components___lib_headers` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components___lib_headers_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_headers_components`;

CREATE TABLE `components___lib_headers_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components___lib_headers_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components___lib_headers_field_index` (`field`),
  KEY `components___lib_headers_component_type_index` (`component_type`),
  KEY `components___lib_headers_entity_fk` (`entity_id`),
  CONSTRAINT `components___lib_headers_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components___lib_headers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components___lib_headers_components` WRITE;
/*!40000 ALTER TABLE `components___lib_headers_components` DISABLE KEYS */;

INSERT INTO `components___lib_headers_components` (`id`, `entity_id`, `component_id`, `component_type`, `field`, `order`) VALUES
	(1, 3, 11, "__lib.link", "link", NULL);

/*!40000 ALTER TABLE `components___lib_headers_components` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components___lib_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_links`;

CREATE TABLE `components___lib_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `href` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `is_external` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components___lib_links` WRITE;
/*!40000 ALTER TABLE `components___lib_links` DISABLE KEYS */;

INSERT INTO `components___lib_links` (`id`, `href`, `label`, `target`, `is_external`) VALUES
	(1, " ", "Home", NULL, 0),
	(2, "/#work", "Work", NULL, 0),
	(3, "/about", "About", NULL, 0),
	(4, "#contact", "Contact", NULL, 0),
	(5, "/", "davidaloba", NULL, 0),
	(6, "https://twitter.com/davidaloba_", "Twitter", "_blank", 1),
	(7, "https://linkedin.com/in/davidaloba", "LinkedIn", "_blank", 1),
	(8, "mailto:davidaloba01@gmail.com", "Email", NULL, 0),
	(9, "tel:+2348124194919", "Telephone", NULL, 0),
	(10, "#", "Resume", NULL, 0),
	(11, "https://github.com/davidaloba", "View All", "_blank", 1),
	(12, "https://davidaloba.com", "davidaloba.com", "_blank", 1),
	(13, "mailto:davidaloba01@gmail.com", "send me a mail ", "_blank", 1),
	(14, "https://github.com/davidaloba", "Github", "_blank", 1),
	(15, "https://linkedin.com/in/davidaloba", "LinkedIn", "_blank", 1),
	(16, "https://twitter.com/davidaloba_", "Twitter", "_blank", 1),
	(17, "https://codepen.io/davidaloba_", "Code Pen", NULL, 0);

/*!40000 ALTER TABLE `components___lib_links` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components___lib_meta_socials
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_meta_socials`;

CREATE TABLE `components___lib_meta_socials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `social_network` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_perks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_perks`;

CREATE TABLE `components___lib_perks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `included` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_pricing_cards
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_pricing_cards`;

CREATE TABLE `components___lib_pricing_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_pricing_cards_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_pricing_cards_components`;

CREATE TABLE `components___lib_pricing_cards_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components___lib_pricing_cards_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components___lib_pricing_cards_field_index` (`field`),
  KEY `components___lib_pricing_cards_component_type_index` (`component_type`),
  KEY `components___lib_pricing_cards_entity_fk` (`entity_id`),
  CONSTRAINT `components___lib_pricing_cards_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components___lib_pricing_cards` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_publications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_publications`;

CREATE TABLE `components___lib_publications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publish_at` datetime(6) DEFAULT NULL,
  `ready` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_question_answers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_question_answers`;

CREATE TABLE `components___lib_question_answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_seos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_seos`;

CREATE TABLE `components___lib_seos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `keywords` longtext DEFAULT NULL,
  `meta_robots` varchar(255) DEFAULT NULL,
  `structured_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`structured_data`)),
  `meta_viewport` varchar(255) DEFAULT NULL,
  `canonical_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_seos_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_seos_components`;

CREATE TABLE `components___lib_seos_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components___lib_seos_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components___lib_seos_field_index` (`field`),
  KEY `components___lib_seos_component_type_index` (`component_type`),
  KEY `components___lib_seos_entity_fk` (`entity_id`),
  CONSTRAINT `components___lib_seos_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components___lib_seos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_social_network
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_social_network`;

CREATE TABLE `components___lib_social_network` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_team_cards
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_team_cards`;

CREATE TABLE `components___lib_team_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_team_cards_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_team_cards_components`;

CREATE TABLE `components___lib_team_cards_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components___lib_team_cards_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components___lib_team_cards_field_index` (`field`),
  KEY `components___lib_team_cards_component_type_index` (`component_type`),
  KEY `components___lib_team_cards_entity_fk` (`entity_id`),
  CONSTRAINT `components___lib_team_cards_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components___lib_team_cards` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_testimonials
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_testimonials`;

CREATE TABLE `components___lib_testimonials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) DEFAULT NULL,
  `text` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components___lib_widget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_widget`;

CREATE TABLE `components___lib_widget` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components___lib_widget` WRITE;
/*!40000 ALTER TABLE `components___lib_widget` DISABLE KEYS */;

INSERT INTO `components___lib_widget` (`id`, `title`, `text`) VALUES
	(1, "Work", "I\'d love to work with you in freelance or remote positions. "),
	(2, "Social Links", NULL);

/*!40000 ALTER TABLE `components___lib_widget` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components___lib_widget_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___lib_widget_components`;

CREATE TABLE `components___lib_widget_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components___lib_widget_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components___lib_widget_field_index` (`field`),
  KEY `components___lib_widget_component_type_index` (`component_type`),
  KEY `components___lib_widget_entity_fk` (`entity_id`),
  CONSTRAINT `components___lib_widget_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components___lib_widget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components___lib_widget_components` WRITE;
/*!40000 ALTER TABLE `components___lib_widget_components` DISABLE KEYS */;

INSERT INTO `components___lib_widget_components` (`id`, `entity_id`, `component_id`, `component_type`, `field`, `order`) VALUES
	(1, 1, 13, "__lib.link", "button", 1),
	(2, 2, 14, "__lib.link", "links", 1),
	(3, 2, 15, "__lib.link", "links", 2),
	(4, 2, 16, "__lib.link", "links", 3),
	(5, 2, 17, "__lib.link", "links", 4);

/*!40000 ALTER TABLE `components___lib_widget_components` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components___tech_stack
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components___tech_stack`;

CREATE TABLE `components___tech_stack` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components___tech_stack` WRITE;
/*!40000 ALTER TABLE `components___tech_stack` DISABLE KEYS */;

INSERT INTO `components___tech_stack` (`id`, `title`) VALUES
	(2, "Technologies I Use");

/*!40000 ALTER TABLE `components___tech_stack` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components_article_article_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_article_article_content`;

CREATE TABLE `components_article_article_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_article_related_articles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_article_related_articles`;

CREATE TABLE `components_article_related_articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_article_related_articles_articles_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_article_related_articles_articles_links`;

CREATE TABLE `components_article_related_articles_articles_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `related_articles_id` int(10) unsigned DEFAULT NULL,
  `article_id` int(10) unsigned DEFAULT NULL,
  `article_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_article_related_articles_articles_links_unique` (`related_articles_id`,`article_id`),
  KEY `components_article_related_articles_articles_links_fk` (`related_articles_id`),
  KEY `components_article_related_articles_articles_links_inv_fk` (`article_id`),
  KEY `components_article_related_articles_articles_links_order_fk` (`article_order`),
  CONSTRAINT `components_article_related_articles_articles_links_fk` FOREIGN KEY (`related_articles_id`) REFERENCES `components_article_related_articles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_article_related_articles_articles_links_inv_fk` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_article_related_articles_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_article_related_articles_components`;

CREATE TABLE `components_article_related_articles_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_article_related_articles_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_article_related_articles_field_index` (`field`),
  KEY `components_article_related_articles_component_type_index` (`component_type`),
  KEY `components_article_related_articles_entity_fk` (`entity_id`),
  CONSTRAINT `components_article_related_articles_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_article_related_articles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_blocks_about_me
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_blocks_about_me`;

CREATE TABLE `components_blocks_about_me` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components_blocks_about_me` WRITE;
/*!40000 ALTER TABLE `components_blocks_about_me` DISABLE KEYS */;

INSERT INTO `components_blocks_about_me` (`id`) VALUES
	(2);

/*!40000 ALTER TABLE `components_blocks_about_me` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components_blocks_about_me_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_blocks_about_me_components`;

CREATE TABLE `components_blocks_about_me_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_blocks_about_me_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_blocks_about_me_field_index` (`field`),
  KEY `components_blocks_about_me_component_type_index` (`component_type`),
  KEY `components_blocks_about_me_entity_fk` (`entity_id`),
  CONSTRAINT `components_blocks_about_me_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_blocks_about_me` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components_blocks_about_me_components` WRITE;
/*!40000 ALTER TABLE `components_blocks_about_me_components` DISABLE KEYS */;

INSERT INTO `components_blocks_about_me_components` (`id`, `entity_id`, `component_id`, `component_type`, `field`, `order`) VALUES
	(2, 2, 1, "__lib.bio", "bio", 1),
	(4, 2, 2, "__lib.tech-stack", "stack", 3),
	(5, 2, 1, "__lib.widgets", "widgets", 1),
	(6, 2, 2, "__lib.widgets", "widgets", 2);

/*!40000 ALTER TABLE `components_blocks_about_me_components` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components_blocks_cta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_blocks_cta`;

CREATE TABLE `components_blocks_cta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `command_line` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_blocks_featured_projects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_blocks_featured_projects`;

CREATE TABLE `components_blocks_featured_projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components_blocks_featured_projects` WRITE;
/*!40000 ALTER TABLE `components_blocks_featured_projects` DISABLE KEYS */;

INSERT INTO `components_blocks_featured_projects` (`id`) VALUES
	(1);

/*!40000 ALTER TABLE `components_blocks_featured_projects` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components_blocks_featured_projects_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_blocks_featured_projects_components`;

CREATE TABLE `components_blocks_featured_projects_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_blocks_featured_projects_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_blocks_featured_projects_field_index` (`field`),
  KEY `components_blocks_featured_projects_component_type_index` (`component_type`),
  KEY `components_blocks_featured_projects_entity_fk` (`entity_id`),
  CONSTRAINT `components_blocks_featured_projects_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_blocks_featured_projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components_blocks_featured_projects_components` WRITE;
/*!40000 ALTER TABLE `components_blocks_featured_projects_components` DISABLE KEYS */;

INSERT INTO `components_blocks_featured_projects_components` (`id`, `entity_id`, `component_id`, `component_type`, `field`, `order`) VALUES
	(1, 1, 2, "__lib.header", "header", 1),
	(2, 1, 1, "project.project-card", "projects", 1),
	(3, 1, 2, "project.project-card", "projects", 2),
	(4, 1, 3, "project.project-card", "projects", 3),
	(5, 1, 4, "project.project-card", "projects", 4),
	(6, 1, 5, "project.project-card", "projects", 5),
	(7, 1, 6, "project.project-card", "projects", 6);

/*!40000 ALTER TABLE `components_blocks_featured_projects_components` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components_blocks_latest_code
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_blocks_latest_code`;

CREATE TABLE `components_blocks_latest_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` longtext DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components_blocks_latest_code` WRITE;
/*!40000 ALTER TABLE `components_blocks_latest_code` DISABLE KEYS */;

INSERT INTO `components_blocks_latest_code` (`id`, `text`, `theme`) VALUES
	(1, "Latest Code", "primary");

/*!40000 ALTER TABLE `components_blocks_latest_code` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components_blocks_latest_code_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_blocks_latest_code_components`;

CREATE TABLE `components_blocks_latest_code_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_blocks_latest_code_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_blocks_latest_code_field_index` (`field`),
  KEY `components_blocks_latest_code_component_type_index` (`component_type`),
  KEY `components_blocks_latest_code_entity_fk` (`entity_id`),
  CONSTRAINT `components_blocks_latest_code_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_blocks_latest_code` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components_blocks_latest_code_components` WRITE;
/*!40000 ALTER TABLE `components_blocks_latest_code_components` DISABLE KEYS */;

INSERT INTO `components_blocks_latest_code_components` (`id`, `entity_id`, `component_id`, `component_type`, `field`, `order`) VALUES
	(1, 1, 3, "__lib.header", "header", 1);

/*!40000 ALTER TABLE `components_blocks_latest_code_components` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components_blocks_page_title
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_blocks_page_title`;

CREATE TABLE `components_blocks_page_title` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components_blocks_page_title` WRITE;
/*!40000 ALTER TABLE `components_blocks_page_title` DISABLE KEYS */;

INSERT INTO `components_blocks_page_title` (`id`, `theme`, `title`, `text`) VALUES
	(1, "muted", "About Me", NULL);

/*!40000 ALTER TABLE `components_blocks_page_title` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components_global_footers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_global_footers`;

CREATE TABLE `components_global_footers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components_global_footers` WRITE;
/*!40000 ALTER TABLE `components_global_footers` DISABLE KEYS */;

INSERT INTO `components_global_footers` (`id`, `label`) VALUES
	(1, NULL);

/*!40000 ALTER TABLE `components_global_footers` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components_global_footers_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_global_footers_components`;

CREATE TABLE `components_global_footers_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_global_footers_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_global_footers_field_index` (`field`),
  KEY `components_global_footers_component_type_index` (`component_type`),
  KEY `components_global_footers_entity_fk` (`entity_id`),
  CONSTRAINT `components_global_footers_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_global_footers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components_global_footers_components` WRITE;
/*!40000 ALTER TABLE `components_global_footers_components` DISABLE KEYS */;

INSERT INTO `components_global_footers_components` (`id`, `entity_id`, `component_id`, `component_type`, `field`, `order`) VALUES
	(1, 1, 1, "__lib.footer-columns", "footerColumns", 1);

/*!40000 ALTER TABLE `components_global_footers_components` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components_global_navigations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_global_navigations`;

CREATE TABLE `components_global_navigations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components_global_navigations` WRITE;
/*!40000 ALTER TABLE `components_global_navigations` DISABLE KEYS */;

INSERT INTO `components_global_navigations` (`id`) VALUES
	(1);

/*!40000 ALTER TABLE `components_global_navigations` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components_global_navigations_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_global_navigations_components`;

CREATE TABLE `components_global_navigations_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_global_navigations_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_global_navigations_field_index` (`field`),
  KEY `components_global_navigations_component_type_index` (`component_type`),
  KEY `components_global_navigations_entity_fk` (`entity_id`),
  CONSTRAINT `components_global_navigations_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_global_navigations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components_global_navigations_components` WRITE;
/*!40000 ALTER TABLE `components_global_navigations_components` DISABLE KEYS */;

INSERT INTO `components_global_navigations_components` (`id`, `entity_id`, `component_id`, `component_type`, `field`, `order`) VALUES
	(1, 1, 1, "__lib.link", "links", 1),
	(2, 1, 2, "__lib.link", "links", 2),
	(3, 1, 3, "__lib.link", "links", 3),
	(4, 1, 4, "__lib.link", "links", 4),
	(5, 1, 5, "__lib.link", "leftButton", 1);

/*!40000 ALTER TABLE `components_global_navigations_components` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components_lib_testimonials_author_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_lib_testimonials_author_links`;

CREATE TABLE `components_lib_testimonials_author_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testimonial_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_lib_testimonials_author_links_unique` (`testimonial_id`,`user_id`),
  KEY `components_lib_testimonials_author_links_fk` (`testimonial_id`),
  KEY `components_lib_testimonials_author_links_inv_fk` (`user_id`),
  CONSTRAINT `components_lib_testimonials_author_links_fk` FOREIGN KEY (`testimonial_id`) REFERENCES `components___lib_testimonials` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_lib_testimonials_author_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_article`;

CREATE TABLE `components_modules_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_article_category_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_article_category_links`;

CREATE TABLE `components_modules_article_category_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `article_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_modules_article_category_links_unique` (`article_id`,`category_id`),
  KEY `components_modules_article_category_links_fk` (`article_id`),
  KEY `components_modules_article_category_links_inv_fk` (`category_id`),
  KEY `components_modules_article_category_links_order_inv_fk` (`article_order`),
  CONSTRAINT `components_modules_article_category_links_fk` FOREIGN KEY (`article_id`) REFERENCES `components_modules_article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_modules_article_category_links_inv_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_article_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_article_components`;

CREATE TABLE `components_modules_article_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_modules_article_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_modules_article_field_index` (`field`),
  KEY `components_modules_article_component_type_index` (`component_type`),
  KEY `components_modules_article_entity_fk` (`entity_id`),
  CONSTRAINT `components_modules_article_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_modules_article` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_article_editors_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_article_editors_links`;

CREATE TABLE `components_modules_article_editors_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `user_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_modules_article_editors_links_unique` (`article_id`,`user_id`),
  KEY `components_modules_article_editors_links_fk` (`article_id`),
  KEY `components_modules_article_editors_links_inv_fk` (`user_id`),
  KEY `components_modules_article_editors_links_order_fk` (`user_order`),
  CONSTRAINT `components_modules_article_editors_links_fk` FOREIGN KEY (`article_id`) REFERENCES `components_modules_article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_modules_article_editors_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_articles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_articles`;

CREATE TABLE `components_modules_articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_articles_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_articles_components`;

CREATE TABLE `components_modules_articles_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_modules_articles_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_modules_articles_field_index` (`field`),
  KEY `components_modules_articles_component_type_index` (`component_type`),
  KEY `components_modules_articles_entity_fk` (`entity_id`),
  CONSTRAINT `components_modules_articles_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_modules_articles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_product`;

CREATE TABLE `components_modules_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_product_category_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_product_category_links`;

CREATE TABLE `components_modules_product_category_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `product_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_modules_product_category_links_unique` (`product_id`,`category_id`),
  KEY `components_modules_product_category_links_fk` (`product_id`),
  KEY `components_modules_product_category_links_inv_fk` (`category_id`),
  KEY `components_modules_product_category_links_order_inv_fk` (`product_order`),
  CONSTRAINT `components_modules_product_category_links_fk` FOREIGN KEY (`product_id`) REFERENCES `components_modules_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_modules_product_category_links_inv_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_product_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_product_components`;

CREATE TABLE `components_modules_product_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_modules_product_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_modules_product_field_index` (`field`),
  KEY `components_modules_product_component_type_index` (`component_type`),
  KEY `components_modules_product_entity_fk` (`entity_id`),
  CONSTRAINT `components_modules_product_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_modules_product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_product_tag_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_product_tag_links`;

CREATE TABLE `components_modules_product_tag_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `tag_id` int(10) unsigned DEFAULT NULL,
  `product_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_modules_product_tag_links_unique` (`product_id`,`tag_id`),
  KEY `components_modules_product_tag_links_fk` (`product_id`),
  KEY `components_modules_product_tag_links_inv_fk` (`tag_id`),
  KEY `components_modules_product_tag_links_order_inv_fk` (`product_order`),
  CONSTRAINT `components_modules_product_tag_links_fk` FOREIGN KEY (`product_id`) REFERENCES `components_modules_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_modules_product_tag_links_inv_fk` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_products`;

CREATE TABLE `components_modules_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_products_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_products_components`;

CREATE TABLE `components_modules_products_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_modules_products_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_modules_products_field_index` (`field`),
  KEY `components_modules_products_component_type_index` (`component_type`),
  KEY `components_modules_products_entity_fk` (`entity_id`),
  CONSTRAINT `components_modules_products_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_modules_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_project`;

CREATE TABLE `components_modules_project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_project_category_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_project_category_links`;

CREATE TABLE `components_modules_project_category_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `project_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_modules_project_category_links_unique` (`project_id`,`category_id`),
  KEY `components_modules_project_category_links_fk` (`project_id`),
  KEY `components_modules_project_category_links_inv_fk` (`category_id`),
  KEY `components_modules_project_category_links_order_inv_fk` (`project_order`),
  CONSTRAINT `components_modules_project_category_links_fk` FOREIGN KEY (`project_id`) REFERENCES `components_modules_project` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_modules_project_category_links_inv_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_project_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_project_components`;

CREATE TABLE `components_modules_project_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_modules_project_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_modules_project_field_index` (`field`),
  KEY `components_modules_project_component_type_index` (`component_type`),
  KEY `components_modules_project_entity_fk` (`entity_id`),
  CONSTRAINT `components_modules_project_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_modules_project` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_projects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_projects`;

CREATE TABLE `components_modules_projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_modules_projects_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_modules_projects_components`;

CREATE TABLE `components_modules_projects_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_modules_projects_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_modules_projects_field_index` (`field`),
  KEY `components_modules_projects_component_type_index` (`component_type`),
  KEY `components_modules_projects_entity_fk` (`entity_id`),
  CONSTRAINT `components_modules_projects_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_modules_projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_opening_hours
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_opening_hours`;

CREATE TABLE `components_opening_hours` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `day_interval` varchar(255) DEFAULT NULL,
  `opening_hour` varchar(255) DEFAULT NULL,
  `closing_hour` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_product_information
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_product_information`;

CREATE TABLE `components_product_information` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_product_information_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_product_information_components`;

CREATE TABLE `components_product_information_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_product_information_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_product_information_field_index` (`field`),
  KEY `components_product_information_component_type_index` (`component_type`),
  KEY `components_product_information_entity_fk` (`entity_id`),
  CONSTRAINT `components_product_information_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_product_information` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_product_more_information
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_product_more_information`;

CREATE TABLE `components_product_more_information` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_product_product_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_product_product_content`;

CREATE TABLE `components_product_product_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_product_product_content_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_product_product_content_components`;

CREATE TABLE `components_product_product_content_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_product_product_content_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_product_product_content_field_index` (`field`),
  KEY `components_product_product_content_component_type_index` (`component_type`),
  KEY `components_product_product_content_entity_fk` (`entity_id`),
  CONSTRAINT `components_product_product_content_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_product_product_content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_product_product_reviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_product_product_reviews`;

CREATE TABLE `components_product_product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_product_product_reviews_reviews_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_product_product_reviews_reviews_links`;

CREATE TABLE `components_product_product_reviews_reviews_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_reviews_id` int(10) unsigned DEFAULT NULL,
  `review_id` int(10) unsigned DEFAULT NULL,
  `review_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_product_product_reviews_reviews_links_unique` (`product_reviews_id`,`review_id`),
  KEY `components_product_product_reviews_reviews_links_fk` (`product_reviews_id`),
  KEY `components_product_product_reviews_reviews_links_inv_fk` (`review_id`),
  KEY `components_product_product_reviews_reviews_links_order_fk` (`review_order`),
  CONSTRAINT `components_product_product_reviews_reviews_links_fk` FOREIGN KEY (`product_reviews_id`) REFERENCES `components_product_product_reviews` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_product_product_reviews_reviews_links_inv_fk` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_product_related_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_product_related_products`;

CREATE TABLE `components_product_related_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_product_related_products_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_product_related_products_components`;

CREATE TABLE `components_product_related_products_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_product_related_products_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_product_related_products_field_index` (`field`),
  KEY `components_product_related_products_component_type_index` (`component_type`),
  KEY `components_product_related_products_entity_fk` (`entity_id`),
  CONSTRAINT `components_product_related_products_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_product_related_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_product_related_products_shop_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_product_related_products_shop_links`;

CREATE TABLE `components_product_related_products_shop_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `related_products_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_product_related_products_shop_links_unique` (`related_products_id`,`product_id`),
  KEY `components_product_related_products_shop_links_fk` (`related_products_id`),
  KEY `components_product_related_products_shop_links_inv_fk` (`product_id`),
  KEY `components_product_related_products_shop_links_order_fk` (`product_order`),
  CONSTRAINT `components_product_related_products_shop_links_fk` FOREIGN KEY (`related_products_id`) REFERENCES `components_product_related_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_product_related_products_shop_links_inv_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_product_rich_contents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_product_rich_contents`;

CREATE TABLE `components_product_rich_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_project_cards
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_project_cards`;

CREATE TABLE `components_project_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components_project_cards` WRITE;
/*!40000 ALTER TABLE `components_project_cards` DISABLE KEYS */;

INSERT INTO `components_project_cards` (`id`, `title`, `slug`, `text`, `label`) VALUES
	(1, "Yinka Samuels", "https://yinkasamuels.com", NULL, NULL),
	(2, "Taavetti Digital", "https://taavettidigital.com.com", NULL, NULL),
	(3, "Reparations Art", "https://reparationarts.com", NULL, NULL),
	(4, "YanMe TV", "https://yanme.org", NULL, NULL),
	(5, "Scent of Christ", "https://scentofchrist.org", NULL, NULL),
	(6, "Rugged Brand", "https://rugged-brand.com", NULL, NULL);

/*!40000 ALTER TABLE `components_project_cards` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components_project_project_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_project_project_content`;

CREATE TABLE `components_project_project_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_slices_heroes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_slices_heroes`;

CREATE TABLE `components_slices_heroes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components_slices_heroes` WRITE;
/*!40000 ALTER TABLE `components_slices_heroes` DISABLE KEYS */;

INSERT INTO `components_slices_heroes` (`id`, `text`) VALUES
	(1, NULL);

/*!40000 ALTER TABLE `components_slices_heroes` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components_slices_heroes_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_slices_heroes_components`;

CREATE TABLE `components_slices_heroes_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_slices_heroes_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_slices_heroes_field_index` (`field`),
  KEY `components_slices_heroes_component_type_index` (`component_type`),
  KEY `components_slices_heroes_entity_fk` (`entity_id`),
  CONSTRAINT `components_slices_heroes_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_slices_heroes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components_slices_heroes_components` WRITE;
/*!40000 ALTER TABLE `components_slices_heroes_components` DISABLE KEYS */;

INSERT INTO `components_slices_heroes_components` (`id`, `entity_id`, `component_id`, `component_type`, `field`, `order`) VALUES
	(1, 1, 1, "__lib.header", "header", 1);

/*!40000 ALTER TABLE `components_slices_heroes_components` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table components_slices_pricings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_slices_pricings`;

CREATE TABLE `components_slices_pricings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_slices_pricings_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_slices_pricings_components`;

CREATE TABLE `components_slices_pricings_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_slices_pricings_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_slices_pricings_field_index` (`field`),
  KEY `components_slices_pricings_component_type_index` (`component_type`),
  KEY `components_slices_pricings_entity_fk` (`entity_id`),
  CONSTRAINT `components_slices_pricings_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_slices_pricings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_slices_teams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_slices_teams`;

CREATE TABLE `components_slices_teams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_slices_teams_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_slices_teams_components`;

CREATE TABLE `components_slices_teams_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_slices_teams_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_slices_teams_field_index` (`field`),
  KEY `components_slices_teams_component_type_index` (`component_type`),
  KEY `components_slices_teams_entity_fk` (`entity_id`),
  CONSTRAINT `components_slices_teams_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_slices_teams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table components_slices_teams_members_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_slices_teams_members_links`;

CREATE TABLE `components_slices_teams_members_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `user_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_slices_teams_members_links_unique` (`team_id`,`user_id`),
  KEY `components_slices_teams_members_links_fk` (`team_id`),
  KEY `components_slices_teams_members_links_inv_fk` (`user_id`),
  KEY `components_slices_teams_members_links_order_fk` (`user_order`),
  CONSTRAINT `components_slices_teams_members_links_fk` FOREIGN KEY (`team_id`) REFERENCES `components_slices_teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_slices_teams_members_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table cookie_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cookie_categories`;

CREATE TABLE `cookie_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cookie_categories_created_by_id_fk` (`created_by_id`),
  KEY `cookie_categories_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `cookie_categories_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cookie_categories_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table cookie_categories_localizations_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cookie_categories_localizations_links`;

CREATE TABLE `cookie_categories_localizations_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cookie_category_id` int(10) unsigned DEFAULT NULL,
  `inv_cookie_category_id` int(10) unsigned DEFAULT NULL,
  `cookie_category_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cookie_categories_localizations_links_unique` (`cookie_category_id`,`inv_cookie_category_id`),
  KEY `cookie_categories_localizations_links_fk` (`cookie_category_id`),
  KEY `cookie_categories_localizations_links_inv_fk` (`inv_cookie_category_id`),
  KEY `cookie_categories_localizations_links_order_fk` (`cookie_category_order`),
  CONSTRAINT `cookie_categories_localizations_links_fk` FOREIGN KEY (`cookie_category_id`) REFERENCES `cookie_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cookie_categories_localizations_links_inv_fk` FOREIGN KEY (`inv_cookie_category_id`) REFERENCES `cookie_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table cookies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cookies`;

CREATE TABLE `cookies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `party` varchar(255) DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `duration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`duration`)),
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cookies_created_by_id_fk` (`created_by_id`),
  KEY `cookies_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `cookies_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cookies_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table cookies_category_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cookies_category_links`;

CREATE TABLE `cookies_category_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cookie_id` int(10) unsigned DEFAULT NULL,
  `cookie_category_id` int(10) unsigned DEFAULT NULL,
  `cookie_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cookies_category_links_unique` (`cookie_id`,`cookie_category_id`),
  KEY `cookies_category_links_fk` (`cookie_id`),
  KEY `cookies_category_links_inv_fk` (`cookie_category_id`),
  KEY `cookies_category_links_order_inv_fk` (`cookie_order`),
  CONSTRAINT `cookies_category_links_fk` FOREIGN KEY (`cookie_id`) REFERENCES `cookies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cookies_category_links_inv_fk` FOREIGN KEY (`cookie_category_id`) REFERENCES `cookie_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table cookies_localizations_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cookies_localizations_links`;

CREATE TABLE `cookies_localizations_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cookie_id` int(10) unsigned DEFAULT NULL,
  `inv_cookie_id` int(10) unsigned DEFAULT NULL,
  `cookie_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cookies_localizations_links_unique` (`cookie_id`,`inv_cookie_id`),
  KEY `cookies_localizations_links_fk` (`cookie_id`),
  KEY `cookies_localizations_links_inv_fk` (`inv_cookie_id`),
  KEY `cookies_localizations_links_order_fk` (`cookie_order`),
  CONSTRAINT `cookies_localizations_links_fk` FOREIGN KEY (`cookie_id`) REFERENCES `cookies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cookies_localizations_links_inv_fk` FOREIGN KEY (`inv_cookie_id`) REFERENCES `cookies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `files`;

CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alternative_text` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`formats`)),
  `hash` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` decimal(10,2) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `preview_url` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`provider_metadata`)),
  `folder_path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_files_folder_path_index` (`folder_path`),
  KEY `upload_files_created_at_index` (`created_at`),
  KEY `upload_files_updated_at_index` (`updated_at`),
  KEY `upload_files_name_index` (`name`),
  KEY `upload_files_size_index` (`size`),
  KEY `upload_files_ext_index` (`ext`),
  KEY `files_created_by_id_fk` (`created_by_id`),
  KEY `files_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `files_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `files_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;

INSERT INTO `files` (`id`, `name`, `alternative_text`, `caption`, `width`, `height`, `formats`, `hash`, `ext`, `mime`, `size`, `url`, `preview_url`, `provider`, `provider_metadata`, `folder_path`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`, `sitemap_exclude`) VALUES
	(1, "vercel.svg", NULL, NULL, 283, 64, NULL, "vercel_5462a05bd1", ".svg", "image/svg+xml", 1.09, "/uploads/vercel_5462a05bd1.svg", NULL, "local", NULL, "/", "2023-03-22 08:34:30.976000", "2023-03-22 08:34:30.976000", 1, 1, 0),
	(2, "talent.png", NULL, NULL, 1080, 1080, "{\"thumbnail\":{\"name\":\"thumbnail_talent.png\",\"hash\":\"thumbnail_talent_0c72db5587\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":24.22,\"url\":\"/uploads/thumbnail_talent_0c72db5587.png\"},\"small\":{\"name\":\"small_talent.png\",\"hash\":\"small_talent_0c72db5587\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":163.68,\"url\":\"/uploads/small_talent_0c72db5587.png\"},\"medium\":{\"name\":\"medium_talent.png\",\"hash\":\"medium_talent_0c72db5587\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":327.8,\"url\":\"/uploads/medium_talent_0c72db5587.png\"},\"large\":{\"name\":\"large_talent.png\",\"hash\":\"large_talent_0c72db5587\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":532,\"url\":\"/uploads/large_talent_0c72db5587.png\"}}", "talent_0c72db5587", ".png", "image/png", 132.04, "/uploads/talent_0c72db5587.png", NULL, "local", NULL, "/", "2023-03-22 08:34:35.789000", "2023-03-22 08:34:35.789000", 1, 1, 0),
	(3, "yanme-1.png", NULL, NULL, 1080, 554, "{\"thumbnail\":{\"name\":\"thumbnail_yanme-1.png\",\"hash\":\"thumbnail_yanme_1_6aad0f7156\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":245,\"height\":126,\"size\":39.92,\"url\":\"/uploads/thumbnail_yanme_1_6aad0f7156.png\"},\"small\":{\"name\":\"small_yanme-1.png\",\"hash\":\"small_yanme_1_6aad0f7156\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":256,\"size\":140.03,\"url\":\"/uploads/small_yanme_1_6aad0f7156.png\"},\"medium\":{\"name\":\"medium_yanme-1.png\",\"hash\":\"medium_yanme_1_6aad0f7156\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":385,\"size\":297.69,\"url\":\"/uploads/medium_yanme_1_6aad0f7156.png\"},\"large\":{\"name\":\"large_yanme-1.png\",\"hash\":\"large_yanme_1_6aad0f7156\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":513,\"size\":497.74,\"url\":\"/uploads/large_yanme_1_6aad0f7156.png\"}}", "yanme_1_6aad0f7156", ".png", "image/png", 111.27, "/uploads/yanme_1_6aad0f7156.png", NULL, "local", NULL, "/", "2023-03-22 08:34:36.941000", "2023-03-22 08:34:36.941000", 1, 1, 0),
	(4, "ys.png", NULL, NULL, 1080, 1080, "{\"thumbnail\":{\"name\":\"thumbnail_ys.png\",\"hash\":\"thumbnail_ys_52f3d81f64\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":35.21,\"url\":\"/uploads/thumbnail_ys_52f3d81f64.png\"},\"small\":{\"name\":\"small_ys.png\",\"hash\":\"small_ys_52f3d81f64\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":258.45,\"url\":\"/uploads/small_ys_52f3d81f64.png\"},\"medium\":{\"name\":\"medium_ys.png\",\"hash\":\"medium_ys_52f3d81f64\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":541.62,\"url\":\"/uploads/medium_ys_52f3d81f64.png\"},\"large\":{\"name\":\"large_ys.png\",\"hash\":\"large_ys_52f3d81f64\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":915.32,\"url\":\"/uploads/large_ys_52f3d81f64.png\"}}", "ys_52f3d81f64", ".png", "image/png", 251.61, "/uploads/ys_52f3d81f64.png", NULL, "local", NULL, "/", "2023-03-22 08:34:37.842000", "2023-03-23 20:48:36.546000", 1, 1, 0),
	(5, "yanme.png", NULL, NULL, 1080, 1080, "{\"thumbnail\":{\"name\":\"thumbnail_yanme.png\",\"hash\":\"thumbnail_yanme_92242c0240\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":24.6,\"url\":\"/uploads/thumbnail_yanme_92242c0240.png\"},\"small\":{\"name\":\"small_yanme.png\",\"hash\":\"small_yanme_92242c0240\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":196.45,\"url\":\"/uploads/small_yanme_92242c0240.png\"},\"medium\":{\"name\":\"medium_yanme.png\",\"hash\":\"medium_yanme_92242c0240\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":450.72,\"url\":\"/uploads/medium_yanme_92242c0240.png\"},\"large\":{\"name\":\"large_yanme.png\",\"hash\":\"large_yanme_92242c0240\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":798.9,\"url\":\"/uploads/large_yanme_92242c0240.png\"}}", "yanme_92242c0240", ".png", "image/png", 204.57, "/uploads/yanme_92242c0240.png", NULL, "local", NULL, "/", "2023-03-22 08:34:38.869000", "2023-03-23 20:44:45.564000", 1, 1, 0),
	(6, "rugged1.png", NULL, NULL, 1080, 1080, "{\"thumbnail\":{\"name\":\"thumbnail_rugged1.png\",\"hash\":\"thumbnail_rugged1_31fbf3c719\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":31.02,\"url\":\"/uploads/thumbnail_rugged1_31fbf3c719.png\"},\"small\":{\"name\":\"small_rugged1.png\",\"hash\":\"small_rugged1_31fbf3c719\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":224.23,\"url\":\"/uploads/small_rugged1_31fbf3c719.png\"},\"medium\":{\"name\":\"medium_rugged1.png\",\"hash\":\"medium_rugged1_31fbf3c719\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":474.02,\"url\":\"/uploads/medium_rugged1_31fbf3c719.png\"},\"large\":{\"name\":\"large_rugged1.png\",\"hash\":\"large_rugged1_31fbf3c719\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":796.11,\"url\":\"/uploads/large_rugged1_31fbf3c719.png\"}}", "rugged1_31fbf3c719", ".png", "image/png", 203.6, "/uploads/rugged1_31fbf3c719.png", NULL, "local", NULL, "/", "2023-03-22 08:34:39.288000", "2023-03-22 08:34:39.288000", 1, 1, 0),
	(7, "socc.png", NULL, NULL, 1080, 1080, "{\"thumbnail\":{\"name\":\"thumbnail_socc.png\",\"hash\":\"thumbnail_socc_237cf4b445\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":40.05,\"url\":\"/uploads/thumbnail_socc_237cf4b445.png\"},\"small\":{\"name\":\"small_socc.png\",\"hash\":\"small_socc_237cf4b445\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":306.75,\"url\":\"/uploads/small_socc_237cf4b445.png\"},\"medium\":{\"name\":\"medium_socc.png\",\"hash\":\"medium_socc_237cf4b445\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":646.53,\"url\":\"/uploads/medium_socc_237cf4b445.png\"},\"large\":{\"name\":\"large_socc.png\",\"hash\":\"large_socc_237cf4b445\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":1076.31,\"url\":\"/uploads/large_socc_237cf4b445.png\"}}", "socc_237cf4b445", ".png", "image/png", 280.35, "/uploads/socc_237cf4b445.png", NULL, "local", NULL, "/", "2023-03-22 08:34:39.569000", "2023-03-23 20:45:51.491000", 1, 1, 0),
	(8, "rpr.png", NULL, NULL, 1080, 1080, "{\"thumbnail\":{\"name\":\"thumbnail_rpr.png\",\"hash\":\"thumbnail_rpr_279ae60eba\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":19.16,\"url\":\"/uploads/thumbnail_rpr_279ae60eba.png\"},\"small\":{\"name\":\"small_rpr.png\",\"hash\":\"small_rpr_279ae60eba\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":121.4,\"url\":\"/uploads/small_rpr_279ae60eba.png\"},\"medium\":{\"name\":\"medium_rpr.png\",\"hash\":\"medium_rpr_279ae60eba\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":235.4,\"url\":\"/uploads/medium_rpr_279ae60eba.png\"},\"large\":{\"name\":\"large_rpr.png\",\"hash\":\"large_rpr_279ae60eba\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":377.76,\"url\":\"/uploads/large_rpr_279ae60eba.png\"}}", "rpr_279ae60eba", ".png", "image/png", 117.37, "/uploads/rpr_279ae60eba.png", NULL, "local", NULL, "/", "2023-03-22 08:34:44.082000", "2023-03-23 20:46:48.775000", 1, 1, 0),
	(9, "platform.png", NULL, NULL, 1080, 1080, "{\"thumbnail\":{\"name\":\"thumbnail_platform.png\",\"hash\":\"thumbnail_platform_061434df85\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":34.41,\"url\":\"/uploads/thumbnail_platform_061434df85.png\"},\"small\":{\"name\":\"small_platform.png\",\"hash\":\"small_platform_061434df85\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":239.96,\"url\":\"/uploads/small_platform_061434df85.png\"},\"medium\":{\"name\":\"medium_platform.png\",\"hash\":\"medium_platform_061434df85\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":482.53,\"url\":\"/uploads/medium_platform_061434df85.png\"},\"large\":{\"name\":\"large_platform.png\",\"hash\":\"large_platform_061434df85\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":791.76,\"url\":\"/uploads/large_platform_061434df85.png\"}}", "platform_061434df85", ".png", "image/png", 193.95, "/uploads/platform_061434df85.png", NULL, "local", NULL, "/", "2023-03-22 08:34:46.291000", "2023-03-22 08:34:46.291000", 1, 1, 0),
	(10, "rugged.png", NULL, NULL, 1080, 1080, "{\"thumbnail\":{\"name\":\"thumbnail_rugged.png\",\"hash\":\"thumbnail_rugged_938c0964c9\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":31.02,\"url\":\"/uploads/thumbnail_rugged_938c0964c9.png\"},\"small\":{\"name\":\"small_rugged.png\",\"hash\":\"small_rugged_938c0964c9\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":224.23,\"url\":\"/uploads/small_rugged_938c0964c9.png\"},\"medium\":{\"name\":\"medium_rugged.png\",\"hash\":\"medium_rugged_938c0964c9\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":474.02,\"url\":\"/uploads/medium_rugged_938c0964c9.png\"},\"large\":{\"name\":\"large_rugged.png\",\"hash\":\"large_rugged_938c0964c9\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":796.11,\"url\":\"/uploads/large_rugged_938c0964c9.png\"}}", "rugged_938c0964c9", ".png", "image/png", 203.6, "/uploads/rugged_938c0964c9.png", NULL, "local", NULL, "/", "2023-03-22 08:34:46.300000", "2023-03-23 20:47:43.852000", 1, 1, 0),
	(11, "rugged-1.png", NULL, NULL, 1514, 1100, "{\"thumbnail\":{\"name\":\"thumbnail_rugged-1.png\",\"hash\":\"thumbnail_rugged_1_c97a929662\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":215,\"height\":156,\"size\":37.91,\"url\":\"/uploads/thumbnail_rugged_1_c97a929662.png\"},\"small\":{\"name\":\"small_rugged-1.png\",\"hash\":\"small_rugged_1_c97a929662\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":363,\"size\":157.36,\"url\":\"/uploads/small_rugged_1_c97a929662.png\"},\"medium\":{\"name\":\"medium_rugged-1.png\",\"hash\":\"medium_rugged_1_c97a929662\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":545,\"size\":325.71,\"url\":\"/uploads/medium_rugged_1_c97a929662.png\"},\"large\":{\"name\":\"large_rugged-1.png\",\"hash\":\"large_rugged_1_c97a929662\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":727,\"size\":554.17,\"url\":\"/uploads/large_rugged_1_c97a929662.png\"}}", "rugged_1_c97a929662", ".png", "image/png", 271.3, "/uploads/rugged_1_c97a929662.png", NULL, "local", NULL, "/", "2023-03-22 08:34:46.360000", "2023-03-22 08:34:46.360000", 1, 1, 0),
	(12, "oniru.png", NULL, NULL, 1080, 1080, "{\"thumbnail\":{\"name\":\"thumbnail_oniru.png\",\"hash\":\"thumbnail_oniru_74272e4bf4\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":39.73,\"url\":\"/uploads/thumbnail_oniru_74272e4bf4.png\"},\"small\":{\"name\":\"small_oniru.png\",\"hash\":\"small_oniru_74272e4bf4\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":320.17,\"url\":\"/uploads/small_oniru_74272e4bf4.png\"},\"medium\":{\"name\":\"medium_oniru.png\",\"hash\":\"medium_oniru_74272e4bf4\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":708.4,\"url\":\"/uploads/medium_oniru_74272e4bf4.png\"},\"large\":{\"name\":\"large_oniru.png\",\"hash\":\"large_oniru_74272e4bf4\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":1211.37,\"url\":\"/uploads/large_oniru_74272e4bf4.png\"}}", "oniru_74272e4bf4", ".png", "image/png", 325.71, "/uploads/oniru_74272e4bf4.png", NULL, "local", NULL, "/", "2023-03-22 08:34:48.515000", "2023-03-22 08:34:48.515000", 1, 1, 0),
	(13, "Oniru-Royal-Beach.png", NULL, NULL, 1903, 927, "{\"thumbnail\":{\"name\":\"thumbnail_Oniru-Royal-Beach.png\",\"hash\":\"thumbnail_Oniru_Royal_Beach_f59bb4cfd9\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":245,\"height\":119,\"size\":54.37,\"url\":\"/uploads/thumbnail_Oniru_Royal_Beach_f59bb4cfd9.png\"},\"small\":{\"name\":\"small_Oniru-Royal-Beach.png\",\"hash\":\"small_Oniru_Royal_Beach_f59bb4cfd9\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":244,\"size\":199.37,\"url\":\"/uploads/small_Oniru_Royal_Beach_f59bb4cfd9.png\"},\"medium\":{\"name\":\"medium_Oniru-Royal-Beach.png\",\"hash\":\"medium_Oniru_Royal_Beach_f59bb4cfd9\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":365,\"size\":428.86,\"url\":\"/uploads/medium_Oniru_Royal_Beach_f59bb4cfd9.png\"},\"large\":{\"name\":\"large_Oniru-Royal-Beach.png\",\"hash\":\"large_Oniru_Royal_Beach_f59bb4cfd9\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":487,\"size\":744.69,\"url\":\"/uploads/large_Oniru_Royal_Beach_f59bb4cfd9.png\"}}", "Oniru_Royal_Beach_f59bb4cfd9", ".png", "image/png", 640.67, "/uploads/Oniru_Royal_Beach_f59bb4cfd9.png", NULL, "local", NULL, "/", "2023-03-22 08:34:51.643000", "2023-03-22 08:34:51.643000", 1, 1, 0),
	(14, "gfw.png", NULL, NULL, 1080, 1080, "{\"thumbnail\":{\"name\":\"thumbnail_gfw.png\",\"hash\":\"thumbnail_gfw_0b3d9244b6\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":26.4,\"url\":\"/uploads/thumbnail_gfw_0b3d9244b6.png\"},\"small\":{\"name\":\"small_gfw.png\",\"hash\":\"small_gfw_0b3d9244b6\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":192.93,\"url\":\"/uploads/small_gfw_0b3d9244b6.png\"},\"medium\":{\"name\":\"medium_gfw.png\",\"hash\":\"medium_gfw_0b3d9244b6\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":397.11,\"url\":\"/uploads/medium_gfw_0b3d9244b6.png\"},\"large\":{\"name\":\"large_gfw.png\",\"hash\":\"large_gfw_0b3d9244b6\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":656.25,\"url\":\"/uploads/large_gfw_0b3d9244b6.png\"}}", "gfw_0b3d9244b6", ".png", "image/png", 204.52, "/uploads/gfw_0b3d9244b6.png", NULL, "local", NULL, "/", "2023-03-22 08:34:52.903000", "2023-03-22 08:34:52.903000", 1, 1, 0),
	(15, "olla.png", NULL, NULL, 1080, 1080, "{\"thumbnail\":{\"name\":\"thumbnail_olla.png\",\"hash\":\"thumbnail_olla_c8d3fc5200\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":53.12,\"url\":\"/uploads/thumbnail_olla_c8d3fc5200.png\"},\"small\":{\"name\":\"small_olla.png\",\"hash\":\"small_olla_c8d3fc5200\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":432.44,\"url\":\"/uploads/small_olla_c8d3fc5200.png\"},\"medium\":{\"name\":\"medium_olla.png\",\"hash\":\"medium_olla_c8d3fc5200\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":911.48,\"url\":\"/uploads/medium_olla_c8d3fc5200.png\"},\"large\":{\"name\":\"large_olla.png\",\"hash\":\"large_olla_c8d3fc5200\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":1531.34,\"url\":\"/uploads/large_olla_c8d3fc5200.png\"}}", "olla_c8d3fc5200", ".png", "image/png", 380.89, "/uploads/olla_c8d3fc5200.png", NULL, "local", NULL, "/", "2023-03-22 08:34:54.938000", "2023-03-22 08:34:54.938000", 1, 1, 0),
	(16, "elev8.png", NULL, NULL, 1080, 1080, "{\"thumbnail\":{\"name\":\"thumbnail_elev8.png\",\"hash\":\"thumbnail_elev8_ddc513eb6f\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":27.44,\"url\":\"/uploads/thumbnail_elev8_ddc513eb6f.png\"},\"small\":{\"name\":\"small_elev8.png\",\"hash\":\"small_elev8_ddc513eb6f\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":161.19,\"url\":\"/uploads/small_elev8_ddc513eb6f.png\"},\"medium\":{\"name\":\"medium_elev8.png\",\"hash\":\"medium_elev8_ddc513eb6f\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":327.7,\"url\":\"/uploads/medium_elev8_ddc513eb6f.png\"},\"large\":{\"name\":\"large_elev8.png\",\"hash\":\"large_elev8_ddc513eb6f\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":525.91,\"url\":\"/uploads/large_elev8_ddc513eb6f.png\"}}", "elev8_ddc513eb6f", ".png", "image/png", 124.3, "/uploads/elev8_ddc513eb6f.png", NULL, "local", NULL, "/", "2023-03-22 08:34:55.018000", "2023-03-22 08:34:55.018000", 1, 1, 0),
	(17, "laba.png", NULL, NULL, 1080, 1080, "{\"thumbnail\":{\"name\":\"thumbnail_laba.png\",\"hash\":\"thumbnail_laba_01d6b3195b\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":42.53,\"url\":\"/uploads/thumbnail_laba_01d6b3195b.png\"},\"small\":{\"name\":\"small_laba.png\",\"hash\":\"small_laba_01d6b3195b\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":334.31,\"url\":\"/uploads/small_laba_01d6b3195b.png\"},\"medium\":{\"name\":\"medium_laba.png\",\"hash\":\"medium_laba_01d6b3195b\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":723.09,\"url\":\"/uploads/medium_laba_01d6b3195b.png\"},\"large\":{\"name\":\"large_laba.png\",\"hash\":\"large_laba_01d6b3195b\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":1245.55,\"url\":\"/uploads/large_laba_01d6b3195b.png\"}}", "laba_01d6b3195b", ".png", "image/png", 303.29, "/uploads/laba_01d6b3195b.png", NULL, "local", NULL, "/", "2023-03-22 08:34:55.187000", "2023-03-22 08:34:55.187000", 1, 1, 0),
	(18, "Home-j4sltd.png", NULL, NULL, 1280, 1174, "{\"thumbnail\":{\"name\":\"thumbnail_Home-j4sltd.png\",\"hash\":\"thumbnail_Home_j4sltd_e5996bd20d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":170,\"height\":156,\"size\":44.28,\"url\":\"/uploads/thumbnail_Home_j4sltd_e5996bd20d.png\"},\"small\":{\"name\":\"small_Home-j4sltd.png\",\"hash\":\"small_Home_j4sltd_e5996bd20d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":459,\"size\":301.31,\"url\":\"/uploads/small_Home_j4sltd_e5996bd20d.png\"},\"medium\":{\"name\":\"medium_Home-j4sltd.png\",\"hash\":\"medium_Home_j4sltd_e5996bd20d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":688,\"size\":637.47,\"url\":\"/uploads/medium_Home_j4sltd_e5996bd20d.png\"},\"large\":{\"name\":\"large_Home-j4sltd.png\",\"hash\":\"large_Home_j4sltd_e5996bd20d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":917,\"size\":1085.88,\"url\":\"/uploads/large_Home_j4sltd_e5996bd20d.png\"}}", "Home_j4sltd_e5996bd20d", ".png", "image/png", 307.49, "/uploads/Home_j4sltd_e5996bd20d.png", NULL, "local", NULL, "/", "2023-03-22 08:34:55.379000", "2023-03-22 08:34:55.379000", 1, 1, 0),
	(19, "avatar.jpg", NULL, NULL, 512, 512, "{\"thumbnail\":{\"name\":\"thumbnail_avatar.jpg\",\"hash\":\"thumbnail_avatar_baeab15bef\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":11.09,\"url\":\"/uploads/thumbnail_avatar_baeab15bef.jpg\"},\"small\":{\"name\":\"small_avatar.jpg\",\"hash\":\"small_avatar_baeab15bef\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":67.48,\"url\":\"/uploads/small_avatar_baeab15bef.jpg\"}}", "avatar_baeab15bef", ".jpg", "image/jpeg", 70.32, "/uploads/avatar_baeab15bef.jpg", NULL, "local", NULL, "/", "2023-03-22 08:34:56.234000", "2023-03-23 20:49:55.996000", 1, 1, 0),
	(20, "dgc.png", NULL, NULL, 1080, 1080, "{\"thumbnail\":{\"name\":\"thumbnail_dgc.png\",\"hash\":\"thumbnail_dgc_21c97bfd58\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":21.92,\"url\":\"/uploads/thumbnail_dgc_21c97bfd58.png\"},\"small\":{\"name\":\"small_dgc.png\",\"hash\":\"small_dgc_21c97bfd58\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":150.84,\"url\":\"/uploads/small_dgc_21c97bfd58.png\"},\"medium\":{\"name\":\"medium_dgc.png\",\"hash\":\"medium_dgc_21c97bfd58\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":310.4,\"url\":\"/uploads/medium_dgc_21c97bfd58.png\"},\"large\":{\"name\":\"large_dgc.png\",\"hash\":\"large_dgc_21c97bfd58\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":509.79,\"url\":\"/uploads/large_dgc_21c97bfd58.png\"}}", "dgc_21c97bfd58", ".png", "image/png", 126.66, "/uploads/dgc_21c97bfd58.png", NULL, "local", NULL, "/", "2023-03-22 08:34:56.278000", "2023-03-22 08:34:56.278000", 1, 1, 0),
	(21, "avatar.png", NULL, NULL, 512, 512, "{\"thumbnail\":{\"name\":\"thumbnail_avatar.png\",\"hash\":\"thumbnail_avatar_35aa4fc31c\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":70.02,\"url\":\"/uploads/thumbnail_avatar_35aa4fc31c.png\"},\"small\":{\"name\":\"small_avatar.png\",\"hash\":\"small_avatar_35aa4fc31c\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":613.92,\"url\":\"/uploads/small_avatar_35aa4fc31c.png\"}}", "avatar_35aa4fc31c", ".png", "image/png", 129, "/uploads/avatar_35aa4fc31c.png", NULL, "local", NULL, "/", "2023-03-22 08:34:56.612000", "2023-03-23 20:32:14.552000", 1, 1, 0),
	(22, "javascript.png", NULL, NULL, 288, 288, "{\"thumbnail\":{\"name\":\"thumbnail_javascript.png\",\"hash\":\"thumbnail_javascript_5791168ef4\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":5.05,\"url\":\"/uploads/thumbnail_javascript_5791168ef4.png\"}}", "javascript_5791168ef4", ".png", "image/png", 2.59, "/uploads/javascript_5791168ef4.png", NULL, "local", NULL, "/", "2023-03-23 22:00:47.368000", "2023-03-23 22:00:47.368000", 1, 1, 0),
	(23, "html.png", NULL, NULL, 288, 288, "{\"thumbnail\":{\"name\":\"thumbnail_html.png\",\"hash\":\"thumbnail_html_cacac8d650\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":15.7,\"url\":\"/uploads/thumbnail_html_cacac8d650.png\"}}", "html_cacac8d650", ".png", "image/png", 5.54, "/uploads/html_cacac8d650.png", NULL, "local", NULL, "/", "2023-03-23 22:00:47.373000", "2023-03-23 22:00:47.373000", 1, 1, 0),
	(24, "git.png", NULL, NULL, 288, 288, "{\"thumbnail\":{\"name\":\"thumbnail_git.png\",\"hash\":\"thumbnail_git_bf02b9588d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":7.51,\"url\":\"/uploads/thumbnail_git_bf02b9588d.png\"}}", "git_bf02b9588d", ".png", "image/png", 3.57, "/uploads/git_bf02b9588d.png", NULL, "local", NULL, "/", "2023-03-23 22:00:47.456000", "2023-03-23 22:00:47.456000", 1, 1, 0),
	(25, "typescript.png", NULL, NULL, 288, 288, "{\"thumbnail\":{\"name\":\"thumbnail_typescript.png\",\"hash\":\"thumbnail_typescript_708bc85900\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":4.26,\"url\":\"/uploads/thumbnail_typescript_708bc85900.png\"}}", "typescript_708bc85900", ".png", "image/png", 1.56, "/uploads/typescript_708bc85900.png", NULL, "local", NULL, "/", "2023-03-23 22:00:47.536000", "2023-03-23 22:00:47.536000", 1, 1, 0),
	(26, "nextjs.png", NULL, NULL, 288, 288, "{\"thumbnail\":{\"name\":\"thumbnail_nextjs.png\",\"hash\":\"thumbnail_nextjs_dae03fe506\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":3.54,\"url\":\"/uploads/thumbnail_nextjs_dae03fe506.png\"}}", "nextjs_dae03fe506", ".png", "image/png", 2.24, "/uploads/nextjs_dae03fe506.png", NULL, "local", NULL, "/", "2023-03-23 22:00:47.577000", "2023-03-23 22:00:47.577000", 1, 1, 0),
	(27, "react.png", NULL, NULL, 288, 288, "{\"thumbnail\":{\"name\":\"thumbnail_react.png\",\"hash\":\"thumbnail_react_396edc5f17\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":16.59,\"url\":\"/uploads/thumbnail_react_396edc5f17.png\"}}", "react_396edc5f17", ".png", "image/png", 7.35, "/uploads/react_396edc5f17.png", NULL, "local", NULL, "/", "2023-03-23 22:00:47.605000", "2023-03-23 22:00:47.605000", 1, 1, 0),
	(28, "tailwind.png", NULL, NULL, 288, 288, "{\"thumbnail\":{\"name\":\"thumbnail_tailwind.png\",\"hash\":\"thumbnail_tailwind_951dbcd6eb\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":7.25,\"url\":\"/uploads/thumbnail_tailwind_951dbcd6eb.png\"}}", "tailwind_951dbcd6eb", ".png", "image/png", 4.13, "/uploads/tailwind_951dbcd6eb.png", NULL, "local", NULL, "/", "2023-03-23 22:00:47.935000", "2023-03-23 22:00:47.935000", 1, 1, 0),
	(29, "css.png", NULL, NULL, 288, 288, "{\"thumbnail\":{\"name\":\"thumbnail_css.png\",\"hash\":\"thumbnail_css_448fff108d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":14.02,\"url\":\"/uploads/thumbnail_css_448fff108d.png\"}}", "css_448fff108d", ".png", "image/png", 3.42, "/uploads/css_448fff108d.png", NULL, "local", NULL, "/", "2023-03-23 22:00:47.972000", "2023-03-23 22:00:47.972000", 1, 1, 0),
	(30, "html.png", NULL, NULL, 288, 288, "{\"thumbnail\":{\"name\":\"thumbnail_html.png\",\"hash\":\"thumbnail_html_f259323378\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":15.7,\"url\":\"/uploads/thumbnail_html_f259323378.png\"}}", "html_f259323378", ".png", "image/png", 5.54, "/uploads/html_f259323378.png", NULL, "local", NULL, "/", "2023-03-23 22:00:48.043000", "2023-03-23 22:00:48.043000", 1, 1, 0);

/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table files_folder_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `files_folder_links`;

CREATE TABLE `files_folder_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned DEFAULT NULL,
  `folder_id` int(10) unsigned DEFAULT NULL,
  `file_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_folder_links_unique` (`file_id`,`folder_id`),
  KEY `files_folder_links_fk` (`file_id`),
  KEY `files_folder_links_inv_fk` (`folder_id`),
  KEY `files_folder_links_order_inv_fk` (`file_order`),
  CONSTRAINT `files_folder_links_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_folder_links_inv_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table files_related_morphs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `files_related_morphs`;

CREATE TABLE `files_related_morphs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned DEFAULT NULL,
  `related_id` int(10) unsigned DEFAULT NULL,
  `related_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_related_morphs_fk` (`file_id`),
  CONSTRAINT `files_related_morphs_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `files_related_morphs` WRITE;
/*!40000 ALTER TABLE `files_related_morphs` DISABLE KEYS */;

INSERT INTO `files_related_morphs` (`id`, `file_id`, `related_id`, `related_type`, `field`, `order`) VALUES
	(9, 19, 1, "blocks.hero", "images", 1),
	(10, 4, 1, "project.project-card", "image", 1),
	(11, 19, 2, "project.project-card", "image", 1),
	(12, 8, 3, "project.project-card", "image", 1),
	(13, 5, 4, "project.project-card", "image", 1),
	(14, 7, 5, "project.project-card", "image", 1),
	(15, 10, 6, "project.project-card", "image", 1),
	(17, 21, 1, "global.navigation", "logo", 1),
	(27, 22, 2, "__lib.tech-stack", "technologies", 1),
	(28, 23, 2, "__lib.tech-stack", "technologies", 2),
	(29, 24, 2, "__lib.tech-stack", "technologies", 3),
	(30, 25, 2, "__lib.tech-stack", "technologies", 4),
	(31, 26, 2, "__lib.tech-stack", "technologies", 5),
	(32, 27, 2, "__lib.tech-stack", "technologies", 6),
	(33, 28, 2, "__lib.tech-stack", "technologies", 7),
	(34, 29, 2, "__lib.tech-stack", "technologies", 8),
	(35, 30, 2, "__lib.tech-stack", "technologies", 9);

/*!40000 ALTER TABLE `files_related_morphs` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table globals
# ------------------------------------------------------------

DROP TABLE IF EXISTS `globals`;

CREATE TABLE `globals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `globals_created_by_id_fk` (`created_by_id`),
  KEY `globals_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `globals_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `globals_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `globals` WRITE;
/*!40000 ALTER TABLE `globals` DISABLE KEYS */;

INSERT INTO `globals` (`id`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `locale`, `sitemap_exclude`) VALUES
	(1, "2023-03-23 20:38:48.795000", "2023-03-23 21:36:55.762000", "2023-03-23 20:39:57.086000", 1, 1, "en", 0);

/*!40000 ALTER TABLE `globals` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table globals_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `globals_components`;

CREATE TABLE `globals_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `globals_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `globals_field_index` (`field`),
  KEY `globals_component_type_index` (`component_type`),
  KEY `globals_entity_fk` (`entity_id`),
  CONSTRAINT `globals_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `globals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `globals_components` WRITE;
/*!40000 ALTER TABLE `globals_components` DISABLE KEYS */;

INSERT INTO `globals_components` (`id`, `entity_id`, `component_id`, `component_type`, `field`, `order`) VALUES
	(1, 1, 1, "global.navigation", "navigation", NULL),
	(2, 1, 1, "global.footer", "footer", NULL);

/*!40000 ALTER TABLE `globals_components` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table globals_localizations_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `globals_localizations_links`;

CREATE TABLE `globals_localizations_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `global_id` int(10) unsigned DEFAULT NULL,
  `inv_global_id` int(10) unsigned DEFAULT NULL,
  `global_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `globals_localizations_links_unique` (`global_id`,`inv_global_id`),
  KEY `globals_localizations_links_fk` (`global_id`),
  KEY `globals_localizations_links_inv_fk` (`inv_global_id`),
  KEY `globals_localizations_links_order_fk` (`global_order`),
  CONSTRAINT `globals_localizations_links_fk` FOREIGN KEY (`global_id`) REFERENCES `globals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `globals_localizations_links_inv_fk` FOREIGN KEY (`inv_global_id`) REFERENCES `globals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table i18n_locale
# ------------------------------------------------------------

DROP TABLE IF EXISTS `i18n_locale`;

CREATE TABLE `i18n_locale` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i18n_locale_created_by_id_fk` (`created_by_id`),
  KEY `i18n_locale_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `i18n_locale_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `i18n_locale_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `i18n_locale` WRITE;
/*!40000 ALTER TABLE `i18n_locale` DISABLE KEYS */;

INSERT INTO `i18n_locale` (`id`, `name`, `code`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
	(1, "English (en)", "en", "2023-03-21 17:39:50.698000", "2023-03-21 17:39:50.698000", NULL, NULL);

/*!40000 ALTER TABLE `i18n_locale` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_created_by_id_fk` (`created_by_id`),
  KEY `pages_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `pages_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pages_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;

INSERT INTO `pages` (`id`, `title`, `slug`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `locale`, `sitemap_exclude`) VALUES
	(1, "Home", "/", "2023-03-23 20:51:56.609000", "2023-03-23 20:52:21.607000", "2023-03-23 20:52:21.580000", 1, 1, "en", 0),
	(2, "About", "/about", "2023-03-23 21:37:04.760000", "2023-03-23 22:05:36.410000", "2023-03-23 21:37:31.406000", 1, 1, "en", 0);

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table pages_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages_components`;

CREATE TABLE `pages_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `pages_field_index` (`field`),
  KEY `pages_component_type_index` (`component_type`),
  KEY `pages_entity_fk` (`entity_id`),
  CONSTRAINT `pages_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `pages_components` WRITE;
/*!40000 ALTER TABLE `pages_components` DISABLE KEYS */;

INSERT INTO `pages_components` (`id`, `entity_id`, `component_id`, `component_type`, `field`, `order`) VALUES
	(4, 1, 1, "blocks.hero", "blocks", 1),
	(5, 1, 1, "blocks.featured-projects", "blocks", 2),
	(6, 1, 1, "blocks.latest-code", "blocks", 3),
	(10, 2, 1, "blocks.page-title", "blocks", 1),
	(11, 2, 2, "blocks.about-me", "blocks", 2);

/*!40000 ALTER TABLE `pages_components` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table pages_editors_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages_editors_links`;

CREATE TABLE `pages_editors_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `user_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_editors_links_unique` (`page_id`,`user_id`),
  KEY `pages_editors_links_fk` (`page_id`),
  KEY `pages_editors_links_inv_fk` (`user_id`),
  KEY `pages_editors_links_order_fk` (`user_order`),
  CONSTRAINT `pages_editors_links_fk` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pages_editors_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table pages_localizations_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages_localizations_links`;

CREATE TABLE `pages_localizations_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned DEFAULT NULL,
  `inv_page_id` int(10) unsigned DEFAULT NULL,
  `page_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_localizations_links_unique` (`page_id`,`inv_page_id`),
  KEY `pages_localizations_links_fk` (`page_id`),
  KEY `pages_localizations_links_inv_fk` (`inv_page_id`),
  KEY `pages_localizations_links_order_fk` (`page_order`),
  CONSTRAINT `pages_localizations_links_fk` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pages_localizations_links_inv_fk` FOREIGN KEY (`inv_page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_slug_unique` (`slug`),
  KEY `product_created_by_id_fk` (`created_by_id`),
  KEY `product_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `product_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `product_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table product_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_components`;

CREATE TABLE `product_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `product_field_index` (`field`),
  KEY `product_component_type_index` (`component_type`),
  KEY `product_entity_fk` (`entity_id`),
  CONSTRAINT `product_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table product_localizations_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_localizations_links`;

CREATE TABLE `product_localizations_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `inv_product_id` int(10) unsigned DEFAULT NULL,
  `product_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_localizations_links_unique` (`product_id`,`inv_product_id`),
  KEY `product_localizations_links_fk` (`product_id`),
  KEY `product_localizations_links_inv_fk` (`inv_product_id`),
  KEY `product_localizations_links_order_fk` (`product_order`),
  CONSTRAINT `product_localizations_links_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_localizations_links_inv_fk` FOREIGN KEY (`inv_product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_slug_unique` (`slug`),
  KEY `project_created_by_id_fk` (`created_by_id`),
  KEY `project_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `project_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `project_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table project_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `project_components`;

CREATE TABLE `project_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `project_field_index` (`field`),
  KEY `project_component_type_index` (`component_type`),
  KEY `project_entity_fk` (`entity_id`),
  CONSTRAINT `project_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `project` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table project_localizations_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `project_localizations_links`;

CREATE TABLE `project_localizations_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned DEFAULT NULL,
  `inv_project_id` int(10) unsigned DEFAULT NULL,
  `project_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_localizations_links_unique` (`project_id`,`inv_project_id`),
  KEY `project_localizations_links_fk` (`project_id`),
  KEY `project_localizations_links_inv_fk` (`inv_project_id`),
  KEY `project_localizations_links_order_fk` (`project_order`),
  CONSTRAINT `project_localizations_links_fk` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_localizations_links_inv_fk` FOREIGN KEY (`inv_project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table reviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext DEFAULT NULL,
  `note` int(11) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_created_by_id_fk` (`created_by_id`),
  KEY `reviews_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `reviews_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `reviews_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table reviews_author_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reviews_author_links`;

CREATE TABLE `reviews_author_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `review_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_author_links_unique` (`review_id`,`user_id`),
  KEY `reviews_author_links_fk` (`review_id`),
  KEY `reviews_author_links_inv_fk` (`user_id`),
  KEY `reviews_author_links_order_inv_fk` (`review_order`),
  CONSTRAINT `reviews_author_links_fk` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_author_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table reviews_localizations_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reviews_localizations_links`;

CREATE TABLE `reviews_localizations_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int(10) unsigned DEFAULT NULL,
  `inv_review_id` int(10) unsigned DEFAULT NULL,
  `review_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_localizations_links_unique` (`review_id`,`inv_review_id`),
  KEY `reviews_localizations_links_fk` (`review_id`),
  KEY `reviews_localizations_links_inv_fk` (`inv_review_id`),
  KEY `reviews_localizations_links_order_fk` (`review_order`),
  CONSTRAINT `reviews_localizations_links_fk` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_localizations_links_inv_fk` FOREIGN KEY (`inv_review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table scheduler_scheduler
# ------------------------------------------------------------

DROP TABLE IF EXISTS `scheduler_scheduler`;

CREATE TABLE `scheduler_scheduler` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scheduled_datetime` datetime(6) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `content_id` bigint(20) DEFAULT NULL,
  `schedule_type` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scheduler_scheduler_created_by_id_fk` (`created_by_id`),
  KEY `scheduler_scheduler_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `scheduler_scheduler_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `scheduler_scheduler_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table shop
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `category_text` varchar(255) DEFAULT NULL,
  `tag_text` varchar(255) DEFAULT NULL,
  `per_page` int(11) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_created_by_id_fk` (`created_by_id`),
  KEY `shop_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `shop_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shop_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table shop_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_components`;

CREATE TABLE `shop_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `shop_field_index` (`field`),
  KEY `shop_component_type_index` (`component_type`),
  KEY `shop_entity_fk` (`entity_id`),
  CONSTRAINT `shop_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `shop` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table shop_localizations_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_localizations_links`;

CREATE TABLE `shop_localizations_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) unsigned DEFAULT NULL,
  `inv_shop_id` int(10) unsigned DEFAULT NULL,
  `shop_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_localizations_links_unique` (`shop_id`,`inv_shop_id`),
  KEY `shop_localizations_links_fk` (`shop_id`),
  KEY `shop_localizations_links_inv_fk` (`inv_shop_id`),
  KEY `shop_localizations_links_order_fk` (`shop_order`),
  CONSTRAINT `shop_localizations_links_fk` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shop_localizations_links_inv_fk` FOREIGN KEY (`inv_shop_id`) REFERENCES `shop` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table strapi_api_token_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strapi_api_token_permissions`;

CREATE TABLE `strapi_api_token_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_token_permissions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_token_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table strapi_api_token_permissions_token_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strapi_api_token_permissions_token_links`;

CREATE TABLE `strapi_api_token_permissions_token_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `api_token_permission_id` int(10) unsigned DEFAULT NULL,
  `api_token_id` int(10) unsigned DEFAULT NULL,
  `api_token_permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_api_token_permissions_token_links_unique` (`api_token_permission_id`,`api_token_id`),
  KEY `strapi_api_token_permissions_token_links_fk` (`api_token_permission_id`),
  KEY `strapi_api_token_permissions_token_links_inv_fk` (`api_token_id`),
  KEY `strapi_api_token_permissions_token_links_order_inv_fk` (`api_token_permission_order`),
  CONSTRAINT `strapi_api_token_permissions_token_links_fk` FOREIGN KEY (`api_token_permission_id`) REFERENCES `strapi_api_token_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_api_token_permissions_token_links_inv_fk` FOREIGN KEY (`api_token_id`) REFERENCES `strapi_api_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table strapi_api_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strapi_api_tokens`;

CREATE TABLE `strapi_api_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_tokens_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_tokens_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table strapi_core_store_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strapi_core_store_settings`;

CREATE TABLE `strapi_core_store_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `strapi_core_store_settings` WRITE;
/*!40000 ALTER TABLE `strapi_core_store_settings` DISABLE KEYS */;

INSERT INTO `strapi_core_store_settings` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
	(1, "strapi_content_types_schema", "{\"admin::permission\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"permission\",\"connection\":\"default\",\"uid\":\"admin::permission\",\"plugin\":\"admin\",\"globalId\":\"AdminPermission\"},\"admin::user\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user\",\"connection\":\"default\",\"uid\":\"admin::user\",\"plugin\":\"admin\",\"globalId\":\"AdminUser\"},\"admin::role\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"role\",\"connection\":\"default\",\"uid\":\"admin::role\",\"plugin\":\"admin\",\"globalId\":\"AdminRole\"},\"admin::api-token\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"api-token\",\"connection\":\"default\",\"uid\":\"admin::api-token\",\"plugin\":\"admin\",\"globalId\":\"AdminApiToken\"},\"admin::api-token-permission\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"api-token-permission\",\"connection\":\"default\",\"uid\":\"admin::api-token-permission\",\"plugin\":\"admin\",\"globalId\":\"AdminApiTokenPermission\"},\"plugin::upload.file\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"min\":1,\"required\":true,\"private\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"indexes\":[{\"name\":\"upload_files_folder_path_index\",\"columns\":[\"folder_path\"],\"type\":null},{\"name\":\"upload_files_created_at_index\",\"columns\":[\"created_at\"],\"type\":null},{\"name\":\"upload_files_updated_at_index\",\"columns\":[\"updated_at\"],\"type\":null},{\"name\":\"upload_files_name_index\",\"columns\":[\"name\"],\"type\":null},{\"name\":\"upload_files_size_index\",\"columns\":[\"size\"],\"type\":null},{\"name\":\"upload_files_ext_index\",\"columns\":[\"ext\"],\"type\":null}],\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"min\":1,\"required\":true,\"private\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"file\",\"connection\":\"default\",\"uid\":\"plugin::upload.file\",\"plugin\":\"upload\",\"globalId\":\"UploadFile\"},\"plugin::upload.folder\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"min\":1,\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"indexes\":[{\"name\":\"upload_folders_path_id_index\",\"columns\":[\"path_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_path_index\",\"columns\":[\"path\"],\"type\":\"unique\"}],\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"min\":1,\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"folder\",\"connection\":\"default\",\"uid\":\"plugin::upload.folder\",\"plugin\":\"upload\",\"globalId\":\"UploadFolder\"},\"plugin::scheduler.scheduler\":{\"info\":{\"collectionName\":\"scheduler\",\"singularName\":\"scheduler\",\"pluralName\":\"scheduler\",\"displayName\":\"scheduler\",\"description\":\"\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"scheduledDatetime\":{\"type\":\"datetime\"},\"uid\":{\"type\":\"string\"},\"contentId\":{\"type\":\"biginteger\"},\"scheduleType\":{\"type\":\"string\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"kind\":\"collectionType\",\"__schema__\":{\"info\":{\"collectionName\":\"scheduler\",\"singularName\":\"scheduler\",\"pluralName\":\"scheduler\",\"displayName\":\"scheduler\",\"description\":\"\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"scheduledDatetime\":{\"type\":\"datetime\"},\"uid\":{\"type\":\"string\"},\"contentId\":{\"type\":\"biginteger\"},\"scheduleType\":{\"type\":\"string\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"scheduler\",\"connection\":\"default\",\"uid\":\"plugin::scheduler.scheduler\",\"plugin\":\"scheduler\",\"collectionName\":\"scheduler_scheduler\",\"globalId\":\"SchedulerScheduler\"},\"plugin::i18n.locale\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"locale\",\"connection\":\"default\",\"uid\":\"plugin::i18n.locale\",\"plugin\":\"i18n\",\"collectionName\":\"i18n_locale\",\"globalId\":\"I18NLocale\"},\"plugin::users-permissions.permission\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"permission\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.permission\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsPermission\"},\"plugin::users-permissions.role\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"role\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.role\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsRole\"},\"plugin::users-permissions.user\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false},\"reviews\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::review.review\",\"mappedBy\":\"author\"},\"articles\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::article.article\",\"mappedBy\":\"author\"},\"picture\":{\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"type\":\"media\",\"multiple\":false},\"job\":{\"type\":\"string\",\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"config\":{\"attributes\":{\"resetPasswordToken\":{\"hidden\":true},\"confirmationToken\":{\"hidden\":true},\"provider\":{\"hidden\":true}}},\"kind\":\"collectionType\",\"__filename__\":\"schema.json\",\"__schema__\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false},\"reviews\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::review.review\",\"mappedBy\":\"author\"},\"articles\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::article.article\",\"mappedBy\":\"author\"},\"picture\":{\"allowedTypes\":[\"images\",\"files\",\"videos\"],\"type\":\"media\",\"multiple\":false},\"job\":{\"type\":\"string\",\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.user\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsUser\"},\"plugin::todo.task\":{\"info\":{\"tableName\":\"task\",\"singularName\":\"task\",\"pluralName\":\"tasks\",\"displayName\":\"Task\",\"description\":\"A task in Strapi\",\"kind\":\"collectionType\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true,\"maxLength\":40},\"isDone\":{\"type\":\"boolean\",\"default\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToOne\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"kind\":\"collectionType\",\"__schema__\":{\"info\":{\"tableName\":\"task\",\"singularName\":\"task\",\"pluralName\":\"tasks\",\"displayName\":\"Task\",\"description\":\"A task in Strapi\",\"kind\":\"collectionType\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true,\"maxLength\":40},\"isDone\":{\"type\":\"boolean\",\"default\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToOne\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"task\",\"connection\":\"default\",\"uid\":\"plugin::todo.task\",\"plugin\":\"todo\",\"collectionName\":\"todo_task\",\"globalId\":\"TodoTask\"},\"api::article.article\":{\"kind\":\"collectionType\",\"collectionName\":\"article\",\"info\":{\"singularName\":\"article\",\"pluralName\":\"articles\",\"displayName\":\"article\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"slug\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"uid\"},\"publicationState\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"enumeration\",\"enum\":[\"Draft\",\"In review\",\"Changes requested\",\"Publication scheduled\",\"Published\"],\"default\":\"Draft\"},\"publicationStages\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"json\"},\"main\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"modules.article\"],\"required\":true,\"max\":1},\"blocks\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"blocks.faq\",\"blocks.cta\"],\"required\":false},\"seo\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"__lib.seo\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"localizations\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::article.article\"},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"__schema__\":{\"collectionName\":\"article\",\"info\":{\"singularName\":\"article\",\"pluralName\":\"articles\",\"displayName\":\"article\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"slug\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"uid\"},\"publicationState\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"enumeration\",\"enum\":[\"Draft\",\"In review\",\"Changes requested\",\"Publication scheduled\",\"Published\"],\"default\":\"Draft\"},\"publicationStages\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"json\"},\"main\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"modules.article\"],\"required\":true,\"max\":1},\"blocks\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"blocks.faq\",\"blocks.cta\"],\"required\":false},\"seo\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"__lib.seo\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"article\",\"connection\":\"default\",\"uid\":\"api::article.article\",\"apiName\":\"article\",\"globalId\":\"Article\",\"actions\":{},\"lifecycles\":{}},\"api::blog.blog\":{\"kind\":\"singleType\",\"collectionName\":\"blog\",\"info\":{\"singularName\":\"blog\",\"pluralName\":\"blogs\",\"displayName\":\"Blog\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"slug\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"string\",\"required\":true},\"categoryText\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"string\"},\"perPage\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"integer\",\"required\":true},\"main\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"modules.articles\"],\"max\":1},\"blocks\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"blocks.cta\"]},\"seo\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"__lib.seo\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"localizations\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::blog.blog\"},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"__schema__\":{\"collectionName\":\"blog\",\"info\":{\"singularName\":\"blog\",\"pluralName\":\"blogs\",\"displayName\":\"Blog\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"slug\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"string\",\"required\":true},\"categoryText\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"string\"},\"perPage\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"integer\",\"required\":true},\"main\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"modules.articles\"],\"max\":1},\"blocks\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"blocks.cta\"]},\"seo\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"__lib.seo\"}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"blog\",\"connection\":\"default\",\"uid\":\"api::blog.blog\",\"apiName\":\"blog\",\"globalId\":\"Blog\",\"actions\":{},\"lifecycles\":{}},\"api::category.category\":{\"kind\":\"collectionType\",\"collectionName\":\"categories\",\"info\":{\"singularName\":\"category\",\"pluralName\":\"categories\",\"displayName\":\"category\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"slug\":{\"type\":\"uid\",\"targetField\":\"name\"},\"products\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::product.product\",\"mappedBy\":\"category\"},\"articles\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::article.article\",\"mappedBy\":\"category\"},\"projects\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::article.article\",\"mappedBy\":\"category\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"__schema__\":{\"collectionName\":\"categories\",\"info\":{\"singularName\":\"category\",\"pluralName\":\"categories\",\"displayName\":\"category\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"slug\":{\"type\":\"uid\",\"targetField\":\"name\"},\"products\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::product.product\",\"mappedBy\":\"category\"},\"articles\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::article.article\",\"mappedBy\":\"category\"},\"projects\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::article.article\",\"mappedBy\":\"category\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"category\",\"connection\":\"default\",\"uid\":\"api::category.category\",\"apiName\":\"category\",\"globalId\":\"Category\",\"actions\":{},\"lifecycles\":{}},\"api::cookie.cookie\":{\"kind\":\"collectionType\",\"collectionName\":\"cookies\",\"info\":{\"singularName\":\"cookie\",\"pluralName\":\"cookies\",\"displayName\":\"Cookies\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"i18n\":{\"localized\":true},\"content-manager\":{\"visible\":false}},\"attributes\":{\"name\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"string\",\"required\":true},\"description\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"text\",\"required\":true},\"host\":{\"type\":\"string\",\"required\":true},\"category\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::cookie-category.cookie-category\",\"inversedBy\":\"cookies\",\"required\":true},\"party\":{\"type\":\"enumeration\",\"enum\":[\"First-party\",\"Second-party\",\"Third-party\"],\"required\":true},\"isVisible\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"boolean\",\"default\":true,\"required\":true},\"duration\":{\"type\":\"json\",\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"localizations\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::cookie.cookie\"},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"__schema__\":{\"collectionName\":\"cookies\",\"info\":{\"singularName\":\"cookie\",\"pluralName\":\"cookies\",\"displayName\":\"Cookies\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"i18n\":{\"localized\":true},\"content-manager\":{\"visible\":false}},\"attributes\":{\"name\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"string\",\"required\":true},\"description\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"text\",\"required\":true},\"host\":{\"type\":\"string\",\"required\":true},\"category\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::cookie-category.cookie-category\",\"inversedBy\":\"cookies\",\"required\":true},\"party\":{\"type\":\"enumeration\",\"enum\":[\"First-party\",\"Second-party\",\"Third-party\"],\"required\":true},\"isVisible\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"boolean\",\"default\":true,\"required\":true},\"duration\":{\"type\":\"json\",\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"cookie\",\"connection\":\"default\",\"uid\":\"api::cookie.cookie\",\"apiName\":\"cookie\",\"globalId\":\"Cookie\",\"actions\":{},\"lifecycles\":{}},\"api::cookie-category.cookie-category\":{\"kind\":\"collectionType\",\"collectionName\":\"cookie_categories\",\"info\":{\"singularName\":\"cookie-category\",\"pluralName\":\"cookie-categories\",\"displayName\":\"Cookie Categories\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"i18n\":{\"localized\":true},\"content-manager\":{\"visible\":false}},\"attributes\":{\"name\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"string\",\"required\":true},\"description\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"text\",\"required\":true},\"cookies\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::cookie.cookie\",\"mappedBy\":\"category\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"localizations\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::cookie-category.cookie-category\"},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"__schema__\":{\"collectionName\":\"cookie_categories\",\"info\":{\"singularName\":\"cookie-category\",\"pluralName\":\"cookie-categories\",\"displayName\":\"Cookie Categories\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"i18n\":{\"localized\":true},\"content-manager\":{\"visible\":false}},\"attributes\":{\"name\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"string\",\"required\":true},\"description\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"text\",\"required\":true},\"cookies\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::cookie.cookie\",\"mappedBy\":\"category\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"cookie-category\",\"connection\":\"default\",\"uid\":\"api::cookie-category.cookie-category\",\"apiName\":\"cookie-category\",\"globalId\":\"CookieCategory\",\"actions\":{},\"lifecycles\":{}},\"api::cookie-popup.cookie-popup\":{\"kind\":\"collectionType\",\"collectionName\":\"cookie_popups\",\"info\":{\"singularName\":\"cookie-popup\",\"pluralName\":\"cookie-popups\",\"displayName\":\"Cookie Popups\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"i18n\":{\"localized\":true},\"content-manager\":{\"visible\":false}},\"attributes\":{\"title\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"string\"},\"description\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"richtext\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"localizations\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::cookie-popup.cookie-popup\"},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"__schema__\":{\"collectionName\":\"cookie_popups\",\"info\":{\"singularName\":\"cookie-popup\",\"pluralName\":\"cookie-popups\",\"displayName\":\"Cookie Popups\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"i18n\":{\"localized\":true},\"content-manager\":{\"visible\":false}},\"attributes\":{\"title\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"string\"},\"description\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"richtext\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"cookie-popup\",\"connection\":\"default\",\"uid\":\"api::cookie-popup.cookie-popup\",\"apiName\":\"cookie-popup\",\"globalId\":\"CookiePopup\",\"actions\":{},\"lifecycles\":{}},\"api::global.global\":{\"kind\":\"singleType\",\"collectionName\":\"globals\",\"info\":{\"singularName\":\"global\",\"pluralName\":\"globals\",\"displayName\":\"Global\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true},\"versions\":{\"versioned\":true}},\"attributes\":{\"navigation\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"global.navigation\"},\"footer\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"global.footer\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"localizations\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::global.global\"},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"__schema__\":{\"collectionName\":\"globals\",\"info\":{\"singularName\":\"global\",\"pluralName\":\"globals\",\"displayName\":\"Global\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true},\"versions\":{\"versioned\":true}},\"attributes\":{\"navigation\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"global.navigation\"},\"footer\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"global.footer\"}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"global\",\"connection\":\"default\",\"uid\":\"api::global.global\",\"apiName\":\"global\",\"globalId\":\"Global\",\"actions\":{},\"lifecycles\":{}},\"api::page.page\":{\"kind\":\"collectionType\",\"collectionName\":\"pages\",\"info\":{\"singularName\":\"page\",\"pluralName\":\"pages\",\"displayName\":\"page\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true,\"pluginOptions\":{\"i18n\":{\"localized\":true}}},\"slug\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"string\",\"required\":false},\"blocks\":{\"type\":\"dynamiczone\",\"components\":[\"blocks.hero\",\"blocks.page-title\",\"blocks.featured-projects\",\"blocks.latest-code\",\"blocks.about-me\",\"article.related-articles\",\"product.related-products\",\"blocks.cta\",\"blocks.faq\",\"blocks.pricing\",\"blocks.team\",\"blocks.testimonial\"],\"pluginOptions\":{\"i18n\":{\"localized\":true}}},\"seo\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"__lib.seo\"},\"editors\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::user\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"localizations\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::page.page\"},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"__schema__\":{\"collectionName\":\"pages\",\"info\":{\"singularName\":\"page\",\"pluralName\":\"pages\",\"displayName\":\"page\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true,\"pluginOptions\":{\"i18n\":{\"localized\":true}}},\"slug\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"string\",\"required\":false},\"blocks\":{\"type\":\"dynamiczone\",\"components\":[\"blocks.hero\",\"blocks.page-title\",\"blocks.featured-projects\",\"blocks.latest-code\",\"blocks.about-me\",\"article.related-articles\",\"product.related-products\",\"blocks.cta\",\"blocks.faq\",\"blocks.pricing\",\"blocks.team\",\"blocks.testimonial\"],\"pluginOptions\":{\"i18n\":{\"localized\":true}}},\"seo\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"__lib.seo\"},\"editors\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::user\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"page\",\"connection\":\"default\",\"uid\":\"api::page.page\",\"apiName\":\"page\",\"globalId\":\"Page\",\"actions\":{},\"lifecycles\":{}},\"api::product.product\":{\"kind\":\"collectionType\",\"collectionName\":\"product\",\"info\":{\"singularName\":\"product\",\"pluralName\":\"products\",\"displayName\":\"product\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"slug\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"uid\"},\"main\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"modules.product\"],\"required\":true,\"max\":1},\"blocks\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"blocks.faq\",\"blocks.cta\"]},\"seo\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"__lib.seo\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"localizations\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::product.product\"},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"__schema__\":{\"collectionName\":\"product\",\"info\":{\"singularName\":\"product\",\"pluralName\":\"products\",\"displayName\":\"product\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"slug\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"uid\"},\"main\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"modules.product\"],\"required\":true,\"max\":1},\"blocks\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"blocks.faq\",\"blocks.cta\"]},\"seo\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"__lib.seo\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"product\",\"connection\":\"default\",\"uid\":\"api::product.product\",\"apiName\":\"product\",\"globalId\":\"Product\",\"actions\":{},\"lifecycles\":{}},\"api::project.project\":{\"kind\":\"collectionType\",\"collectionName\":\"project\",\"info\":{\"singularName\":\"project\",\"pluralName\":\"projects\",\"displayName\":\"project\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"slug\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"uid\"},\"main\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"modules.project\"],\"required\":true,\"max\":1},\"blocks\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"blocks.cta\"]},\"seo\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"__lib.seo\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"localizations\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::project.project\"},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"__schema__\":{\"collectionName\":\"project\",\"info\":{\"singularName\":\"project\",\"pluralName\":\"projects\",\"displayName\":\"project\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"slug\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"uid\"},\"main\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"modules.project\"],\"required\":true,\"max\":1},\"blocks\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"blocks.cta\"]},\"seo\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"__lib.seo\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"project\",\"connection\":\"default\",\"uid\":\"api::project.project\",\"apiName\":\"project\",\"globalId\":\"Project\",\"actions\":{},\"lifecycles\":{}},\"api::review.review\":{\"kind\":\"collectionType\",\"collectionName\":\"reviews\",\"info\":{\"singularName\":\"review\",\"pluralName\":\"reviews\",\"displayName\":\"review\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"content\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"text\"},\"note\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"integer\",\"required\":true,\"max\":5,\"min\":1},\"author\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.user\",\"inversedBy\":\"reviews\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"localizations\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::review.review\"},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"__schema__\":{\"collectionName\":\"reviews\",\"info\":{\"singularName\":\"review\",\"pluralName\":\"reviews\",\"displayName\":\"review\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"content\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"text\"},\"note\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"integer\",\"required\":true,\"max\":5,\"min\":1},\"author\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.user\",\"inversedBy\":\"reviews\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"review\",\"connection\":\"default\",\"uid\":\"api::review.review\",\"apiName\":\"review\",\"globalId\":\"Review\",\"actions\":{},\"lifecycles\":{}},\"api::shop.shop\":{\"kind\":\"singleType\",\"collectionName\":\"shop\",\"info\":{\"singularName\":\"shop\",\"pluralName\":\"shops\",\"displayName\":\"Shop\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"slug\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"string\",\"required\":true},\"categoryText\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"string\",\"required\":true},\"TagText\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"string\",\"required\":true},\"perPage\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"integer\",\"required\":true},\"main\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"modules.products\"],\"max\":1},\"blocks\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"blocks.cta\"]},\"seo\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"__lib.seo\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"localizations\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::shop.shop\"},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"__schema__\":{\"collectionName\":\"shop\",\"info\":{\"singularName\":\"shop\",\"pluralName\":\"shops\",\"displayName\":\"Shop\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"slug\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"string\",\"required\":true},\"categoryText\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"string\",\"required\":true},\"TagText\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"string\",\"required\":true},\"perPage\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"integer\",\"required\":true},\"main\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"modules.products\"],\"max\":1},\"blocks\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"blocks.cta\"]},\"seo\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"__lib.seo\"}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"shop\",\"connection\":\"default\",\"uid\":\"api::shop.shop\",\"apiName\":\"shop\",\"globalId\":\"Shop\",\"actions\":{},\"lifecycles\":{}},\"api::tag.tag\":{\"kind\":\"collectionType\",\"collectionName\":\"tags\",\"info\":{\"singularName\":\"tag\",\"pluralName\":\"tags\",\"displayName\":\"tag\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"products\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::product.product\",\"mappedBy\":\"tag\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"__schema__\":{\"collectionName\":\"tags\",\"info\":{\"singularName\":\"tag\",\"pluralName\":\"tags\",\"displayName\":\"tag\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"products\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::product.product\",\"mappedBy\":\"tag\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"tag\",\"connection\":\"default\",\"uid\":\"api::tag.tag\",\"apiName\":\"tag\",\"globalId\":\"Tag\",\"actions\":{},\"lifecycles\":{}},\"api::work.work\":{\"kind\":\"singleType\",\"collectionName\":\"work\",\"info\":{\"singularName\":\"work\",\"pluralName\":\"works\",\"displayName\":\"Work\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"slug\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"string\",\"required\":true},\"perPage\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"integer\",\"required\":true},\"main\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"modules.projects\"],\"max\":1},\"blocks\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"blocks.cta\"]},\"seo\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"__lib.seo\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"localizations\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::work.work\"},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"sitemap_exclude\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"default\":false,\"type\":\"boolean\"}},\"__schema__\":{\"collectionName\":\"work\",\"info\":{\"singularName\":\"work\",\"pluralName\":\"works\",\"displayName\":\"Work\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"slug\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"string\",\"required\":true},\"perPage\":{\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"type\":\"integer\",\"required\":true},\"main\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"modules.projects\"],\"max\":1},\"blocks\":{\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"type\":\"dynamiczone\",\"components\":[\"blocks.cta\"]},\"seo\":{\"type\":\"component\",\"repeatable\":false,\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"__lib.seo\"}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"work\",\"connection\":\"default\",\"uid\":\"api::work.work\",\"apiName\":\"work\",\"globalId\":\"Work\",\"actions\":{},\"lifecycles\":{}}}", "object", NULL, NULL),
	(2, "plugin_content_manager_configuration_components::__lib.bio", "{\"uid\":\"__lib.bio\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"headline\",\"defaultSortBy\":\"headline\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"headline\":{\"edit\":{\"label\":\"headline\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"headline\",\"searchable\":true,\"sortable\":true}},\"text\":{\"edit\":{\"label\":\"text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"text\",\"searchable\":false,\"sortable\":false}},\"currentProject\":{\"edit\":{\"label\":\"currentProject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"currentProject\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"headline\",\"currentProject\"],\"edit\":[[{\"name\":\"headline\",\"size\":6}],[{\"name\":\"text\",\"size\":12}],[{\"name\":\"currentProject\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(3, "plugin_content_manager_configuration_components::__lib.button", "{\"uid\":\"__lib.button\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"theme\":{\"edit\":{\"label\":\"theme\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"theme\",\"searchable\":true,\"sortable\":true}},\"link\":{\"edit\":{\"label\":\"link\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"link\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"theme\",\"link\"],\"edit\":[[{\"name\":\"theme\",\"size\":6}],[{\"name\":\"link\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(4, "plugin_content_manager_configuration_components::__lib.link", "{\"uid\":\"__lib.link\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"href\",\"defaultSortBy\":\"href\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"href\":{\"edit\":{\"label\":\"href\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"href\",\"searchable\":true,\"sortable\":true}},\"label\":{\"edit\":{\"label\":\"label\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"label\",\"searchable\":true,\"sortable\":true}},\"target\":{\"edit\":{\"label\":\"target\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"target\",\"searchable\":true,\"sortable\":true}},\"isExternal\":{\"edit\":{\"label\":\"isExternal\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isExternal\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"href\",\"label\",\"target\"],\"edit\":[[{\"name\":\"href\",\"size\":6},{\"name\":\"label\",\"size\":6}],[{\"name\":\"target\",\"size\":6},{\"name\":\"isExternal\",\"size\":4}]]},\"isComponent\":true}", "object", NULL, NULL),
	(5, "plugin_content_manager_configuration_components::__lib.perks", "{\"uid\":\"__lib.perks\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"included\":{\"edit\":{\"label\":\"included\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"included\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"included\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"included\",\"size\":4}]]},\"isComponent\":true}", "object", NULL, NULL),
	(6, "plugin_content_manager_configuration_components::__lib.meta-social", "{\"uid\":\"__lib.meta-social\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"socialNetwork\":{\"edit\":{\"label\":\"socialNetwork\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"socialNetwork\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"image\":{\"edit\":{\"label\":\"image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"image\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"socialNetwork\",\"title\",\"description\"],\"edit\":[[{\"name\":\"socialNetwork\",\"size\":6},{\"name\":\"title\",\"size\":6}],[{\"name\":\"description\",\"size\":6},{\"name\":\"image\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(7, "plugin_content_manager_configuration_components::__lib.card", "{\"uid\":\"__lib.card\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"text\":{\"edit\":{\"label\":\"text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"text\",\"searchable\":true,\"sortable\":true}},\"image\":{\"edit\":{\"label\":\"image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"image\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"title\",\"text\",\"image\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"text\",\"size\":6}],[{\"name\":\"image\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(8, "plugin_content_manager_configuration_components::__lib.features-check", "{\"uid\":\"__lib.features-check\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"text\",\"defaultSortBy\":\"text\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"text\":{\"edit\":{\"label\":\"text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"text\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"text\"],\"edit\":[[{\"name\":\"text\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(9, "plugin_content_manager_configuration_components::__lib.footer-columns", "{\"uid\":\"__lib.footer-columns\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"label\",\"defaultSortBy\":\"label\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"label\":{\"edit\":{\"label\":\"label\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"label\",\"searchable\":true,\"sortable\":true}},\"links\":{\"edit\":{\"label\":\"links\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"links\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"label\",\"links\"],\"edit\":[[{\"name\":\"label\",\"size\":6}],[{\"name\":\"links\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(10, "plugin_content_manager_configuration_components::__lib.header", "{\"uid\":\"__lib.header\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"theme\":{\"edit\":{\"label\":\"theme\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"theme\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"subtitle\":{\"edit\":{\"label\":\"subtitle\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"subtitle\",\"searchable\":true,\"sortable\":true}},\"text\":{\"edit\":{\"label\":\"text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"text\",\"searchable\":false,\"sortable\":false}},\"link\":{\"edit\":{\"label\":\"link\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"link\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"theme\",\"title\",\"subtitle\"],\"edit\":[[{\"name\":\"theme\",\"size\":6},{\"name\":\"title\",\"size\":6}],[{\"name\":\"subtitle\",\"size\":6}],[{\"name\":\"text\",\"size\":12}],[{\"name\":\"link\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(11, "plugin_content_manager_configuration_components::__lib.social-networks", "{\"uid\":\"__lib.social-networks\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"url\",\"defaultSortBy\":\"url\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"url\"],\"edit\":[[{\"name\":\"url\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(12, "plugin_content_manager_configuration_components::__lib.team-card", "{\"uid\":\"__lib.team-card\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"fullname\",\"defaultSortBy\":\"fullname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"fullname\":{\"edit\":{\"label\":\"fullname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"fullname\",\"searchable\":true,\"sortable\":true}},\"job\":{\"edit\":{\"label\":\"job\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"job\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"socialNetworks\":{\"edit\":{\"label\":\"socialNetworks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"socialNetworks\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"fullname\",\"job\",\"description\"],\"edit\":[[{\"name\":\"fullname\",\"size\":6},{\"name\":\"job\",\"size\":6}],[{\"name\":\"description\",\"size\":6}],[{\"name\":\"socialNetworks\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(13, "plugin_content_manager_configuration_components::__lib.tech-stack", "{\"uid\":\"__lib.tech-stack\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"technologies\":{\"edit\":{\"label\":\"technologies\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"technologies\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"title\",\"technologies\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"technologies\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(14, "plugin_content_manager_configuration_components::__lib.widgets", "{\"uid\":\"__lib.widgets\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"text\":{\"edit\":{\"label\":\"text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"text\",\"searchable\":true,\"sortable\":true}},\"button\":{\"edit\":{\"label\":\"button\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"button\",\"searchable\":false,\"sortable\":false}},\"links\":{\"edit\":{\"label\":\"links\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"links\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"title\",\"text\",\"button\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"text\",\"size\":6}],[{\"name\":\"button\",\"size\":12}],[{\"name\":\"links\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(15, "plugin_content_manager_configuration_components::article.article-content", "{\"uid\":\"article.article-content\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"content\":{\"edit\":{\"label\":\"content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"content\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\"],\"edit\":[[{\"name\":\"content\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(16, "plugin_content_manager_configuration_components::__lib.pricing-cards", "{\"uid\":\"__lib.pricing-cards\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"price\":{\"edit\":{\"label\":\"price\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"price\",\"searchable\":true,\"sortable\":true}},\"perks\":{\"edit\":{\"label\":\"perks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"perks\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"title\",\"description\",\"price\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"price\",\"size\":4}],[{\"name\":\"perks\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(17, "plugin_content_manager_configuration_components::__lib.question-answer", "{\"uid\":\"__lib.question-answer\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"question\",\"defaultSortBy\":\"question\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"question\":{\"edit\":{\"label\":\"question\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"question\",\"searchable\":true,\"sortable\":true}},\"answer\":{\"edit\":{\"label\":\"answer\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"answer\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"question\"],\"edit\":[[{\"name\":\"question\",\"size\":6}],[{\"name\":\"answer\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(18, "plugin_content_manager_configuration_components::__lib.comment", "{\"uid\":\"__lib.comment\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"content\":{\"edit\":{\"label\":\"content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"content\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"content\"],\"edit\":[[{\"name\":\"content\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(19, "plugin_content_manager_configuration_components::__lib.seo", "{\"uid\":\"__lib.seo\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"metaTitle\",\"defaultSortBy\":\"metaTitle\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"metaTitle\":{\"edit\":{\"label\":\"metaTitle\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"metaTitle\",\"searchable\":true,\"sortable\":true}},\"metaDescription\":{\"edit\":{\"label\":\"metaDescription\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"metaDescription\",\"searchable\":true,\"sortable\":true}},\"metaImage\":{\"edit\":{\"label\":\"metaImage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"metaImage\",\"searchable\":false,\"sortable\":false}},\"metaSocial\":{\"edit\":{\"label\":\"metaSocial\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"metaSocial\",\"searchable\":false,\"sortable\":false}},\"keywords\":{\"edit\":{\"label\":\"keywords\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"keywords\",\"searchable\":true,\"sortable\":true}},\"metaRobots\":{\"edit\":{\"label\":\"metaRobots\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"metaRobots\",\"searchable\":true,\"sortable\":true}},\"structuredData\":{\"edit\":{\"label\":\"structuredData\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"structuredData\",\"searchable\":false,\"sortable\":false}},\"metaViewport\":{\"edit\":{\"label\":\"metaViewport\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"metaViewport\",\"searchable\":true,\"sortable\":true}},\"canonicalURL\":{\"edit\":{\"label\":\"canonicalURL\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"canonicalURL\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"metaTitle\",\"metaDescription\",\"metaImage\"],\"edit\":[[{\"name\":\"metaTitle\",\"size\":6},{\"name\":\"metaDescription\",\"size\":6}],[{\"name\":\"metaImage\",\"size\":6}],[{\"name\":\"metaSocial\",\"size\":12}],[{\"name\":\"keywords\",\"size\":6},{\"name\":\"metaRobots\",\"size\":6}],[{\"name\":\"structuredData\",\"size\":12}],[{\"name\":\"metaViewport\",\"size\":6},{\"name\":\"canonicalURL\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(20, "plugin_content_manager_configuration_components::__lib.publication", "{\"uid\":\"__lib.publication\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"publish_at\":{\"edit\":{\"label\":\"publish_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"publish_at\",\"searchable\":true,\"sortable\":true}},\"ready\":{\"edit\":{\"label\":\"ready\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ready\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"publish_at\",\"ready\"],\"edit\":[[{\"name\":\"publish_at\",\"size\":6},{\"name\":\"ready\",\"size\":4}]]},\"isComponent\":true}", "object", NULL, NULL),
	(21, "plugin_content_manager_configuration_components::article.related-articles", "{\"uid\":\"article.related-articles\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"header\":{\"edit\":{\"label\":\"header\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"header\",\"searchable\":false,\"sortable\":false}},\"articles\":{\"edit\":{\"label\":\"articles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"articles\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"header\",\"articles\"],\"edit\":[[{\"name\":\"header\",\"size\":12}],[{\"name\":\"articles\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(22, "plugin_content_manager_configuration_components::blocks.about-me", "{\"uid\":\"blocks.about-me\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"bio\":{\"edit\":{\"label\":\"bio\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"bio\",\"searchable\":false,\"sortable\":false}},\"stack\":{\"edit\":{\"label\":\"stack\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"stack\",\"searchable\":false,\"sortable\":false}},\"widgets\":{\"edit\":{\"label\":\"widgets\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"widgets\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"bio\",\"stack\",\"widgets\"],\"edit\":[[{\"name\":\"bio\",\"size\":12}],[{\"name\":\"stack\",\"size\":12}],[{\"name\":\"widgets\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(23, "plugin_content_manager_configuration_components::blocks.featured-projects", "{\"uid\":\"blocks.featured-projects\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"header\":{\"edit\":{\"label\":\"header\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"header\",\"searchable\":false,\"sortable\":false}},\"projects\":{\"edit\":{\"label\":\"projects\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"projects\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"header\",\"projects\"],\"edit\":[[{\"name\":\"header\",\"size\":12}],[{\"name\":\"projects\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(24, "plugin_content_manager_configuration_components::blocks.faq", "{\"uid\":\"blocks.faq\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"theme\":{\"edit\":{\"label\":\"theme\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"theme\",\"searchable\":true,\"sortable\":true}},\"faq\":{\"edit\":{\"label\":\"faq\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"faq\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"title\",\"theme\",\"faq\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"theme\",\"size\":6}],[{\"name\":\"faq\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(25, "plugin_content_manager_configuration_components::blocks.hero", "{\"uid\":\"blocks.hero\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"text\",\"defaultSortBy\":\"text\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"images\":{\"edit\":{\"label\":\"images\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"images\",\"searchable\":false,\"sortable\":false}},\"header\":{\"edit\":{\"label\":\"header\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"header\",\"searchable\":false,\"sortable\":false}},\"text\":{\"edit\":{\"label\":\"text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"text\",\"searchable\":true,\"sortable\":true}},\"buttons\":{\"edit\":{\"label\":\"buttons\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"buttons\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"images\",\"header\",\"text\"],\"edit\":[[{\"name\":\"images\",\"size\":6}],[{\"name\":\"header\",\"size\":12}],[{\"name\":\"text\",\"size\":6}],[{\"name\":\"buttons\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(26, "plugin_content_manager_configuration_components::blocks.latest-code", "{\"uid\":\"blocks.latest-code\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"header\":{\"edit\":{\"label\":\"header\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"header\",\"searchable\":false,\"sortable\":false}},\"text\":{\"edit\":{\"label\":\"text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"text\",\"searchable\":true,\"sortable\":true}},\"theme\":{\"edit\":{\"label\":\"theme\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"theme\",\"searchable\":true,\"sortable\":true}},\"image\":{\"edit\":{\"label\":\"image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"image\",\"searchable\":false,\"sortable\":false}},\"featuresCheck\":{\"edit\":{\"label\":\"featuresCheck\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"featuresCheck\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"header\",\"text\",\"theme\"],\"edit\":[[{\"name\":\"header\",\"size\":12}],[{\"name\":\"text\",\"size\":6},{\"name\":\"theme\",\"size\":6}],[{\"name\":\"image\",\"size\":6}],[{\"name\":\"featuresCheck\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(27, "plugin_content_manager_configuration_components::blocks.page-title", "{\"uid\":\"blocks.page-title\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"theme\":{\"edit\":{\"label\":\"theme\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"theme\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"text\":{\"edit\":{\"label\":\"text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"text\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"theme\",\"title\",\"text\"],\"edit\":[[{\"name\":\"theme\",\"size\":6},{\"name\":\"title\",\"size\":6}],[{\"name\":\"text\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(28, "plugin_content_manager_configuration_components::modules.article", "{\"uid\":\"modules.article\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"header\":{\"edit\":{\"label\":\"header\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"header\",\"searchable\":false,\"sortable\":false}},\"image\":{\"edit\":{\"label\":\"image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"image\",\"searchable\":false,\"sortable\":false}},\"content\":{\"edit\":{\"label\":\"content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"content\",\"searchable\":false,\"sortable\":false}},\"related\":{\"edit\":{\"label\":\"related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"related\",\"searchable\":false,\"sortable\":false}},\"category\":{\"edit\":{\"label\":\"category\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"category\",\"searchable\":true,\"sortable\":true}},\"editors\":{\"edit\":{\"label\":\"editors\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"editors\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"header\",\"image\",\"content\"],\"edit\":[[{\"name\":\"header\",\"size\":12}],[{\"name\":\"image\",\"size\":6}],[{\"name\":\"content\",\"size\":12}],[{\"name\":\"related\",\"size\":12}],[{\"name\":\"category\",\"size\":6},{\"name\":\"editors\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(29, "plugin_content_manager_configuration_components::blocks.cta", "{\"uid\":\"blocks.cta\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"theme\":{\"edit\":{\"label\":\"theme\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"theme\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"text\":{\"edit\":{\"label\":\"text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"text\",\"searchable\":true,\"sortable\":true}},\"commandLine\":{\"edit\":{\"label\":\"commandLine\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"commandLine\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"theme\",\"title\",\"text\"],\"edit\":[[{\"name\":\"theme\",\"size\":6},{\"name\":\"title\",\"size\":6}],[{\"name\":\"text\",\"size\":6},{\"name\":\"commandLine\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(30, "plugin_content_manager_configuration_components::global.navigation", "{\"uid\":\"global.navigation\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"links\":{\"edit\":{\"label\":\"links\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"links\",\"searchable\":false,\"sortable\":false}},\"logo\":{\"edit\":{\"label\":\"logo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"logo\",\"searchable\":false,\"sortable\":false}},\"leftButton\":{\"edit\":{\"label\":\"leftButton\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"leftButton\",\"searchable\":false,\"sortable\":false}},\"rightButton\":{\"edit\":{\"label\":\"rightButton\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"rightButton\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"links\",\"logo\",\"leftButton\"],\"edit\":[[{\"name\":\"links\",\"size\":12}],[{\"name\":\"logo\",\"size\":6}],[{\"name\":\"leftButton\",\"size\":12}],[{\"name\":\"rightButton\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(31, "plugin_content_manager_configuration_components::product.information", "{\"uid\":\"product.information\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"opening_hours\":{\"edit\":{\"label\":\"opening_hours\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"opening_hours\",\"searchable\":false,\"sortable\":false}},\"location\":{\"edit\":{\"label\":\"location\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"location\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"description\",\"opening_hours\",\"location\"],\"edit\":[[{\"name\":\"description\",\"size\":6}],[{\"name\":\"opening_hours\",\"size\":12}],[{\"name\":\"location\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(32, "plugin_content_manager_configuration_components::blocks.pricing", "{\"uid\":\"blocks.pricing\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"header\":{\"edit\":{\"label\":\"header\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"header\",\"searchable\":false,\"sortable\":false}},\"pricingCards\":{\"edit\":{\"label\":\"pricingCards\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"pricingCards\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"header\",\"pricingCards\"],\"edit\":[[{\"name\":\"header\",\"size\":12}],[{\"name\":\"pricingCards\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(33, "plugin_content_manager_configuration_components::modules.articles", "{\"uid\":\"modules.articles\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"header\":{\"edit\":{\"label\":\"header\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"header\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"header\"],\"edit\":[[{\"name\":\"header\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(34, "plugin_content_manager_configuration_components::modules.project", "{\"uid\":\"modules.project\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"header\":{\"edit\":{\"label\":\"header\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"header\",\"searchable\":false,\"sortable\":false}},\"image\":{\"edit\":{\"label\":\"image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"image\",\"searchable\":false,\"sortable\":false}},\"content\":{\"edit\":{\"label\":\"content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"content\",\"searchable\":false,\"sortable\":false}},\"category\":{\"edit\":{\"label\":\"category\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"category\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"header\",\"image\",\"content\"],\"edit\":[[{\"name\":\"header\",\"size\":12}],[{\"name\":\"image\",\"size\":6}],[{\"name\":\"content\",\"size\":12}],[{\"name\":\"category\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(35, "plugin_content_manager_configuration_components::blocks.testimonial", "{\"uid\":\"blocks.testimonial\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"theme\":{\"edit\":{\"label\":\"theme\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"theme\",\"searchable\":true,\"sortable\":true}},\"text\":{\"edit\":{\"label\":\"text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"text\",\"searchable\":true,\"sortable\":true}},\"author\":{\"edit\":{\"label\":\"author\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"author\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"theme\",\"text\",\"author\"],\"edit\":[[{\"name\":\"theme\",\"size\":6},{\"name\":\"text\",\"size\":6}],[{\"name\":\"author\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(36, "plugin_content_manager_configuration_components::modules.product", "{\"uid\":\"modules.product\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"category\":{\"edit\":{\"label\":\"category\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"category\",\"searchable\":true,\"sortable\":true}},\"tag\":{\"edit\":{\"label\":\"tag\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"tag\",\"searchable\":true,\"sortable\":true}},\"images\":{\"edit\":{\"label\":\"images\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"images\",\"searchable\":false,\"sortable\":false}},\"content\":{\"edit\":{\"label\":\"content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"content\",\"searchable\":false,\"sortable\":false}},\"reviews\":{\"edit\":{\"label\":\"reviews\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"reviews\",\"searchable\":false,\"sortable\":false}},\"related\":{\"edit\":{\"label\":\"related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"related\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"name\",\"category\",\"tag\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"category\",\"size\":6}],[{\"name\":\"tag\",\"size\":6},{\"name\":\"images\",\"size\":6}],[{\"name\":\"content\",\"size\":12}],[{\"name\":\"reviews\",\"size\":12}],[{\"name\":\"related\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(37, "plugin_content_manager_configuration_components::product.product-reviews", "{\"uid\":\"product.product-reviews\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"reviews\":{\"edit\":{\"label\":\"reviews\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"reviews\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"reviews\"],\"edit\":[[{\"name\":\"reviews\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(38, "plugin_content_manager_configuration_components::product.location", "{\"uid\":\"product.location\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"address\",\"defaultSortBy\":\"address\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"address\":{\"edit\":{\"label\":\"address\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"address\",\"searchable\":true,\"sortable\":true}},\"website\":{\"edit\":{\"label\":\"website\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"website\",\"searchable\":true,\"sortable\":true}},\"phone\":{\"edit\":{\"label\":\"phone\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"phone\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"address\",\"website\",\"phone\"],\"edit\":[[{\"name\":\"address\",\"size\":6},{\"name\":\"website\",\"size\":6}],[{\"name\":\"phone\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(39, "plugin_content_manager_configuration_components::product.opening-hours", "{\"uid\":\"product.opening-hours\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"day_interval\",\"defaultSortBy\":\"day_interval\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"day_interval\":{\"edit\":{\"label\":\"day_interval\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"day_interval\",\"searchable\":true,\"sortable\":true}},\"opening_hour\":{\"edit\":{\"label\":\"opening_hour\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"opening_hour\",\"searchable\":true,\"sortable\":true}},\"closing_hour\":{\"edit\":{\"label\":\"closing_hour\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"closing_hour\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"day_interval\",\"opening_hour\",\"closing_hour\"],\"edit\":[[{\"name\":\"day_interval\",\"size\":6},{\"name\":\"opening_hour\",\"size\":6}],[{\"name\":\"closing_hour\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(40, "plugin_content_manager_configuration_components::blocks.team", "{\"uid\":\"blocks.team\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"header\":{\"edit\":{\"label\":\"header\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"header\",\"searchable\":false,\"sortable\":false}},\"members\":{\"edit\":{\"label\":\"members\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"members\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"header\",\"members\"],\"edit\":[[{\"name\":\"header\",\"size\":12}],[{\"name\":\"members\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(41, "plugin_content_manager_configuration_components::global.footer", "{\"uid\":\"global.footer\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"label\",\"defaultSortBy\":\"label\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"footerColumns\":{\"edit\":{\"label\":\"footerColumns\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"footerColumns\",\"searchable\":false,\"sortable\":false}},\"socialNetworks\":{\"edit\":{\"label\":\"socialNetworks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"socialNetworks\",\"searchable\":false,\"sortable\":false}},\"button\":{\"edit\":{\"label\":\"button\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"button\",\"searchable\":false,\"sortable\":false}},\"label\":{\"edit\":{\"label\":\"label\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"label\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"footerColumns\",\"socialNetworks\",\"button\"],\"edit\":[[{\"name\":\"footerColumns\",\"size\":12}],[{\"name\":\"socialNetworks\",\"size\":12}],[{\"name\":\"button\",\"size\":12}],[{\"name\":\"label\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(42, "plugin_content_manager_configuration_components::project.project-content", "{\"uid\":\"project.project-content\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"content\":{\"edit\":{\"label\":\"content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"content\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\"],\"edit\":[[{\"name\":\"content\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(43, "plugin_content_manager_configuration_components::modules.projects", "{\"uid\":\"modules.projects\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"header\":{\"edit\":{\"label\":\"header\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"header\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"header\"],\"edit\":[[{\"name\":\"header\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(44, "plugin_content_manager_configuration_components::product.rich-content", "{\"uid\":\"product.rich-content\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"content\":{\"edit\":{\"label\":\"content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"content\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\"],\"edit\":[[{\"name\":\"content\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(45, "plugin_content_manager_configuration_components::modules.products", "{\"uid\":\"modules.products\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"header\":{\"edit\":{\"label\":\"header\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"header\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"header\"],\"edit\":[[{\"name\":\"header\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(46, "plugin_content_manager_configuration_components::project.project-card", "{\"uid\":\"project.project-card\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"image\":{\"edit\":{\"label\":\"image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"image\",\"searchable\":false,\"sortable\":false}},\"text\":{\"edit\":{\"label\":\"text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"text\",\"searchable\":true,\"sortable\":true}},\"label\":{\"edit\":{\"label\":\"label\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"label\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"slug\",\"image\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"slug\",\"size\":6}],[{\"name\":\"image\",\"size\":6},{\"name\":\"text\",\"size\":6}],[{\"name\":\"label\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(47, "plugin_content_manager_configuration_components::product.related-products", "{\"uid\":\"product.related-products\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"header\":{\"edit\":{\"label\":\"header\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"header\",\"searchable\":false,\"sortable\":false}},\"shop\":{\"edit\":{\"label\":\"shop\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"shop\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"header\",\"shop\"],\"edit\":[[{\"name\":\"header\",\"size\":12}],[{\"name\":\"shop\",\"size\":6}]]},\"isComponent\":true}", "object", NULL, NULL),
	(48, "plugin_content_manager_configuration_components::product.product-content", "{\"uid\":\"product.product-content\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"information\":{\"edit\":{\"label\":\"information\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"information\",\"searchable\":false,\"sortable\":false}},\"price\":{\"edit\":{\"label\":\"price\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"price\",\"searchable\":true,\"sortable\":true}},\"socialNetworks\":{\"edit\":{\"label\":\"socialNetworks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"socialNetworks\",\"searchable\":false,\"sortable\":false}},\"richContent\":{\"edit\":{\"label\":\"richContent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"richContent\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"information\",\"price\",\"socialNetworks\"],\"edit\":[[{\"name\":\"information\",\"size\":12}],[{\"name\":\"price\",\"size\":6}],[{\"name\":\"socialNetworks\",\"size\":12}],[{\"name\":\"richContent\",\"size\":12}]]},\"isComponent\":true}", "object", NULL, NULL),
	(49, "plugin_content_manager_configuration_content_types::plugin::users-permissions.role", "{\"uid\":\"plugin::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"users\",\"size\":6}]]}}", "object", NULL, NULL),
	(50, "plugin_content_manager_configuration_content_types::admin::permission", "{\"uid\":\"admin::permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"subject\":{\"edit\":{\"label\":\"subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"subject\",\"searchable\":true,\"sortable\":true}},\"properties\":{\"edit\":{\"label\":\"properties\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"properties\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"subject\",\"size\":6}],[{\"name\":\"properties\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}],[{\"name\":\"role\",\"size\":6}]]}}", "object", NULL, NULL),
	(51, "plugin_content_manager_configuration_content_types::plugin::users-permissions.permission", "{\"uid\":\"plugin::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"role\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"role\",\"size\":6}]]}}", "object", NULL, NULL),
	(52, "plugin_content_manager_configuration_content_types::plugin::upload.file", "{\"uid\":\"plugin::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"alternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"alternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"previewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"previewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider_metadata\",\"searchable\":false,\"sortable\":false}},\"folder\":{\"edit\":{\"label\":\"folder\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"folder\",\"searchable\":true,\"sortable\":true}},\"folderPath\":{\"edit\":{\"label\":\"folderPath\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"folderPath\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}],[{\"name\":\"folder\",\"size\":6},{\"name\":\"folderPath\",\"size\":6}]]}}", "object", NULL, NULL),
	(53, "plugin_content_manager_configuration_content_types::plugin::i18n.locale", "{\"uid\":\"plugin::i18n.locale\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"createdAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}]]}}", "object", NULL, NULL),
	(54, "plugin_content_manager_configuration_content_types::admin::api-token-permission", "{\"uid\":\"admin::api-token-permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]}}", "object", NULL, NULL),
	(55, "plugin_content_manager_configuration_content_types::admin::user", "{\"uid\":\"admin::user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"registrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"registrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"isActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"preferedLanguage\":{\"edit\":{\"label\":\"preferedLanguage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"preferedLanguage\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"registrationToken\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"roles\",\"size\":6},{\"name\":\"blocked\",\"size\":4}],[{\"name\":\"preferedLanguage\",\"size\":6}]]}}", "object", NULL, NULL),
	(56, "plugin_content_manager_configuration_content_types::api::blog.blog", "{\"uid\":\"api::blog.blog\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"slug\",\"defaultSortBy\":\"slug\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"categoryText\":{\"edit\":{\"label\":\"categoryText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"categoryText\",\"searchable\":true,\"sortable\":true}},\"perPage\":{\"edit\":{\"label\":\"perPage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"perPage\",\"searchable\":true,\"sortable\":true}},\"main\":{\"edit\":{\"label\":\"main\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"main\",\"searchable\":false,\"sortable\":false}},\"blocks\":{\"edit\":{\"label\":\"blocks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocks\",\"searchable\":false,\"sortable\":false}},\"seo\":{\"edit\":{\"label\":\"seo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"seo\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"slug\",\"categoryText\",\"perPage\"],\"edit\":[[{\"name\":\"slug\",\"size\":6},{\"name\":\"categoryText\",\"size\":6}],[{\"name\":\"perPage\",\"size\":4}],[{\"name\":\"main\",\"size\":12}],[{\"name\":\"blocks\",\"size\":12}],[{\"name\":\"seo\",\"size\":12}]]}}", "object", NULL, NULL),
	(57, "plugin_content_manager_configuration_content_types::api::article.article", "{\"uid\":\"api::article.article\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"publicationState\":{\"edit\":{\"label\":\"publicationState\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"publicationState\",\"searchable\":true,\"sortable\":true}},\"publicationStages\":{\"edit\":{\"label\":\"publicationStages\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"publicationStages\",\"searchable\":false,\"sortable\":false}},\"main\":{\"edit\":{\"label\":\"main\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"main\",\"searchable\":false,\"sortable\":false}},\"blocks\":{\"edit\":{\"label\":\"blocks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocks\",\"searchable\":false,\"sortable\":false}},\"seo\":{\"edit\":{\"label\":\"seo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"seo\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"slug\",\"publicationState\",\"seo\"],\"edit\":[[{\"name\":\"slug\",\"size\":6},{\"name\":\"publicationState\",\"size\":6}],[{\"name\":\"publicationStages\",\"size\":12}],[{\"name\":\"main\",\"size\":12}],[{\"name\":\"blocks\",\"size\":12}],[{\"name\":\"seo\",\"size\":12}]]}}", "object", NULL, NULL),
	(58, "plugin_content_manager_configuration_content_types::api::category.category", "{\"uid\":\"api::category.category\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"products\":{\"edit\":{\"label\":\"products\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"products\",\"searchable\":false,\"sortable\":false}},\"articles\":{\"edit\":{\"label\":\"articles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"articles\",\"searchable\":false,\"sortable\":false}},\"projects\":{\"edit\":{\"label\":\"projects\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"projects\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"slug\",\"products\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"slug\",\"size\":6}],[{\"name\":\"products\",\"size\":6},{\"name\":\"articles\",\"size\":6}],[{\"name\":\"projects\",\"size\":6}]]}}", "object", NULL, NULL),
	(59, "plugin_content_manager_configuration_content_types::admin::role", "{\"uid\":\"admin::role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6},{\"name\":\"users\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6}]]}}", "object", NULL, NULL),
	(60, "plugin_content_manager_configuration_content_types::plugin::users-permissions.user", "{\"uid\":\"plugin::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"confirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"confirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"reviews\":{\"edit\":{\"label\":\"reviews\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"reviews\",\"searchable\":false,\"sortable\":false}},\"articles\":{\"edit\":{\"label\":\"articles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"articles\",\"searchable\":false,\"sortable\":false}},\"picture\":{\"edit\":{\"label\":\"picture\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"picture\",\"searchable\":false,\"sortable\":false}},\"job\":{\"edit\":{\"label\":\"job\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"job\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"role\",\"size\":6}],[{\"name\":\"reviews\",\"size\":6},{\"name\":\"articles\",\"size\":6}],[{\"name\":\"picture\",\"size\":6},{\"name\":\"job\",\"size\":6}]]}}", "object", NULL, NULL),
	(61, "plugin_content_manager_configuration_content_types::plugin::scheduler.scheduler", "{\"uid\":\"plugin::scheduler.scheduler\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"uid\",\"defaultSortBy\":\"uid\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"scheduledDatetime\":{\"edit\":{\"label\":\"scheduledDatetime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"scheduledDatetime\",\"searchable\":true,\"sortable\":true}},\"uid\":{\"edit\":{\"label\":\"uid\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"uid\",\"searchable\":true,\"sortable\":true}},\"contentId\":{\"edit\":{\"label\":\"contentId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"contentId\",\"searchable\":true,\"sortable\":true}},\"scheduleType\":{\"edit\":{\"label\":\"scheduleType\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"scheduleType\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"scheduledDatetime\",\"uid\",\"contentId\"],\"edit\":[[{\"name\":\"scheduledDatetime\",\"size\":6},{\"name\":\"uid\",\"size\":6}],[{\"name\":\"contentId\",\"size\":4},{\"name\":\"scheduleType\",\"size\":6}]]}}", "object", NULL, NULL),
	(62, "plugin_content_manager_configuration_content_types::plugin::todo.task", "{\"uid\":\"plugin::todo.task\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"isDone\":{\"edit\":{\"label\":\"isDone\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isDone\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"isDone\",\"createdAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"isDone\",\"size\":4}]]}}", "object", NULL, NULL),
	(63, "plugin_content_manager_configuration_content_types::admin::api-token", "{\"uid\":\"admin::api-token\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"accessKey\",\"size\":6}],[{\"name\":\"lastUsedAt\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"expiresAt\",\"size\":6},{\"name\":\"lifespan\",\"size\":4}]]}}", "object", NULL, NULL),
	(64, "plugin_content_manager_configuration_content_types::plugin::upload.folder", "{\"uid\":\"plugin::upload.folder\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"pathId\":{\"edit\":{\"label\":\"pathId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"pathId\",\"searchable\":true,\"sortable\":true}},\"parent\":{\"edit\":{\"label\":\"parent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"parent\",\"searchable\":true,\"sortable\":true}},\"children\":{\"edit\":{\"label\":\"children\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"children\",\"searchable\":false,\"sortable\":false}},\"files\":{\"edit\":{\"label\":\"files\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"files\",\"searchable\":false,\"sortable\":false}},\"path\":{\"edit\":{\"label\":\"path\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"path\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"pathId\",\"parent\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"pathId\",\"size\":4}],[{\"name\":\"parent\",\"size\":6},{\"name\":\"children\",\"size\":6}],[{\"name\":\"files\",\"size\":6},{\"name\":\"path\",\"size\":6}]]}}", "object", NULL, NULL),
	(65, "plugin_content_manager_configuration_content_types::api::cookie-category.cookie-category", "{\"uid\":\"api::cookie-category.cookie-category\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"cookies\":{\"edit\":{\"label\":\"cookies\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"cookies\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"cookies\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"cookies\",\"size\":6}]]}}", "object", NULL, NULL),
	(66, "plugin_content_manager_configuration_content_types::api::global.global", "{\"uid\":\"api::global.global\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"navigation\":{\"edit\":{\"label\":\"navigation\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"navigation\",\"searchable\":false,\"sortable\":false}},\"footer\":{\"edit\":{\"label\":\"footer\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"footer\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"navigation\",\"footer\",\"createdAt\"],\"edit\":[[{\"name\":\"navigation\",\"size\":12}],[{\"name\":\"footer\",\"size\":12}]]}}", "object", NULL, NULL),
	(67, "plugin_content_manager_configuration_content_types::api::project.project", "{\"uid\":\"api::project.project\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"main\":{\"edit\":{\"label\":\"main\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"main\",\"searchable\":false,\"sortable\":false}},\"blocks\":{\"edit\":{\"label\":\"blocks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocks\",\"searchable\":false,\"sortable\":false}},\"seo\":{\"edit\":{\"label\":\"seo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"seo\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"slug\",\"seo\",\"createdAt\"],\"edit\":[[{\"name\":\"slug\",\"size\":6}],[{\"name\":\"main\",\"size\":12}],[{\"name\":\"blocks\",\"size\":12}],[{\"name\":\"seo\",\"size\":12}]]}}", "object", NULL, NULL),
	(68, "plugin_content_manager_configuration_content_types::api::review.review", "{\"uid\":\"api::review.review\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"content\":{\"edit\":{\"label\":\"content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"content\",\"searchable\":true,\"sortable\":true}},\"note\":{\"edit\":{\"label\":\"note\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"note\",\"searchable\":true,\"sortable\":true}},\"author\":{\"edit\":{\"label\":\"author\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"author\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"content\",\"note\",\"author\"],\"edit\":[[{\"name\":\"content\",\"size\":6},{\"name\":\"note\",\"size\":4}],[{\"name\":\"author\",\"size\":6}]]}}", "object", NULL, NULL),
	(69, "plugin_content_manager_configuration_content_types::api::product.product", "{\"uid\":\"api::product.product\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"main\":{\"edit\":{\"label\":\"main\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"main\",\"searchable\":false,\"sortable\":false}},\"blocks\":{\"edit\":{\"label\":\"blocks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocks\",\"searchable\":false,\"sortable\":false}},\"seo\":{\"edit\":{\"label\":\"seo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"seo\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"slug\",\"seo\",\"createdAt\"],\"edit\":[[{\"name\":\"slug\",\"size\":6}],[{\"name\":\"main\",\"size\":12}],[{\"name\":\"blocks\",\"size\":12}],[{\"name\":\"seo\",\"size\":12}]]}}", "object", NULL, NULL),
	(70, "plugin_content_manager_configuration_content_types::api::work.work", "{\"uid\":\"api::work.work\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"slug\",\"defaultSortBy\":\"slug\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"perPage\":{\"edit\":{\"label\":\"perPage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"perPage\",\"searchable\":true,\"sortable\":true}},\"main\":{\"edit\":{\"label\":\"main\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"main\",\"searchable\":false,\"sortable\":false}},\"blocks\":{\"edit\":{\"label\":\"blocks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocks\",\"searchable\":false,\"sortable\":false}},\"seo\":{\"edit\":{\"label\":\"seo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"seo\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"slug\",\"perPage\",\"seo\"],\"edit\":[[{\"name\":\"slug\",\"size\":6},{\"name\":\"perPage\",\"size\":4}],[{\"name\":\"main\",\"size\":12}],[{\"name\":\"blocks\",\"size\":12}],[{\"name\":\"seo\",\"size\":12}]]}}", "object", NULL, NULL),
	(71, "plugin_content_manager_configuration_content_types::api::cookie.cookie", "{\"uid\":\"api::cookie.cookie\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"host\":{\"edit\":{\"label\":\"host\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"host\",\"searchable\":true,\"sortable\":true}},\"category\":{\"edit\":{\"label\":\"category\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"category\",\"searchable\":true,\"sortable\":true}},\"party\":{\"edit\":{\"label\":\"party\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"party\",\"searchable\":true,\"sortable\":true}},\"isVisible\":{\"edit\":{\"label\":\"isVisible\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isVisible\",\"searchable\":true,\"sortable\":true}},\"duration\":{\"edit\":{\"label\":\"duration\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"duration\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"host\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"host\",\"size\":6},{\"name\":\"category\",\"size\":6}],[{\"name\":\"party\",\"size\":6},{\"name\":\"isVisible\",\"size\":4}],[{\"name\":\"duration\",\"size\":12}]]}}", "object", NULL, NULL),
	(72, "plugin_content_manager_configuration_content_types::api::page.page", "{\"uid\":\"api::page.page\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"blocks\":{\"edit\":{\"label\":\"blocks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocks\",\"searchable\":false,\"sortable\":false}},\"seo\":{\"edit\":{\"label\":\"seo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"seo\",\"searchable\":false,\"sortable\":false}},\"editors\":{\"edit\":{\"label\":\"editors\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"editors\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"slug\",\"seo\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"slug\",\"size\":6}],[{\"name\":\"blocks\",\"size\":12}],[{\"name\":\"seo\",\"size\":12}],[{\"name\":\"editors\",\"size\":6}]]}}", "object", NULL, NULL),
	(73, "plugin_content_manager_configuration_content_types::api::shop.shop", "{\"uid\":\"api::shop.shop\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"slug\",\"defaultSortBy\":\"slug\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"categoryText\":{\"edit\":{\"label\":\"categoryText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"categoryText\",\"searchable\":true,\"sortable\":true}},\"TagText\":{\"edit\":{\"label\":\"TagText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"TagText\",\"searchable\":true,\"sortable\":true}},\"perPage\":{\"edit\":{\"label\":\"perPage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"perPage\",\"searchable\":true,\"sortable\":true}},\"main\":{\"edit\":{\"label\":\"main\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"main\",\"searchable\":false,\"sortable\":false}},\"blocks\":{\"edit\":{\"label\":\"blocks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocks\",\"searchable\":false,\"sortable\":false}},\"seo\":{\"edit\":{\"label\":\"seo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"seo\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"slug\",\"categoryText\",\"TagText\"],\"edit\":[[{\"name\":\"slug\",\"size\":6},{\"name\":\"categoryText\",\"size\":6}],[{\"name\":\"TagText\",\"size\":6},{\"name\":\"perPage\",\"size\":4}],[{\"name\":\"main\",\"size\":12}],[{\"name\":\"blocks\",\"size\":12}],[{\"name\":\"seo\",\"size\":12}]]}}", "object", NULL, NULL),
	(74, "plugin_content_manager_configuration_content_types::api::tag.tag", "{\"uid\":\"api::tag.tag\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"products\":{\"edit\":{\"label\":\"products\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"products\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"products\",\"createdAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"products\",\"size\":6}]]}}", "object", NULL, NULL),
	(75, "plugin_upload_settings", "{\"sizeOptimization\":true,\"responsiveDimensions\":true,\"autoOrientation\":false}", "object", NULL, NULL),
	(76, "plugin_upload_view_configuration", "{\"pageSize\":10,\"sort\":\"createdAt:DESC\"}", "object", NULL, NULL),
	(77, "plugin_upload_metrics", "{\"weeklySchedule\":\"8 46 17 * * 2\",\"lastWeeklyUpdate\":1679420681072}", "object", NULL, NULL),
	(78, "plugin_i18n_default_locale", "\"en\"", "string", NULL, NULL),
	(79, "plugin_users-permissions_grant", "{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"api/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"enabled\":false,\"icon\":\"reddit\",\"key\":\"\",\"secret\":\"\",\"state\":true,\"callback\":\"api/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"api/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]},\"cas\":{\"enabled\":false,\"icon\":\"book\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/cas/callback\",\"scope\":[\"openid email\"],\"subdomain\":\"my.subdomain.com/cas\"},\"patreon\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/patreon/callback\",\"scope\":[\"identity\",\"identity[email]\"]}}", "object", NULL, NULL),
	(80, "plugin_users-permissions_email", "{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}", "object", NULL, NULL),
	(81, "plugin_users-permissions_advanced", "{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":null,\"default_role\":\"authenticated\"}", "object", NULL, NULL),
	(82, "plugin_sitemap_settings", "{\"hostname\":\"\",\"includeHomepage\":true,\"excludeDrafts\":true,\"hostname_overrides\":{},\"contentTypes\":{},\"customEntries\":{}}", "object", NULL, NULL),
	(83, "core_admin_auth", "{\"providers\":{\"autoRegister\":false,\"defaultRole\":null}}", "object", NULL, NULL),
	(84, "plugin_content_manager_configuration_content_types::api::cookie-popup.cookie-popup", "{\"uid\":\"api::cookie-popup.cookie-popup\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"createdAt\",\"updatedAt\"],\"edit\":[[{\"name\":\"title\",\"size\":6}],[{\"name\":\"description\",\"size\":12}]]}}", "object", NULL, NULL);

/*!40000 ALTER TABLE `strapi_core_store_settings` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table strapi_database_schema
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strapi_database_schema`;

CREATE TABLE `strapi_database_schema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`schema`)),
  `time` datetime DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `strapi_database_schema` WRITE;
/*!40000 ALTER TABLE `strapi_database_schema` DISABLE KEYS */;

INSERT INTO `strapi_database_schema` (`id`, `schema`, `time`, `hash`) VALUES
	(3, "{\"tables\":[{\"name\":\"strapi_core_store_settings\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"value\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"environment\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"tag\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_webhooks\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"url\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"headers\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"events\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"enabled\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_ee_store_settings\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"value\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"admin_permissions\",\"indexes\":[{\"name\":\"admin_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"subject\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"properties\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"conditions\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_users\",\"indexes\":[{\"name\":\"admin_users_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_users_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"firstname\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"lastname\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"username\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"email\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"password\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"reset_password_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"registration_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"is_active\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"blocked\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"prefered_language\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_roles\",\"indexes\":[{\"name\":\"admin_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"code\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_api_tokens\",\"indexes\":[{\"name\":\"strapi_api_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_api_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_api_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_api_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"access_key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"last_used_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"expires_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"lifespan\",\"type\":\"bigInteger\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_api_token_permissions\",\"indexes\":[{\"name\":\"strapi_api_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_api_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_api_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_api_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"files\",\"indexes\":[{\"name\":\"upload_files_folder_path_index\",\"columns\":[\"folder_path\"],\"type\":null},{\"name\":\"upload_files_created_at_index\",\"columns\":[\"created_at\"],\"type\":null},{\"name\":\"upload_files_updated_at_index\",\"columns\":[\"updated_at\"],\"type\":null},{\"name\":\"upload_files_name_index\",\"columns\":[\"name\"],\"type\":null},{\"name\":\"upload_files_size_index\",\"columns\":[\"size\"],\"type\":null},{\"name\":\"upload_files_ext_index\",\"columns\":[\"ext\"],\"type\":null},{\"name\":\"files_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"files_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"files_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"files_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"alternative_text\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"caption\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"width\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"height\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"formats\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"hash\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"ext\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"mime\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"size\",\"type\":\"decimal\",\"args\":[10,2],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"url\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"preview_url\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider_metadata\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"folder_path\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"upload_folders\",\"indexes\":[{\"name\":\"upload_folders_path_id_index\",\"columns\":[\"path_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_path_index\",\"columns\":[\"path\"],\"type\":\"unique\"},{\"name\":\"upload_folders_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"upload_folders_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"upload_folders_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"upload_folders_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"path_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"path\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"scheduler_scheduler\",\"indexes\":[{\"name\":\"scheduler_scheduler_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"scheduler_scheduler_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"scheduler_scheduler_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"scheduler_scheduler_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"scheduled_datetime\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"uid\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"content_id\",\"type\":\"bigInteger\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"schedule_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"i18n_locale\",\"indexes\":[{\"name\":\"i18n_locale_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"i18n_locale_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"i18n_locale_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"i18n_locale_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"code\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_permissions\",\"indexes\":[{\"name\":\"up_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_roles\",\"indexes\":[{\"name\":\"up_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_users\",\"indexes\":[{\"name\":\"up_users_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_users_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"username\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"email\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"password\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"reset_password_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"confirmation_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"confirmed\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"blocked\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"job\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"todo_task\",\"indexes\":[{\"name\":\"todo_task_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"todo_task_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"todo_task_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"todo_task_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"is_done\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"target_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"target_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"article\",\"indexes\":[{\"type\":\"unique\",\"name\":\"article_slug_unique\",\"columns\":[\"slug\"]},{\"name\":\"article_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"article_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"article_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"article_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"slug\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false,\"unique\":true},{\"name\":\"publication_state\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"publication_stages\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"blog\",\"indexes\":[{\"name\":\"blog_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"blog_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"blog_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"blog_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"slug\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"category_text\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"per_page\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"categories\",\"indexes\":[{\"type\":\"unique\",\"name\":\"categories_slug_unique\",\"columns\":[\"slug\"]},{\"name\":\"categories_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"categories_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"categories_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"categories_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"slug\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false,\"unique\":true},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"cookies\",\"indexes\":[{\"name\":\"cookies_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"cookies_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"cookies_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"cookies_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"host\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"party\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"is_visible\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"duration\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"cookie_categories\",\"indexes\":[{\"name\":\"cookie_categories_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"cookie_categories_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"cookie_categories_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"cookie_categories_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"cookie_popups\",\"indexes\":[{\"name\":\"cookie_popups_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"cookie_popups_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"cookie_popups_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"cookie_popups_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"globals\",\"indexes\":[{\"name\":\"globals_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"globals_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"globals_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"globals_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"pages\",\"indexes\":[{\"name\":\"pages_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"pages_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"pages_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"pages_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"slug\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"product\",\"indexes\":[{\"type\":\"unique\",\"name\":\"product_slug_unique\",\"columns\":[\"slug\"]},{\"name\":\"product_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"product_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"product_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"product_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"slug\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false,\"unique\":true},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"project\",\"indexes\":[{\"type\":\"unique\",\"name\":\"project_slug_unique\",\"columns\":[\"slug\"]},{\"name\":\"project_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"project_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"project_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"project_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"slug\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false,\"unique\":true},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"reviews\",\"indexes\":[{\"name\":\"reviews_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"reviews_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"reviews_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"reviews_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"content\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"note\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"shop\",\"indexes\":[{\"name\":\"shop_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"shop_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"shop_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"shop_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"slug\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"category_text\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"tag_text\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"per_page\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"tags\",\"indexes\":[{\"name\":\"tags_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"tags_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"tags_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"tags_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"work\",\"indexes\":[{\"name\":\"work_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"work_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"work_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"work_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"slug\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"per_page\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"sitemap_exclude\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_bio\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"headline\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"text\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_buttons\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"theme\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_cards\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"text\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_comments\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"content\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_features_checks\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"text\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_footer_columns\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"label\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_headers\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"theme\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"subtitle\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"text\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_links\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"href\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"label\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"target\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"is_external\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_meta_socials\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"social_network\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_perks\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"included\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_pricing_cards\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"price\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_publications\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"publish_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"ready\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_question_answers\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"question\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"answer\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_seos\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"meta_title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"meta_description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"keywords\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"meta_robots\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"structured_data\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"meta_viewport\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"canonical_url\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_social_network\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"url\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_team_cards\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"fullname\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"job\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___tech_stack\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_widget\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"text\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_article_article_content\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"content\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_article_related_articles\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false}]},{\"name\":\"components_blocks_about_me\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false}]},{\"name\":\"components_blocks_cta\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"theme\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"text\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"command_line\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components___lib_faqs\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"theme\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_blocks_featured_projects\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false}]},{\"name\":\"components_slices_heroes\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"text\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_blocks_latest_code\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"text\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"theme\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_blocks_page_title\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"theme\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"text\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_slices_pricings\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false}]},{\"name\":\"components_slices_teams\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false}]},{\"name\":\"components___lib_testimonials\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"theme\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"text\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_global_footers\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"label\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_global_navigations\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false}]},{\"name\":\"components_modules_article\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false}]},{\"name\":\"components_modules_articles\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false}]},{\"name\":\"components_modules_product\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_modules_products\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false}]},{\"name\":\"components_modules_project\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false}]},{\"name\":\"components_modules_projects\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false}]},{\"name\":\"components_product_information\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"description\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_product_more_information\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"address\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"website\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"phone\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_opening_hours\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"day_interval\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"opening_hour\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"closing_hour\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_product_product_content\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"price\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_product_product_reviews\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false}]},{\"name\":\"components_product_related_products\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false}]},{\"name\":\"components_product_rich_contents\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"content\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_project_cards\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"slug\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"text\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"label\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_project_project_content\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"content\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"admin_permissions_role_links\",\"indexes\":[{\"name\":\"admin_permissions_role_links_fk\",\"columns\":[\"permission_id\"]},{\"name\":\"admin_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"]},{\"name\":\"admin_permissions_role_links_unique\",\"columns\":[\"permission_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"admin_permissions_role_links_order_inv_fk\",\"columns\":[\"permission_order\"]}],\"foreignKeys\":[{\"name\":\"admin_permissions_role_links_fk\",\"columns\":[\"permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"admin_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"permission_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_users_roles_links\",\"indexes\":[{\"name\":\"admin_users_roles_links_fk\",\"columns\":[\"user_id\"]},{\"name\":\"admin_users_roles_links_inv_fk\",\"columns\":[\"role_id\"]},{\"name\":\"admin_users_roles_links_unique\",\"columns\":[\"user_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"admin_users_roles_links_order_fk\",\"columns\":[\"role_order\"]},{\"name\":\"admin_users_roles_links_order_inv_fk\",\"columns\":[\"user_order\"]}],\"foreignKeys\":[{\"name\":\"admin_users_roles_links_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_users\",\"onDelete\":\"CASCADE\"},{\"name\":\"admin_users_roles_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_api_token_permissions_token_links\",\"indexes\":[{\"name\":\"strapi_api_token_permissions_token_links_fk\",\"columns\":[\"api_token_permission_id\"]},{\"name\":\"strapi_api_token_permissions_token_links_inv_fk\",\"columns\":[\"api_token_id\"]},{\"name\":\"strapi_api_token_permissions_token_links_unique\",\"columns\":[\"api_token_permission_id\",\"api_token_id\"],\"type\":\"unique\"},{\"name\":\"strapi_api_token_permissions_token_links_order_inv_fk\",\"columns\":[\"api_token_permission_order\"]}],\"foreignKeys\":[{\"name\":\"strapi_api_token_permissions_token_links_fk\",\"columns\":[\"api_token_permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_api_token_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"strapi_api_token_permissions_token_links_inv_fk\",\"columns\":[\"api_token_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_api_tokens\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"api_token_permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"api_token_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"api_token_permission_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"files_related_morphs\",\"indexes\":[{\"name\":\"files_related_morphs_fk\",\"columns\":[\"file_id\"]}],\"foreignKeys\":[{\"name\":\"files_related_morphs_fk\",\"columns\":[\"file_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"files\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"file_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"related_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"related_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"files_folder_links\",\"indexes\":[{\"name\":\"files_folder_links_fk\",\"columns\":[\"file_id\"]},{\"name\":\"files_folder_links_inv_fk\",\"columns\":[\"folder_id\"]},{\"name\":\"files_folder_links_unique\",\"columns\":[\"file_id\",\"folder_id\"],\"type\":\"unique\"},{\"name\":\"files_folder_links_order_inv_fk\",\"columns\":[\"file_order\"]}],\"foreignKeys\":[{\"name\":\"files_folder_links_fk\",\"columns\":[\"file_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"files\",\"onDelete\":\"CASCADE\"},{\"name\":\"files_folder_links_inv_fk\",\"columns\":[\"folder_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"upload_folders\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"file_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"folder_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"file_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"upload_folders_parent_links\",\"indexes\":[{\"name\":\"upload_folders_parent_links_fk\",\"columns\":[\"folder_id\"]},{\"name\":\"upload_folders_parent_links_inv_fk\",\"columns\":[\"inv_folder_id\"]},{\"name\":\"upload_folders_parent_links_unique\",\"columns\":[\"folder_id\",\"inv_folder_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_parent_links_order_inv_fk\",\"columns\":[\"folder_order\"]}],\"foreignKeys\":[{\"name\":\"upload_folders_parent_links_fk\",\"columns\":[\"folder_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"upload_folders\",\"onDelete\":\"CASCADE\"},{\"name\":\"upload_folders_parent_links_inv_fk\",\"columns\":[\"inv_folder_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"upload_folders\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"folder_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_folder_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"folder_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_permissions_role_links\",\"indexes\":[{\"name\":\"up_permissions_role_links_fk\",\"columns\":[\"permission_id\"]},{\"name\":\"up_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"]},{\"name\":\"up_permissions_role_links_unique\",\"columns\":[\"permission_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"up_permissions_role_links_order_inv_fk\",\"columns\":[\"permission_order\"]}],\"foreignKeys\":[{\"name\":\"up_permissions_role_links_fk\",\"columns\":[\"permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"up_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"permission_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_users_role_links\",\"indexes\":[{\"name\":\"up_users_role_links_fk\",\"columns\":[\"user_id\"]},{\"name\":\"up_users_role_links_inv_fk\",\"columns\":[\"role_id\"]},{\"name\":\"up_users_role_links_unique\",\"columns\":[\"user_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"up_users_role_links_order_inv_fk\",\"columns\":[\"user_order\"]}],\"foreignKeys\":[{\"name\":\"up_users_role_links_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"},{\"name\":\"up_users_role_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"article_components\",\"indexes\":[{\"name\":\"article_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"article_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"article_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"article_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"article_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"article\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"article_localizations_links\",\"indexes\":[{\"name\":\"article_localizations_links_fk\",\"columns\":[\"article_id\"]},{\"name\":\"article_localizations_links_inv_fk\",\"columns\":[\"inv_article_id\"]},{\"name\":\"article_localizations_links_unique\",\"columns\":[\"article_id\",\"inv_article_id\"],\"type\":\"unique\"},{\"name\":\"article_localizations_links_order_fk\",\"columns\":[\"article_order\"]}],\"foreignKeys\":[{\"name\":\"article_localizations_links_fk\",\"columns\":[\"article_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"article\",\"onDelete\":\"CASCADE\"},{\"name\":\"article_localizations_links_inv_fk\",\"columns\":[\"inv_article_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"article\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"article_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_article_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"article_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"blog_components\",\"indexes\":[{\"name\":\"blog_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"blog_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"blog_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"blog_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"blog_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"blog\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"blog_localizations_links\",\"indexes\":[{\"name\":\"blog_localizations_links_fk\",\"columns\":[\"blog_id\"]},{\"name\":\"blog_localizations_links_inv_fk\",\"columns\":[\"inv_blog_id\"]},{\"name\":\"blog_localizations_links_unique\",\"columns\":[\"blog_id\",\"inv_blog_id\"],\"type\":\"unique\"},{\"name\":\"blog_localizations_links_order_fk\",\"columns\":[\"blog_order\"]}],\"foreignKeys\":[{\"name\":\"blog_localizations_links_fk\",\"columns\":[\"blog_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"blog\",\"onDelete\":\"CASCADE\"},{\"name\":\"blog_localizations_links_inv_fk\",\"columns\":[\"inv_blog_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"blog\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"blog_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_blog_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"blog_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"cookies_category_links\",\"indexes\":[{\"name\":\"cookies_category_links_fk\",\"columns\":[\"cookie_id\"]},{\"name\":\"cookies_category_links_inv_fk\",\"columns\":[\"cookie_category_id\"]},{\"name\":\"cookies_category_links_unique\",\"columns\":[\"cookie_id\",\"cookie_category_id\"],\"type\":\"unique\"},{\"name\":\"cookies_category_links_order_inv_fk\",\"columns\":[\"cookie_order\"]}],\"foreignKeys\":[{\"name\":\"cookies_category_links_fk\",\"columns\":[\"cookie_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"cookies\",\"onDelete\":\"CASCADE\"},{\"name\":\"cookies_category_links_inv_fk\",\"columns\":[\"cookie_category_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"cookie_categories\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"cookie_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"cookie_category_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"cookie_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"cookies_localizations_links\",\"indexes\":[{\"name\":\"cookies_localizations_links_fk\",\"columns\":[\"cookie_id\"]},{\"name\":\"cookies_localizations_links_inv_fk\",\"columns\":[\"inv_cookie_id\"]},{\"name\":\"cookies_localizations_links_unique\",\"columns\":[\"cookie_id\",\"inv_cookie_id\"],\"type\":\"unique\"},{\"name\":\"cookies_localizations_links_order_fk\",\"columns\":[\"cookie_order\"]}],\"foreignKeys\":[{\"name\":\"cookies_localizations_links_fk\",\"columns\":[\"cookie_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"cookies\",\"onDelete\":\"CASCADE\"},{\"name\":\"cookies_localizations_links_inv_fk\",\"columns\":[\"inv_cookie_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"cookies\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"cookie_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_cookie_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"cookie_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"cookie_categories_localizations_links\",\"indexes\":[{\"name\":\"cookie_categories_localizations_links_fk\",\"columns\":[\"cookie_category_id\"]},{\"name\":\"cookie_categories_localizations_links_inv_fk\",\"columns\":[\"inv_cookie_category_id\"]},{\"name\":\"cookie_categories_localizations_links_unique\",\"columns\":[\"cookie_category_id\",\"inv_cookie_category_id\"],\"type\":\"unique\"},{\"name\":\"cookie_categories_localizations_links_order_fk\",\"columns\":[\"cookie_category_order\"]}],\"foreignKeys\":[{\"name\":\"cookie_categories_localizations_links_fk\",\"columns\":[\"cookie_category_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"cookie_categories\",\"onDelete\":\"CASCADE\"},{\"name\":\"cookie_categories_localizations_links_inv_fk\",\"columns\":[\"inv_cookie_category_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"cookie_categories\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"cookie_category_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_cookie_category_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"cookie_category_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"cookie_popups_localizations_links\",\"indexes\":[{\"name\":\"cookie_popups_localizations_links_fk\",\"columns\":[\"cookie_popup_id\"]},{\"name\":\"cookie_popups_localizations_links_inv_fk\",\"columns\":[\"inv_cookie_popup_id\"]},{\"name\":\"cookie_popups_localizations_links_unique\",\"columns\":[\"cookie_popup_id\",\"inv_cookie_popup_id\"],\"type\":\"unique\"},{\"name\":\"cookie_popups_localizations_links_order_fk\",\"columns\":[\"cookie_popup_order\"]}],\"foreignKeys\":[{\"name\":\"cookie_popups_localizations_links_fk\",\"columns\":[\"cookie_popup_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"cookie_popups\",\"onDelete\":\"CASCADE\"},{\"name\":\"cookie_popups_localizations_links_inv_fk\",\"columns\":[\"inv_cookie_popup_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"cookie_popups\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"cookie_popup_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_cookie_popup_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"cookie_popup_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"globals_components\",\"indexes\":[{\"name\":\"globals_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"globals_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"globals_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"globals_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"globals_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"globals\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"globals_localizations_links\",\"indexes\":[{\"name\":\"globals_localizations_links_fk\",\"columns\":[\"global_id\"]},{\"name\":\"globals_localizations_links_inv_fk\",\"columns\":[\"inv_global_id\"]},{\"name\":\"globals_localizations_links_unique\",\"columns\":[\"global_id\",\"inv_global_id\"],\"type\":\"unique\"},{\"name\":\"globals_localizations_links_order_fk\",\"columns\":[\"global_order\"]}],\"foreignKeys\":[{\"name\":\"globals_localizations_links_fk\",\"columns\":[\"global_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"globals\",\"onDelete\":\"CASCADE\"},{\"name\":\"globals_localizations_links_inv_fk\",\"columns\":[\"inv_global_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"globals\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"global_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_global_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"global_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"pages_components\",\"indexes\":[{\"name\":\"pages_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"pages_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"pages_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"pages_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"pages_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"pages\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"pages_editors_links\",\"indexes\":[{\"name\":\"pages_editors_links_fk\",\"columns\":[\"page_id\"]},{\"name\":\"pages_editors_links_inv_fk\",\"columns\":[\"user_id\"]},{\"name\":\"pages_editors_links_unique\",\"columns\":[\"page_id\",\"user_id\"],\"type\":\"unique\"},{\"name\":\"pages_editors_links_order_fk\",\"columns\":[\"user_order\"]}],\"foreignKeys\":[{\"name\":\"pages_editors_links_fk\",\"columns\":[\"page_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"pages\",\"onDelete\":\"CASCADE\"},{\"name\":\"pages_editors_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"page_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"pages_localizations_links\",\"indexes\":[{\"name\":\"pages_localizations_links_fk\",\"columns\":[\"page_id\"]},{\"name\":\"pages_localizations_links_inv_fk\",\"columns\":[\"inv_page_id\"]},{\"name\":\"pages_localizations_links_unique\",\"columns\":[\"page_id\",\"inv_page_id\"],\"type\":\"unique\"},{\"name\":\"pages_localizations_links_order_fk\",\"columns\":[\"page_order\"]}],\"foreignKeys\":[{\"name\":\"pages_localizations_links_fk\",\"columns\":[\"page_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"pages\",\"onDelete\":\"CASCADE\"},{\"name\":\"pages_localizations_links_inv_fk\",\"columns\":[\"inv_page_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"pages\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"page_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_page_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"page_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"product_components\",\"indexes\":[{\"name\":\"product_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"product_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"product_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"product_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"product_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"product\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"product_localizations_links\",\"indexes\":[{\"name\":\"product_localizations_links_fk\",\"columns\":[\"product_id\"]},{\"name\":\"product_localizations_links_inv_fk\",\"columns\":[\"inv_product_id\"]},{\"name\":\"product_localizations_links_unique\",\"columns\":[\"product_id\",\"inv_product_id\"],\"type\":\"unique\"},{\"name\":\"product_localizations_links_order_fk\",\"columns\":[\"product_order\"]}],\"foreignKeys\":[{\"name\":\"product_localizations_links_fk\",\"columns\":[\"product_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"product\",\"onDelete\":\"CASCADE\"},{\"name\":\"product_localizations_links_inv_fk\",\"columns\":[\"inv_product_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"product\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"product_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_product_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"product_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"project_components\",\"indexes\":[{\"name\":\"project_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"project_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"project_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"project_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"project_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"project\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"project_localizations_links\",\"indexes\":[{\"name\":\"project_localizations_links_fk\",\"columns\":[\"project_id\"]},{\"name\":\"project_localizations_links_inv_fk\",\"columns\":[\"inv_project_id\"]},{\"name\":\"project_localizations_links_unique\",\"columns\":[\"project_id\",\"inv_project_id\"],\"type\":\"unique\"},{\"name\":\"project_localizations_links_order_fk\",\"columns\":[\"project_order\"]}],\"foreignKeys\":[{\"name\":\"project_localizations_links_fk\",\"columns\":[\"project_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"project\",\"onDelete\":\"CASCADE\"},{\"name\":\"project_localizations_links_inv_fk\",\"columns\":[\"inv_project_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"project\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"project_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_project_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"project_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"reviews_author_links\",\"indexes\":[{\"name\":\"reviews_author_links_fk\",\"columns\":[\"review_id\"]},{\"name\":\"reviews_author_links_inv_fk\",\"columns\":[\"user_id\"]},{\"name\":\"reviews_author_links_unique\",\"columns\":[\"review_id\",\"user_id\"],\"type\":\"unique\"},{\"name\":\"reviews_author_links_order_inv_fk\",\"columns\":[\"review_order\"]}],\"foreignKeys\":[{\"name\":\"reviews_author_links_fk\",\"columns\":[\"review_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"reviews\",\"onDelete\":\"CASCADE\"},{\"name\":\"reviews_author_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"review_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"review_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"reviews_localizations_links\",\"indexes\":[{\"name\":\"reviews_localizations_links_fk\",\"columns\":[\"review_id\"]},{\"name\":\"reviews_localizations_links_inv_fk\",\"columns\":[\"inv_review_id\"]},{\"name\":\"reviews_localizations_links_unique\",\"columns\":[\"review_id\",\"inv_review_id\"],\"type\":\"unique\"},{\"name\":\"reviews_localizations_links_order_fk\",\"columns\":[\"review_order\"]}],\"foreignKeys\":[{\"name\":\"reviews_localizations_links_fk\",\"columns\":[\"review_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"reviews\",\"onDelete\":\"CASCADE\"},{\"name\":\"reviews_localizations_links_inv_fk\",\"columns\":[\"inv_review_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"reviews\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"review_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_review_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"review_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"shop_components\",\"indexes\":[{\"name\":\"shop_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"shop_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"shop_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"shop_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"shop_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"shop\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"shop_localizations_links\",\"indexes\":[{\"name\":\"shop_localizations_links_fk\",\"columns\":[\"shop_id\"]},{\"name\":\"shop_localizations_links_inv_fk\",\"columns\":[\"inv_shop_id\"]},{\"name\":\"shop_localizations_links_unique\",\"columns\":[\"shop_id\",\"inv_shop_id\"],\"type\":\"unique\"},{\"name\":\"shop_localizations_links_order_fk\",\"columns\":[\"shop_order\"]}],\"foreignKeys\":[{\"name\":\"shop_localizations_links_fk\",\"columns\":[\"shop_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"shop\",\"onDelete\":\"CASCADE\"},{\"name\":\"shop_localizations_links_inv_fk\",\"columns\":[\"inv_shop_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"shop\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"shop_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_shop_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"shop_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"work_components\",\"indexes\":[{\"name\":\"work_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"work_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"work_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"work_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"work_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"work\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"work_localizations_links\",\"indexes\":[{\"name\":\"work_localizations_links_fk\",\"columns\":[\"work_id\"]},{\"name\":\"work_localizations_links_inv_fk\",\"columns\":[\"inv_work_id\"]},{\"name\":\"work_localizations_links_unique\",\"columns\":[\"work_id\",\"inv_work_id\"],\"type\":\"unique\"},{\"name\":\"work_localizations_links_order_fk\",\"columns\":[\"work_order\"]}],\"foreignKeys\":[{\"name\":\"work_localizations_links_fk\",\"columns\":[\"work_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"work\",\"onDelete\":\"CASCADE\"},{\"name\":\"work_localizations_links_inv_fk\",\"columns\":[\"inv_work_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"work\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"work_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_work_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"work_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components___lib_bio_components\",\"indexes\":[{\"name\":\"components___lib_bio_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components___lib_bio_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components___lib_bio_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components___lib_bio_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components___lib_bio_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components___lib_bio\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components___lib_buttons_components\",\"indexes\":[{\"name\":\"components___lib_buttons_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components___lib_buttons_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components___lib_buttons_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components___lib_buttons_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components___lib_buttons_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components___lib_buttons\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components___lib_footer_columns_components\",\"indexes\":[{\"name\":\"components___lib_footer_columns_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components___lib_footer_columns_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components___lib_footer_columns_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components___lib_footer_columns_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components___lib_footer_columns_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components___lib_footer_columns\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components___lib_headers_components\",\"indexes\":[{\"name\":\"components___lib_headers_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components___lib_headers_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components___lib_headers_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components___lib_headers_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components___lib_headers_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components___lib_headers\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components___lib_pricing_cards_components\",\"indexes\":[{\"name\":\"components___lib_pricing_cards_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components___lib_pricing_cards_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components___lib_pricing_cards_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components___lib_pricing_cards_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components___lib_pricing_cards_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components___lib_pricing_cards\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components___lib_seos_components\",\"indexes\":[{\"name\":\"components___lib_seos_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components___lib_seos_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components___lib_seos_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components___lib_seos_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components___lib_seos_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components___lib_seos\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components___lib_team_cards_components\",\"indexes\":[{\"name\":\"components___lib_team_cards_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components___lib_team_cards_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components___lib_team_cards_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components___lib_team_cards_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components___lib_team_cards_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components___lib_team_cards\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components___lib_widget_components\",\"indexes\":[{\"name\":\"components___lib_widget_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components___lib_widget_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components___lib_widget_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components___lib_widget_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components___lib_widget_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components___lib_widget\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_article_related_articles_components\",\"indexes\":[{\"name\":\"components_article_related_articles_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_article_related_articles_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_article_related_articles_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_article_related_articles_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_article_related_articles_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_article_related_articles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_article_related_articles_articles_links\",\"indexes\":[{\"name\":\"components_article_related_articles_articles_links_fk\",\"columns\":[\"related_articles_id\"]},{\"name\":\"components_article_related_articles_articles_links_inv_fk\",\"columns\":[\"article_id\"]},{\"name\":\"components_article_related_articles_articles_links_unique\",\"columns\":[\"related_articles_id\",\"article_id\"],\"type\":\"unique\"},{\"name\":\"components_article_related_articles_articles_links_order_fk\",\"columns\":[\"article_order\"]}],\"foreignKeys\":[{\"name\":\"components_article_related_articles_articles_links_fk\",\"columns\":[\"related_articles_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_article_related_articles\",\"onDelete\":\"CASCADE\"},{\"name\":\"components_article_related_articles_articles_links_inv_fk\",\"columns\":[\"article_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"article\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"related_articles_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"article_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"article_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_blocks_about_me_components\",\"indexes\":[{\"name\":\"components_blocks_about_me_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_blocks_about_me_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_blocks_about_me_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_blocks_about_me_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_blocks_about_me_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_blocks_about_me\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components___lib_faqs_components\",\"indexes\":[{\"name\":\"components___lib_faqs_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components___lib_faqs_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components___lib_faqs_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components___lib_faqs_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components___lib_faqs_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components___lib_faqs\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_blocks_featured_projects_components\",\"indexes\":[{\"name\":\"components_blocks_featured_projects_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_blocks_featured_projects_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_blocks_featured_projects_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_blocks_featured_projects_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_blocks_featured_projects_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_blocks_featured_projects\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_slices_heroes_components\",\"indexes\":[{\"name\":\"components_slices_heroes_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_slices_heroes_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_slices_heroes_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_slices_heroes_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_slices_heroes_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_slices_heroes\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_blocks_latest_code_components\",\"indexes\":[{\"name\":\"components_blocks_latest_code_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_blocks_latest_code_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_blocks_latest_code_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_blocks_latest_code_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_blocks_latest_code_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_blocks_latest_code\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_slices_pricings_components\",\"indexes\":[{\"name\":\"components_slices_pricings_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_slices_pricings_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_slices_pricings_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_slices_pricings_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_slices_pricings_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_slices_pricings\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_slices_teams_components\",\"indexes\":[{\"name\":\"components_slices_teams_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_slices_teams_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_slices_teams_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_slices_teams_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_slices_teams_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_slices_teams\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_slices_teams_members_links\",\"indexes\":[{\"name\":\"components_slices_teams_members_links_fk\",\"columns\":[\"team_id\"]},{\"name\":\"components_slices_teams_members_links_inv_fk\",\"columns\":[\"user_id\"]},{\"name\":\"components_slices_teams_members_links_unique\",\"columns\":[\"team_id\",\"user_id\"],\"type\":\"unique\"},{\"name\":\"components_slices_teams_members_links_order_fk\",\"columns\":[\"user_order\"]}],\"foreignKeys\":[{\"name\":\"components_slices_teams_members_links_fk\",\"columns\":[\"team_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_slices_teams\",\"onDelete\":\"CASCADE\"},{\"name\":\"components_slices_teams_members_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"team_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_lib_testimonials_author_links\",\"indexes\":[{\"name\":\"components_lib_testimonials_author_links_fk\",\"columns\":[\"testimonial_id\"]},{\"name\":\"components_lib_testimonials_author_links_inv_fk\",\"columns\":[\"user_id\"]},{\"name\":\"components_lib_testimonials_author_links_unique\",\"columns\":[\"testimonial_id\",\"user_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_lib_testimonials_author_links_fk\",\"columns\":[\"testimonial_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components___lib_testimonials\",\"onDelete\":\"CASCADE\"},{\"name\":\"components_lib_testimonials_author_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"testimonial_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_global_footers_components\",\"indexes\":[{\"name\":\"components_global_footers_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_global_footers_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_global_footers_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_global_footers_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_global_footers_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_global_footers\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_global_navigations_components\",\"indexes\":[{\"name\":\"components_global_navigations_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_global_navigations_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_global_navigations_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_global_navigations_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_global_navigations_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_global_navigations\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_modules_article_components\",\"indexes\":[{\"name\":\"components_modules_article_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_modules_article_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_modules_article_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_modules_article_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_modules_article_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_modules_article\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_modules_article_category_links\",\"indexes\":[{\"name\":\"components_modules_article_category_links_fk\",\"columns\":[\"article_id\"]},{\"name\":\"components_modules_article_category_links_inv_fk\",\"columns\":[\"category_id\"]},{\"name\":\"components_modules_article_category_links_unique\",\"columns\":[\"article_id\",\"category_id\"],\"type\":\"unique\"},{\"name\":\"components_modules_article_category_links_order_inv_fk\",\"columns\":[\"article_order\"]}],\"foreignKeys\":[{\"name\":\"components_modules_article_category_links_fk\",\"columns\":[\"article_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_modules_article\",\"onDelete\":\"CASCADE\"},{\"name\":\"components_modules_article_category_links_inv_fk\",\"columns\":[\"category_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"categories\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"article_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"category_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"article_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_modules_article_editors_links\",\"indexes\":[{\"name\":\"components_modules_article_editors_links_fk\",\"columns\":[\"article_id\"]},{\"name\":\"components_modules_article_editors_links_inv_fk\",\"columns\":[\"user_id\"]},{\"name\":\"components_modules_article_editors_links_unique\",\"columns\":[\"article_id\",\"user_id\"],\"type\":\"unique\"},{\"name\":\"components_modules_article_editors_links_order_fk\",\"columns\":[\"user_order\"]}],\"foreignKeys\":[{\"name\":\"components_modules_article_editors_links_fk\",\"columns\":[\"article_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_modules_article\",\"onDelete\":\"CASCADE\"},{\"name\":\"components_modules_article_editors_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"article_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_modules_articles_components\",\"indexes\":[{\"name\":\"components_modules_articles_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_modules_articles_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_modules_articles_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_modules_articles_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_modules_articles_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_modules_articles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_modules_product_components\",\"indexes\":[{\"name\":\"components_modules_product_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_modules_product_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_modules_product_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_modules_product_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_modules_product_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_modules_product\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_modules_product_category_links\",\"indexes\":[{\"name\":\"components_modules_product_category_links_fk\",\"columns\":[\"product_id\"]},{\"name\":\"components_modules_product_category_links_inv_fk\",\"columns\":[\"category_id\"]},{\"name\":\"components_modules_product_category_links_unique\",\"columns\":[\"product_id\",\"category_id\"],\"type\":\"unique\"},{\"name\":\"components_modules_product_category_links_order_inv_fk\",\"columns\":[\"product_order\"]}],\"foreignKeys\":[{\"name\":\"components_modules_product_category_links_fk\",\"columns\":[\"product_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_modules_product\",\"onDelete\":\"CASCADE\"},{\"name\":\"components_modules_product_category_links_inv_fk\",\"columns\":[\"category_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"categories\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"product_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"category_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"product_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_modules_product_tag_links\",\"indexes\":[{\"name\":\"components_modules_product_tag_links_fk\",\"columns\":[\"product_id\"]},{\"name\":\"components_modules_product_tag_links_inv_fk\",\"columns\":[\"tag_id\"]},{\"name\":\"components_modules_product_tag_links_unique\",\"columns\":[\"product_id\",\"tag_id\"],\"type\":\"unique\"},{\"name\":\"components_modules_product_tag_links_order_inv_fk\",\"columns\":[\"product_order\"]}],\"foreignKeys\":[{\"name\":\"components_modules_product_tag_links_fk\",\"columns\":[\"product_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_modules_product\",\"onDelete\":\"CASCADE\"},{\"name\":\"components_modules_product_tag_links_inv_fk\",\"columns\":[\"tag_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"tags\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"product_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"tag_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"product_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_modules_products_components\",\"indexes\":[{\"name\":\"components_modules_products_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_modules_products_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_modules_products_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_modules_products_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_modules_products_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_modules_products\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_modules_project_components\",\"indexes\":[{\"name\":\"components_modules_project_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_modules_project_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_modules_project_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_modules_project_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_modules_project_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_modules_project\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_modules_project_category_links\",\"indexes\":[{\"name\":\"components_modules_project_category_links_fk\",\"columns\":[\"project_id\"]},{\"name\":\"components_modules_project_category_links_inv_fk\",\"columns\":[\"category_id\"]},{\"name\":\"components_modules_project_category_links_unique\",\"columns\":[\"project_id\",\"category_id\"],\"type\":\"unique\"},{\"name\":\"components_modules_project_category_links_order_inv_fk\",\"columns\":[\"project_order\"]}],\"foreignKeys\":[{\"name\":\"components_modules_project_category_links_fk\",\"columns\":[\"project_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_modules_project\",\"onDelete\":\"CASCADE\"},{\"name\":\"components_modules_project_category_links_inv_fk\",\"columns\":[\"category_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"categories\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"project_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"category_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"project_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_modules_projects_components\",\"indexes\":[{\"name\":\"components_modules_projects_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_modules_projects_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_modules_projects_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_modules_projects_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_modules_projects_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_modules_projects\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_product_information_components\",\"indexes\":[{\"name\":\"components_product_information_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_product_information_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_product_information_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_product_information_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_product_information_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_product_information\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_product_product_content_components\",\"indexes\":[{\"name\":\"components_product_product_content_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_product_product_content_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_product_product_content_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_product_product_content_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_product_product_content_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_product_product_content\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_product_product_reviews_reviews_links\",\"indexes\":[{\"name\":\"components_product_product_reviews_reviews_links_fk\",\"columns\":[\"product_reviews_id\"]},{\"name\":\"components_product_product_reviews_reviews_links_inv_fk\",\"columns\":[\"review_id\"]},{\"name\":\"components_product_product_reviews_reviews_links_unique\",\"columns\":[\"product_reviews_id\",\"review_id\"],\"type\":\"unique\"},{\"name\":\"components_product_product_reviews_reviews_links_order_fk\",\"columns\":[\"review_order\"]}],\"foreignKeys\":[{\"name\":\"components_product_product_reviews_reviews_links_fk\",\"columns\":[\"product_reviews_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_product_product_reviews\",\"onDelete\":\"CASCADE\"},{\"name\":\"components_product_product_reviews_reviews_links_inv_fk\",\"columns\":[\"review_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"reviews\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"product_reviews_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"review_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"review_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_product_related_products_components\",\"indexes\":[{\"name\":\"components_product_related_products_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_product_related_products_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_product_related_products_entity_fk\",\"columns\":[\"entity_id\"]},{\"name\":\"components_product_related_products_unique\",\"columns\":[\"entity_id\",\"component_id\",\"field\",\"component_type\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"components_product_related_products_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_product_related_products\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_product_related_products_shop_links\",\"indexes\":[{\"name\":\"components_product_related_products_shop_links_fk\",\"columns\":[\"related_products_id\"]},{\"name\":\"components_product_related_products_shop_links_inv_fk\",\"columns\":[\"product_id\"]},{\"name\":\"components_product_related_products_shop_links_unique\",\"columns\":[\"related_products_id\",\"product_id\"],\"type\":\"unique\"},{\"name\":\"components_product_related_products_shop_links_order_fk\",\"columns\":[\"product_order\"]}],\"foreignKeys\":[{\"name\":\"components_product_related_products_shop_links_fk\",\"columns\":[\"related_products_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_product_related_products\",\"onDelete\":\"CASCADE\"},{\"name\":\"components_product_related_products_shop_links_inv_fk\",\"columns\":[\"product_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"product\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"related_products_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"product_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"product_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]}]}", "2023-03-23 22:47:37", "8e9045f774f73302fcda4f3329e046c9");

/*!40000 ALTER TABLE `strapi_database_schema` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table strapi_ee_store_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strapi_ee_store_settings`;

CREATE TABLE `strapi_ee_store_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table strapi_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strapi_migrations`;

CREATE TABLE `strapi_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table strapi_webhooks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strapi_webhooks`;

CREATE TABLE `strapi_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headers`)),
  `events` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`events`)),
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_created_by_id_fk` (`created_by_id`),
  KEY `tags_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `tags_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tags_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table todo_task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `todo_task`;

CREATE TABLE `todo_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `is_done` tinyint(1) DEFAULT NULL,
  `target_id` int(10) unsigned DEFAULT NULL,
  `target_type` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `todo_task_created_by_id_fk` (`created_by_id`),
  KEY `todo_task_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `todo_task_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `todo_task_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table up_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `up_permissions`;

CREATE TABLE `up_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_permissions_created_by_id_fk` (`created_by_id`),
  KEY `up_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `up_permissions` WRITE;
/*!40000 ALTER TABLE `up_permissions` DISABLE KEYS */;

INSERT INTO `up_permissions` (`id`, `action`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
	(1, "plugin::users-permissions.auth.changePassword", "2023-03-21 17:39:51.453000", "2023-03-21 17:39:51.453000", NULL, NULL),
	(2, "plugin::users-permissions.user.me", "2023-03-21 17:39:51.453000", "2023-03-21 17:39:51.453000", NULL, NULL),
	(3, "plugin::users-permissions.auth.callback", "2023-03-21 17:39:51.604000", "2023-03-21 17:39:51.604000", NULL, NULL),
	(4, "plugin::users-permissions.auth.connect", "2023-03-21 17:39:51.604000", "2023-03-21 17:39:51.604000", NULL, NULL),
	(5, "plugin::users-permissions.auth.resetPassword", "2023-03-21 17:39:51.604000", "2023-03-21 17:39:51.604000", NULL, NULL),
	(6, "plugin::users-permissions.auth.register", "2023-03-21 17:39:51.604000", "2023-03-21 17:39:51.604000", NULL, NULL),
	(7, "plugin::users-permissions.auth.sendEmailConfirmation", "2023-03-21 17:39:51.604000", "2023-03-21 17:39:51.604000", NULL, NULL),
	(8, "plugin::users-permissions.auth.forgotPassword", "2023-03-21 17:39:51.604000", "2023-03-21 17:39:51.604000", NULL, NULL),
	(9, "plugin::users-permissions.auth.emailConfirmation", "2023-03-21 17:39:51.604000", "2023-03-21 17:39:51.604000", NULL, NULL),
	(10, "api::article.article.find", "2023-03-22 12:20:53.919000", "2023-03-22 12:20:53.919000", NULL, NULL),
	(11, "api::article.article.findOne", "2023-03-22 12:20:53.919000", "2023-03-22 12:20:53.919000", NULL, NULL),
	(12, "api::blog.blog.find", "2023-03-22 12:20:53.919000", "2023-03-22 12:20:53.919000", NULL, NULL),
	(13, "api::global.global.find", "2023-03-22 12:20:53.919000", "2023-03-22 12:20:53.919000", NULL, NULL),
	(14, "api::page.page.findOne", "2023-03-22 12:20:53.919000", "2023-03-22 12:20:53.919000", NULL, NULL),
	(15, "api::project.project.find", "2023-03-22 12:20:53.919000", "2023-03-22 12:20:53.919000", NULL, NULL),
	(16, "api::project.project.findOne", "2023-03-22 12:20:53.919000", "2023-03-22 12:20:53.919000", NULL, NULL),
	(17, "api::review.review.find", "2023-03-22 12:20:53.919000", "2023-03-22 12:20:53.919000", NULL, NULL),
	(18, "api::review.review.findOne", "2023-03-22 12:20:53.919000", "2023-03-22 12:20:53.919000", NULL, NULL),
	(19, "api::work.work.find", "2023-03-22 12:20:53.919000", "2023-03-22 12:20:53.919000", NULL, NULL),
	(20, "api::page.page.find", "2023-03-23 21:12:54.958000", "2023-03-23 21:12:54.958000", NULL, NULL);

/*!40000 ALTER TABLE `up_permissions` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table up_permissions_role_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `up_permissions_role_links`;

CREATE TABLE `up_permissions_role_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `up_permissions_role_links_unique` (`permission_id`,`role_id`),
  KEY `up_permissions_role_links_fk` (`permission_id`),
  KEY `up_permissions_role_links_inv_fk` (`role_id`),
  KEY `up_permissions_role_links_order_inv_fk` (`permission_order`),
  CONSTRAINT `up_permissions_role_links_fk` FOREIGN KEY (`permission_id`) REFERENCES `up_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_permissions_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `up_permissions_role_links` WRITE;
/*!40000 ALTER TABLE `up_permissions_role_links` DISABLE KEYS */;

INSERT INTO `up_permissions_role_links` (`id`, `permission_id`, `role_id`, `permission_order`) VALUES
	(1, 1, 1, 1),
	(2, 2, 1, 1),
	(3, 3, 2, 1),
	(4, 5, 2, 2),
	(5, 6, 2, 2),
	(6, 7, 2, 2),
	(7, 4, 2, 2),
	(8, 8, 2, 3),
	(9, 9, 2, 3),
	(10, 12, 2, 4),
	(11, 13, 2, 4),
	(12, 14, 2, 4),
	(13, 10, 2, 4),
	(14, 15, 2, 4),
	(15, 16, 2, 4),
	(16, 17, 2, 4),
	(17, 11, 2, 4),
	(18, 18, 2, 5),
	(19, 19, 2, 5),
	(20, 20, 2, 6);

/*!40000 ALTER TABLE `up_permissions_role_links` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table up_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `up_roles`;

CREATE TABLE `up_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_roles_created_by_id_fk` (`created_by_id`),
  KEY `up_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `up_roles` WRITE;
/*!40000 ALTER TABLE `up_roles` DISABLE KEYS */;

INSERT INTO `up_roles` (`id`, `name`, `description`, `type`, `created_at`, `updated_at`, `created_by_id`, `updated_by_id`) VALUES
	(1, "Authenticated", "Default role given to authenticated user.", "authenticated", "2023-03-21 17:39:51.364000", "2023-03-21 17:39:51.364000", NULL, NULL),
	(2, "Public", "Default role given to unauthenticated user.", "public", "2023-03-21 17:39:51.390000", "2023-03-23 21:12:56.939000", NULL, NULL);

/*!40000 ALTER TABLE `up_roles` ENABLE KEYS */;
UNLOCK TABLES;



# Dump of table up_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `up_users`;

CREATE TABLE `up_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_users_created_by_id_fk` (`created_by_id`),
  KEY `up_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table up_users_role_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `up_users_role_links`;

CREATE TABLE `up_users_role_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `user_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `up_users_role_links_unique` (`user_id`,`role_id`),
  KEY `up_users_role_links_fk` (`user_id`),
  KEY `up_users_role_links_inv_fk` (`role_id`),
  KEY `up_users_role_links_order_inv_fk` (`user_order`),
  CONSTRAINT `up_users_role_links_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_users_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table upload_folders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `upload_folders`;

CREATE TABLE `upload_folders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `path_id` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_folders_path_id_index` (`path_id`),
  UNIQUE KEY `upload_folders_path_index` (`path`),
  KEY `upload_folders_created_by_id_fk` (`created_by_id`),
  KEY `upload_folders_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `upload_folders_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `upload_folders_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table upload_folders_parent_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `upload_folders_parent_links`;

CREATE TABLE `upload_folders_parent_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int(10) unsigned DEFAULT NULL,
  `inv_folder_id` int(10) unsigned DEFAULT NULL,
  `folder_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_folders_parent_links_unique` (`folder_id`,`inv_folder_id`),
  KEY `upload_folders_parent_links_fk` (`folder_id`),
  KEY `upload_folders_parent_links_inv_fk` (`inv_folder_id`),
  KEY `upload_folders_parent_links_order_inv_fk` (`folder_order`),
  CONSTRAINT `upload_folders_parent_links_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_folders_parent_links_inv_fk` FOREIGN KEY (`inv_folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table work
# ------------------------------------------------------------

DROP TABLE IF EXISTS `work`;

CREATE TABLE `work` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) DEFAULT NULL,
  `per_page` int(11) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `sitemap_exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `work_created_by_id_fk` (`created_by_id`),
  KEY `work_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `work_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `work_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table work_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `work_components`;

CREATE TABLE `work_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `work_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `work_field_index` (`field`),
  KEY `work_component_type_index` (`component_type`),
  KEY `work_entity_fk` (`entity_id`),
  CONSTRAINT `work_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `work` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of table work_localizations_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `work_localizations_links`;

CREATE TABLE `work_localizations_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `work_id` int(10) unsigned DEFAULT NULL,
  `inv_work_id` int(10) unsigned DEFAULT NULL,
  `work_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `work_localizations_links_unique` (`work_id`,`inv_work_id`),
  KEY `work_localizations_links_fk` (`work_id`),
  KEY `work_localizations_links_inv_fk` (`inv_work_id`),
  KEY `work_localizations_links_order_fk` (`work_order`),
  CONSTRAINT `work_localizations_links_fk` FOREIGN KEY (`work_id`) REFERENCES `work` (`id`) ON DELETE CASCADE,
  CONSTRAINT `work_localizations_links_inv_fk` FOREIGN KEY (`inv_work_id`) REFERENCES `work` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





# Dump of views
# ------------------------------------------------------------

# Creating temporary tables to overcome VIEW dependency errors


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

# Dump completed on 2023-03-24T08:43:20+01:00
