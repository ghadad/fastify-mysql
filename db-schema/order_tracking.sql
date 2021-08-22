CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

INSERT INTO `company` (`id`, `name`) VALUES
(1, 'Company A'),
(2, 'Company B');

CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `invoice_date` datetime NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `status_id` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;


INSERT INTO `invoice` (`id`, `company_id`, `invoice_no`, `invoice_date`, `amount`, `status_id`) VALUES
(7, 2, 123, '2012-02-16 23:59:59', '55.00', 1);


CREATE TABLE IF NOT EXISTS `invoice_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `amount_received` decimal(6,2) NOT NULL,
  `amount_sent` decimal(6,2) NOT NULL,
  `date_received` datetime NOT NULL,
  `date_sent` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

INSERT INTO `invoice_payment` (`id`, `invoice_id`, `amount_received`, `amount_sent`, `date_received`, `date_sent`) VALUES
(1, 1, '0.00', '55.00', '0000-00-00 00:00:00', '2012-02-18 22:20:53');


CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `total_cost` decimal(6,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;


INSERT INTO `orders` (`id`, `user_id`, `company_id`, `total_cost`, `order_date`, `status_id`) VALUES
(1, 5, 2, '25.00', '2012-02-03 23:30:24', 1),
(2, 7, 2, '30.00', '2012-02-13 18:06:12', 1);


CREATE TABLE IF NOT EXISTS `orders_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `cost` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `product_name`, `cost`) VALUES
(1, 1, 34, 'Chair', '10.00'),
(2, 1, 25, 'TV', '10.00'),
(3, 1, 27, 'Desk', '2.50'),
(4, 1, 36, 'Laptop', '2.50'),
(5, 2, 75, 'PHP Book', '25.00'),
(6, 2, 74, 'MySQL Book', '5.00');
