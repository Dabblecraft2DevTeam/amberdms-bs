--
-- AMBERDMS BILLING SYSTEM VERSION 2.0.0_alpha_1
--
-- Inital database install SQL.
--

CREATE DATABASE `billing_system` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `billing_system`;



--
-- Table structure for table `account_ap`
--

CREATE TABLE `account_ap` (
  `id` int(11) NOT NULL auto_increment,
  `locked` tinyint(1) NOT NULL default '0',
  `vendorid` int(11) NOT NULL default '0',
  `employeeid` int(11) NOT NULL default '0',
  `dest_account` int(11) NOT NULL default '0',
  `code_invoice` varchar(255) NOT NULL,
  `code_ordernumber` varchar(255) NOT NULL,
  `code_ponumber` varchar(255) NOT NULL,
  `date_due` date NOT NULL default '0000-00-00',
  `date_trans` date NOT NULL default '0000-00-00',
  `date_create` date NOT NULL default '0000-00-00',
  `amount_total` decimal(11,2) NOT NULL default '0.00',
  `amount_tax` decimal(11,2) NOT NULL default '0.00',
  `amount` decimal(11,2) NOT NULL default '0.00',
  `amount_paid` decimal(11,2) NOT NULL default '0.00',
  `notes` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_ap`
--


--
-- Table structure for table `account_ar`
--

CREATE TABLE `account_ar` (
  `id` int(11) NOT NULL auto_increment,
  `locked` tinyint(1) NOT NULL default '0',
  `customerid` int(11) NOT NULL default '0',
  `employeeid` int(11) NOT NULL default '0',
  `dest_account` int(11) NOT NULL default '0',
  `code_invoice` varchar(255) NOT NULL,
  `code_ordernumber` varchar(255) NOT NULL,
  `code_ponumber` varchar(255) NOT NULL,
  `date_due` date NOT NULL default '0000-00-00',
  `date_trans` date NOT NULL default '0000-00-00',
  `date_create` date NOT NULL default '0000-00-00',
  `date_sent` date NOT NULL default '0000-00-00',
  `sentmethod` varchar(10) NOT NULL,
  `amount_total` decimal(11,2) NOT NULL default '0.00',
  `amount_tax` decimal(11,2) NOT NULL default '0.00',
  `amount` decimal(11,2) NOT NULL default '0.00',
  `amount_paid` decimal(11,2) NOT NULL default '0.00',
  `notes` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_ar`
--


--
-- Table structure for table `account_chart_menu`
--

CREATE TABLE `account_chart_menu` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(50) NOT NULL,
  `groupname` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_chart_menu`
--

LOCK TABLES `account_chart_menu` WRITE;
INSERT INTO `account_chart_menu` VALUES (1,'ar_summary_account','Accounts Receivables','Account to file all unpaid AR transactions/invoices too.'),(2,'ar_income','Accounts Receivables','Use this account to record income.'),(3,'tax_summary_account','Tax','Use this account for sales taxes.'),(6,'ar_payment','Accounts Receivables','Allow payments made by customers to be placed into this account'),(7,'ap_summary_account','Accounts Payable','Account to file all unpaid AP transactions/invoices too.'),(8,'ap_expense','Accounts Payable','Use this account for AP expenses'),(9,'ap_payment','Accounts Payable','Allow invoice payments to be taken from this account'),(10,'ap_expense_employeewages','Accounts Payable','Use this account for paying staff wages/expenses');
UNLOCK TABLES;

--
-- Table structure for table `account_chart_type`
--

CREATE TABLE `account_chart_type` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(20) NOT NULL,
  `total_mode` varchar(6) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_chart_type`
--

LOCK TABLES `account_chart_type` WRITE;
INSERT INTO `account_chart_type` VALUES (1,'Heading',''),(2,'Asset','debit'),(3,'Liability','credit'),(4,'Equity',''),(5,'Income','credit'),(6,'Expense','debit');
UNLOCK TABLES;

--
-- Table structure for table `account_chart_types_menus`
--

CREATE TABLE `account_chart_types_menus` (
  `id` int(11) NOT NULL auto_increment,
  `menuid` int(11) NOT NULL,
  `chart_typeid` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_chart_types_menus`
--

LOCK TABLES `account_chart_types_menus` WRITE;
INSERT INTO `account_chart_types_menus` VALUES (1,6,2),(2,9,2),(3,1,2),(4,8,2),(5,3,3),(6,9,3),(7,7,3),(8,2,5),(9,8,6);
UNLOCK TABLES;

--
-- Table structure for table `account_charts`
--

CREATE TABLE `account_charts` (
  `id` int(11) NOT NULL auto_increment,
  `code_chart` int(11) NOT NULL default '0',
  `description` varchar(255) NOT NULL,
  `chart_type` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_charts`
--

LOCK TABLES `account_charts` WRITE;
INSERT INTO `account_charts` VALUES (1,1000,'CURRENT ASSETS',1),(2,1060,'Current Account',2),(3,1061,'Savings Account',2),(5,1065,'Petty Cash',2),(6,1200,'Accounts Receivables',2),(7,1205,'Allowance for doubtful accounts',2),(8,1500,'INVENTORY ASSETS',1),(9,1520,'Inventory / General',2),(10,1530,'Inventory / Aftermarket Parts',2),(11,1800,'CAPITAL ASSETS',1),(12,1820,'Computer Equipment',2),(13,2000,'CURRENT LIABILITIES',1),(14,2100,'Accounts Payable',3),(15,2110,'Reimburse to Staff',3),(16,2310,'Sales Tax (GST)',3),(17,4000,'SALES REVENUE',1),(18,4020,'Sales / General',5),(19,4021,'Sales / Internet Services',5),(20,4022,'Sales / Webdevelopment',5),(21,4023,'Sales / Computer Hardware',5),(22,4024,'Sales / Server Support',5),(23,4300,'CONSULTING REVENUE',1),(24,4320,'Consulting',5),(25,4400,'OTHER REVENUE',1),(26,4440,'Interest',5),(28,4460,'Captial Investment',4),(29,5000,'COST OF GOODS SOLD',1),(30,5010,'Consulting Expenses',6),(31,5020,'Parts Purchased',6),(32,5600,'GENERAL & ADMINISTRATIVE EXPENSES',1),(33,5610,'Accounting & Legal',6),(34,5611,'Shareholder/Employee Withdrawals',6),(35,5612,'Webhosting',6),(36,5615,'Advertising & Promotions',6),(37,5620,'Bad Debts',6),(38,5680,'Taxes',6),(39,5681,'Withholding Tax',6),(40,5685,'Insurance',6),(41,5690,'Interest & Bank Charges',6),(42,5700,'Office Supplies',6),(43,5760,'Rent',6),(44,5765,'Repair & Maintenance',6),(45,5785,'Travel & Entertainment',6),(46,5790,'Utilities',6),(47,5800,'Colocation Hosting',6),(48,5810,'Foreign Exchange Loss',6),(49,5820,'Training/Conferences',6),(50,5830,'Shipping',6),(51,1840,'Furniture',2);
UNLOCK TABLES;

--
-- Table structure for table `account_charts_menus`
--

CREATE TABLE `account_charts_menus` (
  `id` int(11) NOT NULL auto_increment,
  `chartid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_charts_menus`
--

LOCK TABLES `account_charts_menus` WRITE;
INSERT INTO `account_charts_menus` VALUES (1,2,6),(2,2,9),(3,3,6),(4,3,9),(7,5,6),(8,5,9),(9,6,1),(10,12,8),(11,14,7),(12,15,9),(13,16,3),(14,18,2),(15,19,2),(16,20,2),(17,21,2),(18,22,2),(19,24,2),(20,30,8),(21,31,8),(22,33,8),(23,34,8),(24,35,8),(25,36,8),(26,40,8),(27,42,8),(28,43,8),(29,44,8),(30,45,8),(31,46,8),(32,47,8),(33,49,8),(34,50,8),(35,10,8);
UNLOCK TABLES;

--
-- Table structure for table `account_gl`
--

CREATE TABLE `account_gl` (
  `id` int(11) NOT NULL auto_increment,
  `locked` tinyint(1) NOT NULL default '0',
  `code_gl` varchar(255) NOT NULL,
  `date_trans` date NOT NULL default '0000-00-00',
  `employeeid` int(11) NOT NULL default '0',
  `description` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_gl`
--


--
-- Table structure for table `account_items`
--

CREATE TABLE `account_items` (
  `id` int(11) NOT NULL auto_increment,
  `invoiceid` int(11) NOT NULL default '0',
  `invoicetype` varchar(6) NOT NULL,
  `type` varchar(10) NOT NULL,
  `customid` int(11) NOT NULL default '0',
  `chartid` int(11) NOT NULL default '0',
  `quantity` float NOT NULL default '0',
  `units` varchar(10) NOT NULL,
  `amount` decimal(11,2) NOT NULL default '0.00',
  `price` decimal(11,2) NOT NULL default '0.00',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_items`
--

--
-- Table structure for table `account_items_options`
--

CREATE TABLE `account_items_options` (
  `id` int(11) NOT NULL auto_increment,
  `itemid` int(11) NOT NULL default '0',
  `option_name` varchar(20) NOT NULL,
  `option_value` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_items_options`
--


--
-- Table structure for table `account_quotes`
--

CREATE TABLE `account_quotes` (
  `id` int(11) NOT NULL auto_increment,
  `customerid` int(11) NOT NULL default '0',
  `employeeid` int(11) NOT NULL default '0',
  `code_quote` varchar(255) NOT NULL,
  `date_trans` date NOT NULL default '0000-00-00',
  `date_validtill` date NOT NULL default '0000-00-00',
  `date_create` date NOT NULL default '0000-00-00',
  `date_sent` date NOT NULL default '0000-00-00',
  `sentmethod` varchar(10) NOT NULL,
  `amount_total` decimal(11,2) NOT NULL default '0.00',
  `amount_tax` decimal(11,2) NOT NULL default '0.00',
  `amount` decimal(11,2) NOT NULL default '0.00',
  `notes` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_quotes`
--


--
-- Table structure for table `account_taxes`
--

CREATE TABLE `account_taxes` (
  `id` int(11) NOT NULL auto_increment,
  `name_tax` varchar(255) NOT NULL,
  `chartid` int(11) NOT NULL default '0',
  `taxrate` float NOT NULL default '0',
  `taxnumber` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_taxes`
--


--
-- Table structure for table `account_trans`
--

CREATE TABLE `account_trans` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(6) NOT NULL,
  `customid` int(11) NOT NULL default '0',
  `chartid` int(11) NOT NULL default '0',
  `date_trans` date NOT NULL default '0000-00-00',
  `amount_debit` decimal(11,2) NOT NULL default '0.00',
  `amount_credit` decimal(11,2) NOT NULL default '0.00',
  `source` varchar(255) NOT NULL,
  `memo` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_trans`
--


--
-- Table structure for table `billing_cycles`
--

CREATE TABLE `billing_cycles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `billing_cycles`
--

LOCK TABLES `billing_cycles` WRITE;
INSERT INTO `billing_cycles` VALUES (1,'monthly','Bill the customer every month since the start date'),(2,'6monthly','Bill the customer every 6 months since the start date.'),(3,'yearly','Bill the customer once a year on the start date');
UNLOCK TABLES;

--
-- Table structure for table `billing_modes`
--

CREATE TABLE `billing_modes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `billing_modes`
--

LOCK TABLES `billing_modes` WRITE;
INSERT INTO `billing_modes` VALUES (1,'periodend','Service is billed after it has been delivered.'),(2,'periodadvance','Service is billed in advance (before the service period has started)'),(3,'monthend','Service is billed after it has been delivered, with every period ending on the last day of the month.'),(4,'monthadvance','Service is billed in advance of the month beginning. The billing period will always end on the last date of the month.');
UNLOCK TABLES;

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
INSERT INTO `config` VALUES ('ACCOUNTS_AP_INVOICENUM','100'),('ACCOUNTS_AR_INVOICENUM','100'),('ACCOUNTS_GL_LOCK','0'),('ACCOUNTS_GL_TRANSNUM','100'),('ACCOUNTS_INVOICE_AUTOEMAIL','disabled'),('ACCOUNTS_INVOICE_LOCK','0'),('ACCOUNTS_QUOTES_NUM','100'),('ACCOUNTS_SERVICES_ADVANCEBILLING','28'),('ACCOUNTS_TERMS_DAYS','20'),('APP_PDFLATEX','/usr/bin/pdflatex'),('BLACKLIST_ENABLE','enabled'),('BLACKLIST_LIMIT','10'),('CODE_ACCOUNT','1000'),('CODE_CUSTOMER','100'),('CODE_PRODUCT','100'),('CODE_PROJECT','100'),('CODE_STAFF','100'),('CODE_VENDOR','100'),('COMPANY_ADDRESS1_CITY','Example City'),('COMPANY_ADDRESS1_COUNTRY','Example Country'),('COMPANY_ADDRESS1_STATE',''),('COMPANY_ADDRESS1_STREET','54a Stallman Lane\r\nFreeburbs'),('COMPANY_ADDRESS1_ZIPCODE','0000'),('COMPANY_CONTACT_EMAIL','accounts@example.com'),('COMPANY_CONTACT_FAX','00-11-111-1112'),('COMPANY_CONTACT_PHONE','00-11-111-1111'),('COMPANY_NAME','Example Ltd'),('COMPANY_PAYMENT_DETAILS','Please pay all invoices by direct transfer to XX-XXXX-XXXXXXX.'),('CURRENCY_DEFAULT_NAME','NZD'),('CURRENCY_DEFAULT_SYMBOL','$'),('CURRENCY_DEFAULT_SYMBOL_POSITION','before'),('DATA_STORAGE_LOCATION','use_database'),('DATA_STORAGE_METHOD','database'),('DATEFORMAT','yyyy-mm-dd'),('EMAIL_ENABLE','enabled'),('JOURNAL_LOCK','0'),('LANGUAGE_DEFAULT','en_us'),('LANGUAGE_LOAD','preload'),('SCHEMA_VERSION','20090817'),('SUBSCRIPTION_ID','0'),('SUBSCRIPTION_SUPPORT','none'),('TIMESHEET_BOOKTOFUTURE','disabled'),('TIMESHEET_LOCK','0'),('TIMEZONE_DEFAULT','SYSTEM'),('UPLOAD_MAXBYTES','5242880');
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL auto_increment,
  `code_customer` varchar(50) NOT NULL,
  `name_customer` varchar(255) NOT NULL,
  `name_contact` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_phone` varchar(255) NOT NULL,
  `contact_fax` varchar(255) NOT NULL,
  `date_start` date NOT NULL default '0000-00-00',
  `date_end` date NOT NULL default '0000-00-00',
  `tax_number` varchar(255) NOT NULL default '0',
  `tax_default` int(11) NOT NULL default '0',
  `address1_street` varchar(255) NOT NULL,
  `address1_city` varchar(255) NOT NULL,
  `address1_state` varchar(255) NOT NULL,
  `address1_country` varchar(255) NOT NULL,
  `address1_zipcode` int(11) NOT NULL default '0',
  `address2_street` varchar(255) NOT NULL,
  `address2_city` varchar(255) NOT NULL,
  `address2_state` varchar(255) NOT NULL,
  `address2_country` varchar(255) NOT NULL,
  `address2_zipcode` int(11) NOT NULL default '0',
  `discount` float NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--


--
-- Table structure for table `customers_taxes`
--

CREATE TABLE `customers_taxes` (
  `id` int(11) NOT NULL auto_increment,
  `customerid` int(11) NOT NULL,
  `taxid` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers_taxes`
--


--
-- Table structure for table `file_upload_data`
--

CREATE TABLE `file_upload_data` (
  `id` int(11) NOT NULL auto_increment,
  `fileid` int(11) NOT NULL default '0',
  `data` blob NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Table for use as database-backed file storage system';

--
-- Dumping data for table `file_upload_data`
--

LOCK TABLES `file_upload_data` WRITE;
INSERT INTO `file_upload_data` VALUES (1,1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0�\0\0\0<\0\0\0r���\0\0\0sRGB\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME�+x3�S\0\0\0tEXtComment\0Created with The GIMP�d%n\0\0\r�IDATx��y|T�ǿ�IB6�cRH$���\0	���Z����T����UiU�Z�nAA�E����-X,�ZdkX�\"��@\"� d�/��Lx��L&�,$���|�\'�ｹ�����sϽs�V��\ZEiS�i(�\nSQ���0EQa*�\nSQ���0EQa*���T��(́���Q\r?���lЧ�T�A`���z\Z~��_F�� ��H������Nx�-5�Y��i�\n� ����¬���UX�G��+6����1j1�UY�^x�Hw�����1E-f��/�l�>1E��*�a��C��`�������E����}�C�Ng�eD\r���,A{��*OB�^8�\n�΃�c��%�-�7]�B(X���|+OB�R8�8���B{C�cy5�à�����Puƽ��7�����pb)t��3Bҁ\Zpl��� ��?��8�?j���$TA�>8�rgC��fo/,�/r �K�87N���C�������W�\no�rA�?�I���íCU�-Ky��&�Qc_�Pظʎ8�.�/��D㜼�(Q׺�o/�-r0$<97Ict%�c��wC�Cq��Er|��}�:���k�0�	���A�wa�`�.u)g�5���	\'A�Kk [�P�}\'�HO#~t�\r�`�P�������q��f}�_�����/.s�?�Tͥ�p�����JX�C�O���@��D���X�>�j9�D^%����K�C�P���XEY��N��*W���\n����=ޅ/S붜�$<\0�����C����*J3��}pd��r�^��ƈ�<��ϡ�$H����s�����߃m�A�Vo>͵�ҕwVBh�\n�w2��}���\"F�i�]�@��+�\ZH�ʎA�iP��v��j�5ϲ��o����nX)� �i��W+Ύ��t��`���px&TC�t��g��)�]���t�a�r��	�\n�]p�Qq��8�1��IO��7��TßA��e(�̉e�w����~��.�RO�BMy�4�;��e=d�d�f�S���&��������{ �������\'T�-O�a�X��7c_�w7p��������wxη�����}Ԉ!�_SU	��\Z(;���������aP]b��I��Cӑ��7��!�Am��h3T|#����p#{�ky��3����3\Z��%]Y\0�n�.���J�������XG\r�Q@Q�U����ў?�`T�,-��I�K��L��ɐ9�6�݅1�Y����w6� ��F���׼�B�Lth��uK���%�X������rC��}NW��(���ǵ���f�\n�n���~�� Q��	3�j�.D�u����0k?�L�lT�t�KL.�e-}R�_\Zlܣ���a^��_�}��!�\n�Y>s����:L�.3�Mm����q�lE���ҿ��������dFEH�M/�N�=����t� ��u�Z�鸺�i��ϻ�b��~ڼ����9�\"f����5�+b�W���2]����Q�ᐺAި��c�K?��c޶F6{X�6�\n�w[`�@�����w��$*{�[���c��Xӥ�$�Xl�x��@�_��{�ذ�>���a��Ր�N��+�k��	��r���:n����%�س��ˌ(g���i*�β~.�k:�U�\0aYm���G\0vq_���l=�(۷|�lr���@��z�l �/��@�ޭ���)����o�#:D\Z�N;��mm�I����]���uu��$�إ���W�]�}��z�ׅ���;������N��\rW5��y��շ|����r�\r�Cf]�Z�x�|1`����Ll���+�wV����<�j�a����q3�3��(�����R��������ˠtm��/��\0gݮ���s\\䌭�B�Ű9��|��j]bGB�z8��SD�\r�S�&	Se�_�1�b�\0�����c?��[Ǝ4��OA���s�񏆰�(ak����������~]#����Vn�k[�^������q��mZL_H~Ҙ�Pq�:m�(5\r[�t�ԹF��o���	\0	�!f��o�_�v�?��s@$�vweY��Ac�u�t	ą�ʴ�2�(,�EE	з��A1+,�.����dr��ba�e*̖#�Z�x�u�W��㇕�d ������ ~����b���`�P�Uۭ�v�S{z���\n�r�l(U�a�p�3��X܊B8��S�F-��O��w@�$i���I��W��@f�e��9ЩC�o�6�>��)�w�U�s<O\nhm�-	�C�!S��vIs�P���+�݆�BW.=�\"A��`��uHH]�k��E�\n \r�h�l�+�9���<�ՇC|�g�l穩PE��(����íS����u��TZG�ց�����0EQa*�\nSQ���0a�k�|#G��u2�EX��{�������Qa*眪��~���R��X7��|\Zr�\n��?ì%�������[�g�~���O��	�1N�7ܸ�����B�3�z+,]O/��&B�Ͱ�k^σ�wC�=p��6�7�p���k���y���i�C�{�l�\\�=��CsݭrC����C���SYSՕo\na�4H�K�}�V�(M�k<Eҍ)�!HM\0��{�4��p���.�g�|3|l*s��omݝ��F���2���\Z���oHFӏ��a0|9�����/[-X�X��\Z�����t�����©�����M����M��O}E�D��Gx{��x�TVɄ�M���L����%��D(+o��<�����x�v�:�2��\r;��9Y���qߓk;B��1�/�\0#.��n\Z�U$t�g�x:��T���������ֺSa6Y�\"��h��K���\"��7���XԞc��������ϛd�Bu5�t��v]����ۆ��eԲj3��U�s7��[8iZ(���J#����|�)�r=�z3�O+����t3L���ox������K���h�[��������^��Z��p��.G_����D���\0�����]��ڗ�;K�7帙1�����K�!z����g]�]���Bu\r��\r!~;�no����r==����5��O�����o��_\\\n���c�/������7�j�%��^��b�[���7�bT|S��r�X\\#�7�����b�\Z4Y\r�M+�_�	�Z�_u1��5��^O�	���\0��܏͒:)���FԖ��Uby}e�V��o��9���E��?kڳTaz�g+��{@\\�X�ڔ�����{a�}��^(<#V�1���f-��Le̾Vm�@K�]�pe���4	^�@��9����i	�\\1U����gM��%.���/O�7?��ϛK�W�iuc��Ms��$�}���u���ԥE�#s���q���L^�6|�/��!�~I�����7Z��d�؊Jn\'p����\\�}LEQa*���TE��(*LEQT����T�e�����2\Z�\0\0\0\0IEND�B`�');
UNLOCK TABLES;

--
-- Table structure for table `file_uploads`
--

CREATE TABLE `file_uploads` (
  `id` int(11) NOT NULL auto_increment,
  `customid` int(11) NOT NULL default '0',
  `type` varchar(20) NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL default '0',
  `file_name` varchar(255) NOT NULL,
  `file_size` varchar(255) NOT NULL,
  `file_location` char(2) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `file_uploads`
--

LOCK TABLES `file_uploads` WRITE;
INSERT INTO `file_uploads` VALUES (1,0,'COMPANY_LOGO',1234659343,'company_logo.png','3640','db');
UNLOCK TABLES;

--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `id` int(11) NOT NULL auto_increment,
  `locked` tinyint(1) NOT NULL default '0',
  `journalname` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `userid` int(11) NOT NULL default '0',
  `customid` int(11) NOT NULL default '0',
  `timestamp` bigint(20) unsigned NOT NULL default '0',
  `content` text NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `journalname` (`journalname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL auto_increment,
  `language` varchar(20) NOT NULL,
  `label` varchar(255) NOT NULL,
  `translation` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `language` (`language`),
  KEY `label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
INSERT INTO `language` VALUES (1,'en_us','name_customer','Customer Name'),(2,'en_us','name_contact','Contact Name'),(4,'en_us','customer_view','Customer Details'),(5,'en_us','address_billing','Billing Address'),(6,'en_us','address_shipping','Shipping Address'),(7,'en_us','id_customer','Customer ID'),(8,'en_us','submit','Save Information'),(9,'en_us','username_amberdms_bs','Username'),(10,'en_us','password_amberdms_bs','Password'),(11,'en_us','name_staff','Employee Name'),(12,'en_us','filter_date_start','Start Date'),(13,'en_us','filter_date_end','End Date'),(14,'en_us','filter_employee_id','Employee'),(15,'en_us','filter_customerid','Customer'),(16,'en_us','filter_hide_closed','Hide Options'),(17,'en_us','code_invoice','Invoice Number'),(18,'en_us','code_ordernumber','Order Number'),(19,'en_us','code_ponumber','PO Number'),(20,'en_us','date_trans','Transaction Date'),(21,'en_us','date_due','Date Due'),(22,'en_us','amount_tax','Amount of Tax'),(23,'en_us','amount_total','Total Amount'),(24,'en_us','amount_paid','Amount Paid'),(25,'en_us','sent','Sent'),(26,'en_us','filter_employeeid','Employee'),(27,'en_us','amount','Amount'),(28,'en_us','customerid','Customer'),(29,'en_us','employeeid','Employee'),(30,'en_us','dest_account','Destination Account'),(31,'en_us','notes','Notes/Details'),(32,'en_us','ar_invoice_details','AR Invoice Details'),(33,'en_us','ar_invoice_financials','AR Invoice Financials'),(34,'en_us','ar_invoice_other','AR Invoice Additional Details'),(35,'en_us','item_info','Item Information'),(36,'en_us','price','Price'),(37,'en_us','qnty','Qnty'),(38,'en_us','quantity','Quantity'),(39,'en_us','units','Units'),(40,'en_us','description','Description'),(41,'en_us','name_tax','Tax Name'),(42,'en_us','chartid','Account'),(43,'en_us','ar_invoice_item','AR Invoice Item Details'),(44,'en_us','timegroupid','Time Group'),(45,'en_us','productid','Product'),(46,'en_us','account','Account'),(47,'en_us','source','Source'),(48,'en_us','filter_title_search','Search Title'),(49,'en_us','filter_content_search','Search Content'),(50,'en_us','filter_hide_events','Hide Options'),(51,'en_us','ar_invoice_delete','Delete AR Invoice'),(52,'en_us','name_vendor','Vendor Name'),(53,'en_us','filter_vendorid','Vendor'),(54,'en_us','ap_invoice_details','AP Invoice Details'),(55,'en_us','ap_invoice_financials','AP Invoice Financials'),(56,'en_us','ap_invoice_other','AP Invoice Additional Details'),(57,'en_us','ap_invoice_item','AP Invoice Item Details'),(58,'en_us','ap_invoice_delete','Delete AP Invoice'),(59,'en_us','quote_details','Quote Details'),(60,'en_us','quote_other','Quote Additional Details'),(61,'en_us','quotes_invoice_item','Quote Item Details'),(62,'en_us','quote_delete','Delete Quote'),(63,'en_us','quote_convert_details','AR Invoice Details'),(64,'en_us','quote_convert_financials','AR Invoice Financials'),(65,'en_us','journal_edit','Journal Entry Details'),(66,'en_us','title','Entry Title'),(67,'en_us','contents','Entry Content/Details'),(68,'en_us','upload','File to Upload'),(69,'en_us','code_quote','Quote Number'),(70,'en_us','delete_confirm','Confirm Deletion'),(71,'en_us','date_validtill','Expiry Date'),(72,'en_us','taxrate','Tax Rate'),(73,'en_us','taxnumber','Tax Number'),(74,'en_us','tax_details','Tax Details'),(75,'en_us','tax_delete','Delete Tax'),(76,'en_us','filter_mode','Mode'),(77,'en_us','code_chart','Account ID'),(78,'en_us','chart_type','Account Type'),(79,'en_us','debit','Debit'),(80,'en_us','credit','Credit'),(81,'en_us','chart_details','Account Details'),(82,'en_us','chart_delete','Delete Account'),(83,'en_us','memo','Memo/Details'),(84,'en_us','item_id','Transaction ID'),(85,'en_us','code_reference','Transaction ID'),(86,'en_us','filter_search','Search'),(87,'en_us','general_ledger_transaction_details','GL Transaction Details'),(88,'en_us','code_gl','Transaction ID'),(89,'en_us','filter_searchbox','Search'),(90,'en_us','code_customer','Customer ID'),(91,'en_us','contact_phone','Phone Number'),(92,'en_us','contact_email','Email Address'),(93,'en_us','contact_fax','Fax Number'),(94,'en_us','date_start','Start Date'),(95,'en_us','date_end','End Date'),(96,'en_us','tax_number','Tax Number'),(97,'en_us','address1_street','Street'),(98,'en_us','address1_city','City'),(99,'en_us','address1_state','State'),(100,'en_us','address1_country','Country'),(101,'en_us','address1_zipcode','Zipcode'),(102,'en_us','address2_street','Street'),(103,'en_us','address2_city','City'),(104,'en_us','address2_state','State'),(105,'en_us','address2_country','Country'),(106,'en_us','address2_zipcode','Zipcode'),(107,'en_us','filter_hide_ex_customers','Hide Options'),(108,'en_us','tax_default','Default Tax'),(109,'en_us','customer_taxes','Customer Tax Options'),(110,'en_us','name_service','Service Name'),(111,'en_us','active','Active'),(112,'en_us','typeid','Type'),(113,'en_us','date_period_next','Next Period'),(114,'en_us','label','translation'),(115,'en_us','service_edit','Service Details'),(116,'en_us','service_add','Service Details'),(117,'en_us','service_billing','Service Billing Details'),(118,'en_us','customer_delete','Delete Customer'),(119,'en_us','name_service','Service Name'),(120,'en_us','active','Active'),(121,'en_us','typeid','Type'),(122,'en_us','date_period_next','Next Period'),(123,'en_us','label','translation'),(124,'en_us','service_edit','Service Details'),(125,'en_us','service_add','Service Details'),(126,'en_us','service_billing','Service Billing Details'),(127,'en_us','customer_delete','Delete Customer'),(128,'en_us','paid','Paid'),(129,'en_us','invoiced','Invoiced'),(130,'en_us','service_delete','Delete Service'),(131,'en_us','code_vendor','Vendor ID'),(132,'en_us','filter_hide_ex_vendors','Hide Options'),(133,'en_us','vendor_taxes','Vendor Tax Options'),(134,'en_us','vendor_view','Vendor Details'),(135,'en_us','vendor_delete','Delete Vendor'),(136,'en_us','staff_code','Employee ID'),(137,'en_us','staff_position','Employee Position'),(138,'en_us','filter_hide_ex_employees','Hide Options'),(139,'en_us','staff_view','Employee Details'),(140,'en_us','staff_delete','Delete Employee'),(141,'en_us','code_product','Product ID'),(142,'en_us','name_product','Product Name'),(143,'en_us','account_sales','Sales Account'),(144,'en_us','price_cost','Cost Price'),(145,'en_us','price_sale','Sale Price'),(146,'en_us','date_current','Current Date'),(147,'en_us','quantity_instock','Quantity Instock'),(148,'en_us','paid','Paid'),(149,'en_us','invoiced','Invoiced'),(150,'en_us','service_delete','Delete Service'),(151,'en_us','code_vendor','Vendor ID'),(152,'en_us','filter_hide_ex_vendors','Hide Options'),(153,'en_us','vendor_taxes','Vendor Tax Options'),(154,'en_us','vendor_view','Vendor Details'),(155,'en_us','vendor_delete','Delete Vendor'),(156,'en_us','staff_code','Employee ID'),(157,'en_us','staff_position','Employee Position'),(158,'en_us','filter_hide_ex_employees','Hide Options'),(159,'en_us','staff_view','Employee Details'),(160,'en_us','staff_delete','Delete Employee'),(161,'en_us','code_product','Product ID'),(162,'en_us','name_product','Product Name'),(163,'en_us','account_sales','Sales Account'),(164,'en_us','price_cost','Cost Price'),(165,'en_us','price_sale','Sale Price'),(166,'en_us','date_current','Current Date'),(167,'en_us','quantity_instock','Quantity Instock'),(168,'en_us','quantity_vendor','Vendor\'s Stock Quantity'),(169,'en_us','product_view','Product Details'),(170,'en_us','product_pricing','Product Pricing'),(171,'en_us','product_quantity','Product Stock'),(172,'en_us','product_supplier','Supplier Details'),(173,'en_us','code_product_vendor','Vendor Product ID'),(174,'en_us','product_delete','Delete Product'),(175,'en_us','included_units','Units Included'),(176,'en_us','price_extraunits','Price (per extra unit)'),(177,'en_us','billing_cycle','Billing Cycle'),(178,'en_us','service_details','Service Details'),(179,'en_us','service_plan','Service Plan Details'),(180,'en_us','service_plan_custom','Service Plan Options'),(181,'en_us','billing_mode','Billing Mode'),(182,'en_us','code_project','Project ID'),(183,'en_us','filter_hide_ex_projects','Hide Options'),(184,'en_us','details','details'),(185,'en_us','project_view','Project Details'),(186,'en_us','name_phase','Phase Name'),(187,'en_us','phase_edit','Phase Details'),(188,'en_us','date','Date'),(189,'en_us','time_group','Time Group'),(190,'en_us','time_booked','Time Booked'),(191,'en_us','filter_phaseid','Phase Name'),(192,'en_us','phaseid','Phase Name'),(193,'en_us','timereg_day','Day Time Booking'),(194,'en_us','filter_no_group','Hide Options'),(195,'en_us','time_billed','Billable Hours'),(196,'en_us','time_not_billed','Unbillable Hours'),(197,'en_us','timebilled_details','Time Group Details'),(198,'en_us','timebilled_selected','Time Group Registered Hours'),(199,'en_us','name_group','Time Group Name'),(200,'en_us','time_bill','Billable'),(201,'en_us','time_nobill','Unbillable'),(202,'en_us','project_delete','Delete Project'),(203,'en_us','name_project','Project Name'),(204,'en_us','projectandphase','Project/Phase'),(205,'en_us','priority','Priority'),(206,'en_us','filter_hide_ex_tickets','Hide Options'),(207,'en_us','status','Status'),(208,'en_us','code_support_ticket','Ticket ID'),(209,'en_us','support_ticket_details','Ticket Details'),(210,'en_us','support_ticket_status','Ticket Status'),(211,'en_us','support_delete','Delete Ticket'),(212,'en_us','username','Username'),(213,'en_us','realname','Realname'),(214,'en_us','password','Password'),(215,'en_us','password_confirm','Password - Confirm'),(216,'en_us','time','Time'),(217,'en_us','ipaddress','IP Address'),(218,'en_us','option_lang','Languages'),(219,'en_us','option_debug','Debugging'),(220,'en_us','user_view','User Details'),(221,'en_us','user_password','User Authentication'),(222,'en_us','user_info','User Information'),(223,'en_us','user_options','Account Options'),(224,'en_us','lastlogin_time','Lastlogin Time'),(225,'en_us','lastlogin_ipaddress','Lastlogin IP Address'),(226,'en_us','id_user','User ID'),(227,'en_us','user_permissions','User Permissions'),(228,'en_us','user_permissions_staff','User Staff Access Rights'),(229,'en_us','user_delete','Delete User Account'),(230,'en_us','blacklist_control','Blacklist Options'),(231,'en_us','blacklist_enable','Enable Blacklisting'),(232,'en_us','blacklist_limit','Max authentication attempts'),(233,'en_us','date_period_first','First Period'),(234,'en_us','option_dateformat','Date Format'),(235,'en_us','option_timezone','Timezone'),(236,'en_us','general_ledger_transaction_rows','GL Transaction Rows'),(237,'en_us','vendorid','Vendor'),(238,'en_us','tax_setup_options','Tax Setup Options'),(239,'en_us','ar_invoice_item_tax','AR Invoice Item Tax Selection'),(240,'en_us','ap_invoice_item_tax','AP Invoice Item Tax Selection'),(241,'en_us','instance_amberdms_bs','Customer Instance ID'),(242,'en_us','user_permissions_selectstaff','User Staff Configuration'),(243,'en_us','id_staff','Employee'),(244,'en_us','auditlock','Audit Locking'),(245,'en_us','date_lock','Lock Before'),(246,'en_us','content','Content'),(247,'en_us','content','Content'),(248,'en_us','option_shrink_tableoptions','Table Options Feature'),(249,'en_us','option_concurrent_logins','Concurrent Logins'),(250,'en_us','tbl_lnk_details','details'),(251,'en_us','tbl_lnk_permissions','permissions'),(252,'en_us','tbl_lnk_staffaccess','staffaccess'),(253,'en_us','tbl_lnk_timesheet','timesheet'),(254,'en_us','tbl_lnk_view_timeentry','View Time Entry'),(255,'en_us','date_as_of','Date as of'),(256,'en_us','mode','Mode'),(257,'en_us','service_tax','Service Tax'),(258,'en_us','usage_mode','Usage Mode'),(259,'en_us','serviceid','Service Plan'),(260,'en_us','timebilled_selection','Time Selection'),(261,'en_us','filter_groupby','Group By'),(262,'en_us','sender','Sender'),(263,'en_us','subject','Subject'),(264,'en_us','email_to','Email (To)'),(265,'en_us','email_message','Email Message'),(266,'en_us','email_cc','Email (CC)'),(267,'en_us','email_bcc','Email (BCC)'),(268,'en_us','account_purchase','Purchase Account'),(269,'en_us','description_useall','Description Useall'),(270,'en_us','general_ledger_transaction_submit','GL Transaction Submit'),(271,'en_us','invoice_gen_date','Invoice Gen Date'),(272,'en_us','services_customers_id','Service-Customer Assignment ID'),(273,'en_us','alert_extraunits','Alert for every specified number of extra units'),(274,'en_us','service_plan_alerts','Service Plan Alerts'),(275,'en_us','usage_summary','Usage Summary'),(276,'en_us','internal_only','Internal Only'),(277,'en_us','id_support_ticket','Ticket ID'),(278,'en_us','discount','Discount'),(279,'en_us','customer_purchase','Customer Purchase Options'),(280,'en_us','vendor_purchase','Vendor Purchase Options'),(281,'en_us','service_options_licenses','Service Options'),(282,'en_us','filter_hide_ex_products','Hide EOL Products'),(283,'en_us','option_default_employeeid','Default Employee'),(284,'en_us','taxid','Tax ID'),(285,'en_us','manual_option','Manual Option'),(286,'en_us','manual_amount','Manual Amount');
UNLOCK TABLES;

--
-- Table structure for table `language_avaliable`
--

CREATE TABLE `language_avaliable` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(5) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language_avaliable`
--

LOCK TABLES `language_avaliable` WRITE;
INSERT INTO `language_avaliable` VALUES (1,'en_us');
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL auto_increment,
  `priority` int(11) NOT NULL default '0',
  `parent` varchar(50) NOT NULL,
  `topic` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `permid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
INSERT INTO `menu` VALUES (1,210,'Customers','View Customers','customers/customers.php',3),(2,220,'Customers','Add Customer','customers/add.php',4),(4,1,'top','Overview','home.php',0),(5,200,'top','Customers','customers/customers.php',3),(6,300,'top','Vendors/Suppliers','vendors/vendors.php',5),(7,400,'top','Human Resources','hr/staff.php',7),(12,211,'View Customers','','customers/view.php',0),(13,100,'top','Accounts','accounts/accounts.php',0),(14,500,'top','Products/Services/Projects','products/main.php',0),(15,700,'top','Time Keeping','timekeeping/timekeeping.php',17),(16,800,'top','Support Tickets','support/support.php',9),(17,310,'Vendors/Suppliers','View Vendors','vendors/vendors.php',5),(18,320,'Vendors/Suppliers','Add Vendor','vendors/add.php',6),(19,311,'View Vendors','','vendors/view.php',5),(21,410,'Human Resources','View Staff','hr/staff.php',7),(22,420,'Human Resources','Add Staff','hr/staff-add.php',8),(23,411,'View Staff','','hr/staff-view.php',7),(24,810,'Support Tickets','View Tickets','support/support.php',9),(25,820,'Support Tickets','Add Ticket','support/add.php',10),(26,510,'Products/Services/Projects','Products','products/products.php',11),(27,511,'Products','View Products','products/products.php',11),(28,512,'Products','Add Product','products/add.php',12),(29,501,'Products/Services/Projects','','products/main.php',0),(30,514,'Products','','products/products.php',11),(31,520,'Products/Services/Projects','Services','services/services.php',13),(32,521,'Services','','services/services.php',13),(33,522,'Services','View Services','services/services.php',13),(34,523,'View Services','','services/view.php',13),(35,524,'Services','Add Service','services/add.php',14),(36,513,'View Products','','products/view.php',11),(37,530,'Products/Services/Projects','Projects','projects/projects.php',15),(38,531,'Projects','','projects/projects.php',15),(39,533,'View Projects','','projects/view.php',15),(40,534,'Projects','Add Project','projects/add.php',16),(41,532,'Projects','View Projects','projects/projects.php',15),(42,701,'Time Keeping','','timekeeping/timekeeping.php',17),(43,710,'Time Keeping','Time Registration','timekeeping/timereg.php',17),(44,720,'Time Keeping','Unbilled Time','timekeeping/unbilled.php',32),(46,535,'View Projects','','projects/phases.php',15),(47,536,'View Projects','','projects/timebooked.php',15),(48,900,'top','Admin','admin/admin.php',2),(49,910,'Admin','User Management','user/users.php',2),(51,930,'Admin','Brute-Force Blacklist','admin/blacklist.php',2),(52,901,'Admin','','admin/admin.php',2),(53,911,'User Management','','user/users.php',2),(54,912,'User Management','View Users','user/users.php',2),(55,913,'User Management','Add User','user/user-add.php',2),(56,914,'View Users','','user/user-view.php',2),(57,915,'View Users','','user/user-permissions.php',2),(58,916,'View Users','','user/user-staffaccess.php',2),(60,811,'View Tickets','','support/view.php',9),(61,213,'View Customers','','customers/journal.php',3),(62,214,'View Customers','','customers/journal-edit.php',3),(63,812,'View Tickets','','support/journal.php',9),(64,812,'View Tickets','','support/journal-edit.php',9),(65,312,'View Vendors','','vendors/journal.php',5),(66,313,'View Vendors','','vendors/journal-edit.php',5),(67,412,'View Staff','','hr/staff-journal.php',7),(68,413,'View Staff','','hr/staff-journal-edit.php',7),(69,917,'View Users','','user/user-journal.php',2),(70,918,'View Users','','user/user-journal-edit.php',2),(71,537,'View Projects','','projects/journal.php',15),(72,538,'View Projects','','projects/journal-edit.php',15),(73,514,'View Products','','products/journal.php',11),(74,514,'View Products','','products/journal-edit.php',11),(75,101,'Accounts','','accounts/accounts.php',0),(76,110,'Accounts','Chart of Accounts','accounts/charts/charts.php',18),(77,111,'Chart of Accounts','View Accounts','accounts/charts/charts.php',18),(78,112,'Chart of Accounts','Add Account','accounts/charts/add.php',19),(79,113,'View Accounts','','accounts/charts/view.php',18),(80,916,'View Users','','user/user-staffaccess-edit.php',2),(81,120,'Accounts','Accounts Receivables','accounts/ar/ar.php',20),(82,122,'View Invoices','Add Invoice','accounts/ar/invoice-add.php',21),(84,121,'Accounts Receivables','View Invoices','accounts/ar/ar.php',20),(85,140,'Accounts','Taxes','accounts/taxes/taxes.php',22),(86,141,'Taxes','View Taxes','accounts/taxes/taxes.php',22),(87,142,'View Taxes','','accounts/taxes/view.php',22),(88,143,'Taxes','Add Taxes','accounts/taxes/add.php',23),(89,124,'View Invoices','','accounts/ar/invoice-view.php',20),(90,124,'View Invoices','','accounts/ar/journal-edit.php',20),(91,124,'View Invoices','','accounts/ar/journal.php',20),(92,113,'View Accounts','','accounts/charts/ledger.php',18),(93,124,'View Invoices','','accounts/ar/invoice-payments.php',20),(94,124,'View Invoices','','accounts/ar/invoice-items.php',20),(96,142,'View Taxes','','accounts/taxes/ledger.php',22),(97,142,'View Taxes','','accounts/taxes/tax_collected.php',22),(98,142,'View Taxes','','accounts/taxes/tax_paid.php',22),(99,130,'Accounts','Accounts Payable','accounts/ap/ap.php',24),(100,131,'Accounts Payable','View AP Invoices','accounts/ap/ap.php',24),(101,132,'Accounts Payable','Add AP Invoice','accounts/ap/invoice-add.php',25),(102,134,'View AP Invoices','','accounts/ap/invoice-delete.php',25),(103,134,'View AP Invoices','','accounts/ap/invoice-view.php',24),(104,134,'View AP Invoices','','accounts/ap/journal-edit.php',24),(105,134,'View AP Invoices','','accounts/ap/journal.php',24),(106,134,'View AP Invoices','','accounts/ap/invoice-payments.php',24),(107,134,'View AP Invoices','','accounts/ap/invoice-items.php',24),(108,536,'View Projects','','projects/timebilled.php',15),(109,536,'View Projects','','projects/timebilled-edit.php',15),(110,536,'View Projects','','projects/timebilled-delete.php',15),(111,535,'View Projects','','projects/phase-edit.php',15),(112,535,'View Projects','','projects/phase-delete.php',15),(113,711,'Time Registration','','timekeeping/timereg-day.php',17),(114,535,'View Projects','','projects/delete.php',15),(115,514,'View Products','','products/delete.php',11),(116,214,'View Customers','','customers/delete.php',3),(117,313,'View Vendors','','vendors/delete.php',5),(118,413,'View Staff','','hr/staff-delete.php',7),(119,811,'View Tickets','','support/delete.php',9),(120,142,'View Taxes','','accounts/taxes/delete.php',22),(121,918,'View Users','','user/user-delete.php',2),(122,115,'Accounts','General Ledger','accounts/gl/gl.php',26),(123,116,'General Ledger','View GL Transactions','accounts/gl/gl.php',26),(124,117,'General Ledger','Add GL Transaction','accounts/gl/add.php',27),(125,122,'Accounts Receivables','','accounts/ar/invoice-delete.php',21),(126,124,'View Invoices','','accounts/ar/invoice-items-edit.php',21),(127,124,'View Invoices','','accounts/ar/invoice-payments-edit.php',21),(128,134,'View AP Invoices','','accounts/ap/invoice-payments-edit.php',25),(129,134,'View AP Invoices','','accounts/ap/invoice-items-edit.php',25),(130,117,'View GL Transactions','','accounts/gl/view.php',26),(131,117,'View GL Transactions','','accounts/gl/delete.php',27),(132,150,'Accounts','Quotes','accounts/quotes/quotes.php',28),(133,151,'Quotes','View Quotes','accounts/quotes/quotes.php',28),(134,152,'Quotes','Add Quote','accounts/quotes/quotes-add.php',29),(135,152,'View Quotes','','accounts/quotes/quotes-delete.php',29),(136,154,'View Quotes','','accounts/quotes/quotes-view.php',28),(137,154,'View Quotes','','accounts/quotes/journal-edit.php',28),(138,154,'View Quotes','','accounts/quotes/journal.php',28),(139,154,'View Quotes','','accounts/quotes/quotes-items.php',28),(140,154,'View Quotes','','accounts/quotes/quotes-items-edit.php',29),(141,152,'View Quotes','','accounts/quotes/quotes-convert.php',29),(142,916,'View Users','','user/user-staffaccess-add.php',2),(143,523,'View Services','','services/plan.php',13),(144,523,'View Services','','services/journal.php',13),(145,523,'View Services','','services/journal-edit.php',13),(146,523,'View Services','','services/delete.php',14),(147,211,'View Customers','','customers/invoices.php',3),(148,211,'View Customers','','customers/services.php',3),(149,211,'View Customers','','customers/service-edit.php',4),(150,211,'View Customers','','customers/service-delete.php',4),(151,311,'View Vendors','','vendors/invoices.php',5),(152,211,'View Customers','','customers/service-history.php',4),(153,711,'Time Registration','','timekeeping/timereg-day-edit.php',17),(154,113,'View Accounts','','accounts/charts/delete.php',19),(155,124,'View Invoices','','accounts/ar/invoice-export.php',20),(156,154,'View Quotes','','accounts/quotes/quotes-export.php',28),(157,180,'Accounts','Reports','accounts/reports/reports.php',30),(158,181,'Reports','Trial Balance','accounts/reports/trialbalance.php',30),(159,181,'Reports','','accounts/reports/reports.php',30),(160,182,'Reports','Income Statement','accounts/reports/incomestatement.php',30),(161,183,'Reports','Balance Sheet','accounts/reports/balancesheet.php',30),(162,905,'Admin','Configuration','admin/config.php',2),(163,940,'Admin','Audit Locking','admin/auditlock.php',2),(164,411,'View Staff','','hr/staff-timebooked.php',7),(165,514,'View Products','','products/taxes.php',11),(166,514,'View Products','','products/taxes-edit.php',12);
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='Stores all the possible permissions';

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'disabled','Enabling the disabled permission will prevent the user from being able to login.'),(2,'admin','Provides access to user and configuration management features (note: any user with admin can provide themselves with access to any other section of this program)'),(3,'customers_view','Allows the user to view & search customer records'),(4,'customers_write','Allows the user to make changes to customer records or add new customers.'),(5,'vendors_view','Allows the user to view & search vendor/supplier records.'),(6,'vendors_write','Allows the user to make changes to vendor records or add new vendors.'),(7,'staff_view','Allows the user to view & search staff records.'),(8,'staff_write','Allows the user to make changes to staff records or add new employees.'),(9,'support_view','Allow the user to view support tickets.'),(10,'support_write','Allow the user to create and adjust support tickets.'),(11,'products_view','Allows the user to view & search product records'),(12,'products_write','Allows the user to make changes to product records or add new products.'),(13,'services_view','Allow the user to view configured services.'),(14,'services_write','Allow the user to modify services'),(15,'projects_view','Allows the user to view & search projects, phases and to view time booked against the project.'),(16,'projects_write','Allows the user to make changes to projects and phases or to add new projects and phases.'),(17,'timekeeping','Allows the user to view and book time using the time registration features for all the employees they have been assigned access to (see the user staff access rights page for details)'),(18,'accounts_charts_view','Allows the user to view the Chart of Accounts.'),(19,'accounts_charts_write','Allows the user to modify the Charts of Accounts, add new accounts or perform other operations.'),(20,'accounts_ar_view','Allow user to view invoices or transactions under Accounts Receivables'),(21,'accounts_ar_write','Allow user to create invoices or transactions under Accounts Receivables'),(22,'accounts_taxes_view','Allows user to view configured taxes.'),(23,'accounts_taxes_write','Allows user to adjust configured taxes.'),(24,'accounts_ap_view','Allow user to view invoices belonging to Accounts Payable'),(25,'accounts_ap_write','Allow user to create or adjust invoices belonging to Accounts Payable'),(26,'accounts_gl_view','Allows the user to view general ledger transactions'),(27,'accounts_gl_write','Allows the user to create general ledger transactions'),(28,'accounts_quotes_view','Allows user to view all quotes'),(29,'accounts_quotes_write','Allows the user to create and edit quotes'),(30,'accounts_reports','View/Create financial reports'),(31,'services_write_usage','Permit this user to upload service usage records via SOAP interface'),(32,'projects_timegroup','Permit the user to group unbilled time into groups for invoicing.'),(33,'timekeeping_all_view','Allow the user to view timesheets and unbilled for ALL staff.'),(34,'timekeeping_all_write','Allow the user to adjust for any employee.');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_staff`
--

CREATE TABLE `permissions_staff` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions_staff`
--

LOCK TABLES `permissions_staff` WRITE;
INSERT INTO `permissions_staff` VALUES (18,'timereg_view','Able to view staff member\'s booked time.'),(19,'timereg_write','Able to edit/book time for the staff member.');
UNLOCK TABLES;

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL auto_increment,
  `code_product` varchar(50) NOT NULL,
  `name_product` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `price_cost` decimal(11,2) NOT NULL default '0.00',
  `price_sale` decimal(11,2) NOT NULL default '0.00',
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `date_current` date NOT NULL default '0000-00-00',
  `quantity_instock` int(11) NOT NULL default '0',
  `quantity_vendor` int(11) NOT NULL default '0',
  `vendorid` int(11) NOT NULL default '0',
  `code_product_vendor` varchar(50) NOT NULL,
  `account_sales` int(11) NOT NULL default '0',
  `account_purchase` int(11) NOT NULL,
  `units` varchar(10) NOT NULL,
  `discount` float NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--


--
-- Table structure for table `products_taxes`
--

CREATE TABLE `products_taxes` (
  `id` int(11) NOT NULL auto_increment,
  `productid` int(11) NOT NULL,
  `taxid` int(11) NOT NULL,
  `manual_amount` decimal(11,2) NOT NULL,
  `manual_option` tinyint(1) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_taxes`
--


--
-- Table structure for table `project_phases`
--

CREATE TABLE `project_phases` (
  `id` int(11) NOT NULL auto_increment,
  `projectid` int(11) NOT NULL default '0',
  `name_phase` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_phases`
--


--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL auto_increment,
  `code_project` varchar(50) NOT NULL,
  `name_project` varchar(255) NOT NULL,
  `date_start` date NOT NULL default '0000-00-00',
  `date_end` date NOT NULL default '0000-00-00',
  `internal_only` tinyint(1) NOT NULL,
  `details` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects`
--


--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service_types`
--

LOCK TABLES `service_types` WRITE;
INSERT INTO `service_types` VALUES (1,'generic_no_usage','Generic service with no usage billing - ideal for regular, fixed price charges (eg: yearly domain name fee)'),(2,'data_traffic','Data traffic accounting - suitable for ISP services'),(3,'time','Time accounting - Suitable for use with ISP dialup accounts or other time-based services'),(4,'generic_with_usage','Generic service with usage billing.'),(5,'licenses','Ideal for services like software as a service, this service type will do regular billings with flexbile quantities of items.');
UNLOCK TABLES;

--
-- Table structure for table `service_units`
--

CREATE TABLE `service_units` (
  `id` int(11) NOT NULL auto_increment,
  `typeid` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `numrawunits` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service_units`
--

LOCK TABLES `service_units` WRITE;
INSERT INTO `service_units` VALUES (1,2,'GB','Gigabyte - 1000e3 bytes',1000000000),(2,2,'MB','Megabyte - 1000e2 bytes',1000000),(3,2,'GiB','Gibibytes - 1024e3 bytes',1073741824),(4,2,'MiB','Mebibytes - 1024e2 bytes',1048576),(5,3,'Hours','',3600);
UNLOCK TABLES;

--
-- Table structure for table `service_usage_modes`
--

CREATE TABLE `service_usage_modes` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service_usage_modes`
--

LOCK TABLES `service_usage_modes` WRITE;
INSERT INTO `service_usage_modes` VALUES (1,'incrementing','Total usage during entire period will be billed.'),(2,'peak','Highest amount of usage on any day during the period will be billed.'),(3,'average','Average amount of usage across the entire period will be billed.');
UNLOCK TABLES;

--
-- Table structure for table `service_usage_records`
--

CREATE TABLE `service_usage_records` (
  `id` int(11) NOT NULL auto_increment,
  `services_customers_id` int(11) NOT NULL default '0',
  `date` date NOT NULL default '0000-00-00',
  `usage1` bigint(20) unsigned NOT NULL default '0',
  `usage2` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service_usage_records`
--


--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL auto_increment,
  `name_service` varchar(255) NOT NULL,
  `chartid` int(11) NOT NULL default '0',
  `typeid` int(11) NOT NULL default '0',
  `units` varchar(255) NOT NULL default '0',
  `price` decimal(11,2) NOT NULL default '0.00',
  `price_extraunits` decimal(11,2) NOT NULL default '0.00',
  `included_units` int(11) NOT NULL default '0',
  `billing_cycle` int(11) NOT NULL default '0',
  `billing_mode` int(11) NOT NULL default '0',
  `usage_mode` int(11) NOT NULL default '0',
  `description` text NOT NULL,
  `alert_80pc` tinyint(4) NOT NULL,
  `alert_100pc` tinyint(4) NOT NULL,
  `alert_extraunits` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--


--
-- Table structure for table `services_customers`
--

CREATE TABLE `services_customers` (
  `id` int(11) NOT NULL auto_increment,
  `serviceid` int(11) NOT NULL default '0',
  `customerid` int(11) NOT NULL default '0',
  `active` tinyint(1) NOT NULL default '0',
  `date_period_first` date NOT NULL default '0000-00-00',
  `date_period_next` date NOT NULL default '0000-00-00',
  `quantity` int(11) NOT NULL default '0',
  `description` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services_customers`
--


--
-- Table structure for table `services_customers_options`
--

CREATE TABLE `services_customers_options` (
  `id` int(11) NOT NULL auto_increment,
  `services_customers_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services_customers_options`
--


--
-- Table structure for table `services_customers_periods`
--

CREATE TABLE `services_customers_periods` (
  `id` int(11) NOT NULL auto_increment,
  `services_customers_id` int(11) NOT NULL default '0',
  `date_start` date NOT NULL default '0000-00-00',
  `date_end` date NOT NULL default '0000-00-00',
  `date_billed` date NOT NULL default '0000-00-00',
  `invoiceid` int(11) NOT NULL default '0',
  `usage_summary` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services_customers_periods`
--


--
-- Table structure for table `services_taxes`
--

CREATE TABLE `services_taxes` (
  `id` int(11) NOT NULL auto_increment,
  `serviceid` int(11) NOT NULL,
  `taxid` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services_taxes`
--

LOCK TABLES `services_taxes` WRITE;
INSERT INTO `services_taxes` VALUES (3,1,1),(4,2,1),(5,3,1),(6,4,1),(7,5,1);
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL auto_increment,
  `name_staff` varchar(255) NOT NULL,
  `staff_code` varchar(255) NOT NULL,
  `staff_position` varchar(255) NOT NULL,
  `contact_phone` varchar(255) NOT NULL,
  `contact_fax` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `date_start` date NOT NULL default '0000-00-00',
  `date_end` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
INSERT INTO `staff` VALUES (1,'Automated System','AUTO','Automatically generated invoices will be assigned to this employee.','','','','0000-00-00','0000-00-00');
UNLOCK TABLES;

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `status` int(11) NOT NULL default '0',
  `priority` int(11) NOT NULL default '0',
  `date_start` date NOT NULL default '0000-00-00',
  `date_end` date NOT NULL default '0000-00-00',
  `customerid` int(11) NOT NULL default '0',
  `productid` int(11) NOT NULL default '0',
  `projectid` int(11) NOT NULL default '0',
  `serviceid` int(11) NOT NULL default '0',
  `details` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `support_tickets`
--

--
-- Table structure for table `support_tickets_priority`
--

CREATE TABLE `support_tickets_priority` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `support_tickets_priority`
--

LOCK TABLES `support_tickets_priority` WRITE;
INSERT INTO `support_tickets_priority` VALUES (1,'High',''),(2,'Medium',''),(3,'Low',''),(4,'Unsorted','');
UNLOCK TABLES;

--
-- Table structure for table `support_tickets_status`
--

CREATE TABLE `support_tickets_status` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `support_tickets_status`
--

LOCK TABLES `support_tickets_status` WRITE;
INSERT INTO `support_tickets_status` VALUES (1,'Reported',''),(2,'Testing',''),(3,'Closed','');
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `templates`
--


--
-- Table structure for table `time_groups`
--

CREATE TABLE `time_groups` (
  `id` int(11) NOT NULL auto_increment,
  `locked` tinyint(1) NOT NULL default '0',
  `name_group` varchar(255) NOT NULL,
  `projectid` int(11) NOT NULL default '0',
  `customerid` int(11) NOT NULL default '0',
  `description` text NOT NULL,
  `invoiceid` int(11) NOT NULL default '0',
  `invoiceitemid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `time_groups`
--


--
-- Table structure for table `timereg`
--

CREATE TABLE `timereg` (
  `id` int(11) NOT NULL auto_increment,
  `locked` tinyint(1) NOT NULL default '0',
  `employeeid` int(11) NOT NULL default '0',
  `phaseid` int(11) NOT NULL default '0',
  `groupid` int(11) NOT NULL default '0',
  `billable` tinyint(1) NOT NULL default '0',
  `date` date NOT NULL default '0000-00-00',
  `time_booked` int(11) NOT NULL default '0',
  `description` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timereg`
--


--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_salt` varchar(20) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `concurrent_logins` tinyint(1) NOT NULL default '0',
  `time` bigint(20) NOT NULL default '0',
  `ipaddress` varchar(15) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ipaddress` (`ipaddress`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='User authentication system.';

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'setup','Setup Account','f2c370789ab902f977b3e483238967a8805bd21e','rokedpf8fiv9qgxf2uc2','support@amberdms.com',1,1234659154,'10.8.5.125');
UNLOCK TABLES;

--
-- Table structure for table `users_blacklist`
--

CREATE TABLE `users_blacklist` (
  `id` int(11) NOT NULL auto_increment,
  `ipaddress` varchar(15) NOT NULL,
  `failedcount` int(11) NOT NULL default '0',
  `time` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Prevents automated login attacks.';

--
-- Dumping data for table `users_blacklist`
--


--
-- Table structure for table `users_options`
--

CREATE TABLE `users_options` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_options`
--

LOCK TABLES `users_options` WRITE;
INSERT INTO `users_options` VALUES (23,5,'lang','en_us'),(24,5,'debug','on'),(45,6,'lang','en_us'),(46,6,'dateformat','yyyy-mm-dd'),(47,6,'timezone','SYSTEM'),(48,6,'debug','disabled'),(49,5,'timezone','SYSTEM'),(63,7,'lang','en_us'),(64,7,'dateformat','yyyy-mm-dd'),(65,7,'timezone','SYSTEM'),(66,7,'debug','disabled'),(144,4,'lang','en_us'),(145,4,'dateformat','dd-mm-yyyy'),(146,4,'timezone','SYSTEM'),(147,4,'shrink_tableoptions','on'),(148,4,'debug',''),(149,4,'concurrent_logins','on'),(174,1,'lang','en_us'),(175,1,'timezone','SYSTEM'),(176,1,'dateformat','dd-mm-yyyy'),(177,1,'shrink_tableoptions',''),(178,1,'debug',''),(179,1,'concurrent_logins','on');
UNLOCK TABLES;

--
-- Table structure for table `users_permissions`
--

CREATE TABLE `users_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL default '0',
  `permid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='Stores user permissions.';

--
-- Dumping data for table `users_permissions`
--

LOCK TABLES `users_permissions` WRITE;
INSERT INTO `users_permissions` VALUES (1,1,2),(5,1,4),(6,1,3),(7,1,5),(8,1,6),(9,1,7),(10,1,8),(11,1,9),(12,1,10),(13,1,11),(14,1,12),(15,1,13),(16,1,14),(17,1,15),(18,1,16),(19,1,17),(26,1,18),(27,1,19),(28,1,20),(29,1,21),(30,1,22),(31,1,23),(32,1,24),(33,1,25),(34,1,26),(35,1,27),(36,1,28),(37,1,29),(67,1,30),(89,1,32);
UNLOCK TABLES;

--
-- Table structure for table `users_permissions_staff`
--

CREATE TABLE `users_permissions_staff` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL default '0',
  `staffid` int(11) NOT NULL default '0',
  `permid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_permissions_staff`
--


--
-- Table structure for table `users_sessions`
--

CREATE TABLE `users_sessions` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL,
  `authkey` varchar(40) NOT NULL,
  `ipaddress` varchar(15) NOT NULL,
  `time` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_sessions`
--


--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL auto_increment,
  `name_vendor` varchar(255) NOT NULL,
  `code_vendor` varchar(50) NOT NULL,
  `name_contact` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_phone` varchar(255) NOT NULL,
  `contact_fax` varchar(255) NOT NULL,
  `date_start` date NOT NULL default '0000-00-00',
  `date_end` date NOT NULL default '0000-00-00',
  `tax_default` int(11) NOT NULL default '0',
  `tax_number` varchar(255) NOT NULL default '0',
  `address1_street` varchar(255) NOT NULL,
  `address1_city` varchar(255) NOT NULL,
  `address1_state` varchar(255) NOT NULL,
  `address1_country` varchar(255) NOT NULL,
  `address1_zipcode` int(11) NOT NULL default '0',
  `address2_street` varchar(255) NOT NULL,
  `address2_city` varchar(255) NOT NULL,
  `address2_state` varchar(255) NOT NULL,
  `address2_country` varchar(255) NOT NULL,
  `address2_zipcode` int(11) NOT NULL default '0',
  `discount` float NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendors`
--


--
-- Table structure for table `vendors_taxes`
--

CREATE TABLE `vendors_taxes` (
  `id` int(11) NOT NULL auto_increment,
  `vendorid` int(11) NOT NULL,
  `taxid` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendors_taxes`
--



--
-- Additional changes (these were added in the changes between 1.3.0 BETA and 1.3.0 ACTUAL)
--

DELETE FROM `menu` WHERE `priority`='122';

INSERT INTO `menu` (`priority`, `parent`, `topic`, `link`, `permid`) VALUES
(122, 'Accounts Receivables', 'Add Invoice', 'accounts/ar/invoice-add.php', 21),
(122, 'View Invoices', '', 'accounts/ar/invoice-delete.php', 21);

INSERT INTO `menu` (`id` ,`priority` ,`parent` ,`topic` ,`link` ,`permid`) VALUES (NULL , '950', 'Admin', 'Database Backup', 'admin/db_backup.php', '2');

INSERT INTO `language` (`id` ,`language` ,`label` ,`translation`)VALUES (NULL , 'en_us', 'patch_contents', 'Patch Contents'), (NULL , 'en_us', 'patch_submit', 'Submit Patch');
INSERT INTO `language` (`id` ,`language` ,`label` ,`translation`)VALUES (NULL , 'en_us', 'patch_submit_contact', 'Author''s Email'), (NULL , 'en_us', 'patch_submit_credit','Developer to credit');
INSERT INTO `language` (`id` ,`language` ,`label` ,`translation`)VALUES (NULL , 'en_us', 'patch_description', 'Patch Description');

UPDATE config SET value='opensource' WHERE name='SUBSCRIPTION_SUPPORT';
UPDATE config SET value='' WHERE name='SUBSCRIPTION_ID';

INSERT INTO `config` (`name` ,`value`) VALUES ('PATH_TMPDIR', '/tmp');
INSERT INTO `config` (`name`, `value`) VALUES ('APP_MYSQL_DUMP', '/usr/bin/mysqldump');
INSERT INTO `config` (`name` ,`value`) VALUES ('PHONE_HOME', 'enabled');
INSERT INTO `config` (`name`, `value`) VALUES ('PHONE_HOME_TIMER', '0');


--
-- Changes from 1.3.0 to 1.4.0
--

DROP TABLE `templates`;

CREATE TABLE `templates` (`id` int(11) NOT NULL auto_increment, `active` tinyint(1) NOT NULL, `template_type` varchar(20) NOT NULL, `template_file` varchar(255) NOT NULL, `template_name` varchar(255) NOT NULL, `template_description` text NOT NULL, PRIMARY KEY  (`id`)) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

INSERT INTO `templates` (`id`, `active`, `template_type`, `template_file`, `template_name`, `template_description`) VALUES(2, 1, 'ar_invoice_tex', 'templates/ar_invoice/ar_invoice_english_default', 'English Basic (Default)', 'Basic English language invoice, includes contact details for customer, company, tax numbers, invoice items and payment details.');
INSERT INTO `templates` (`id`, `active`, `template_type`, `template_file`, `template_name`, `template_description`) VALUES(4, 0, 'ar_invoice_tex', 'templates/ar_invoice/ar_invoice_german_default', 'Deutsch Basic', 'Lokalisierte Version des Standards Amberdms Billing System Rechnung, mit der deutschen Sprache, Absender auf der linken Seite und andere kleinere Optimierungen.');
INSERT INTO `menu` (`id` ,`priority` ,`parent` ,`topic` ,`link` ,`permid`) VALUES (NULL , '908', 'Admin', 'template_selection', 'admin/templates.php', '2');
INSERT INTO `language` (`id` ,`language` ,`label` ,`translation`) VALUES (NULL , 'en_us', 'use_this_template', 'Use This Template');
INSERT INTO `language` (`id` ,`language` ,`label` ,`translation`) VALUES (NULL , 'en_us', 'template_selection', 'Template Selection');

ALTER TABLE `customers` CHANGE `address1_zipcode` `address1_zipcode` VARCHAR( 10 ) NOT NULL DEFAULT '0';
ALTER TABLE `customers` CHANGE `address2_zipcode` `address2_zipcode` VARCHAR( 10 ) NOT NULL DEFAULT '0';
ALTER TABLE `vendors` CHANGE `address1_zipcode` `address1_zipcode` VARCHAR( 10 ) NOT NULL DEFAULT '0';
ALTER TABLE `vendors` CHANGE `address2_zipcode` `address2_zipcode` VARCHAR( 10 ) NOT NULL DEFAULT '0';

UPDATE `templates` SET `template_description` = 'Deutschsprachige Version der Standard-PDF-Rechnung. Absender links, Empf�nger rechts f�r Sichtcouvert und weitere kleinere Optimierungen' WHERE `id`=4 LIMIT 1 ;

INSERT INTO `language` (`id` , `language` , `label` ,`translation` ) VALUES (NULL , 'en_us', 'filter_billable_only', 'Billable Only');



--
-- Changes from 1.4.0 to 2.0.0_alpha_1
--

CREATE TABLE IF NOT EXISTS `themes` (
  `id` int(11) NOT NULL auto_increment,
  `theme_name` varchar(255) NOT NULL,
  `theme_creator` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;


INSERT INTO `themes` (`id`, `theme_name`, `theme_creator`) VALUES (1, 'default', 'amberdms');

INSERT INTO `service_types` (`id`, `name`, `description`) VALUES ('6', 'bundle', 'Bundle Service - A service that can contain mulitple other services.');

CREATE TABLE `services_bundles` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`id_bundle` INT NOT NULL ,
`id_service` INT NOT NULL
) ENGINE = INNODB ;

DROP TABLE `services_customers_options` ;

CREATE TABLE `services_options` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`option_type` VARCHAR( 10 ) NOT NULL ,
`option_type_id` INT NOT NULL ,
`option_name` VARCHAR( 50 ) NOT NULL ,
`option_value` VARCHAR( 255 ) NOT NULL
) ENGINE = InnoDB;

ALTER TABLE `customers` ADD `portal_password` VARCHAR( 255 ) NOT NULL;
ALTER TABLE `customers` ADD `portal_salt` VARCHAR( 20 ) NOT NULL;

ALTER TABLE `services_customers` ADD `bundleid` INT NOT NULL AFTER `customerid` ;


INSERT INTO `permissions` (`id`, `value`, `description`) VALUES ('35', 'accounts_import_statement', 'This permission allows users to import bank statements into the system'), ('36', 'customers_portal_auth', 'Allow access to authentication fuctions via SOAP API.');

INSERT INTO `config` (`name`, `value`) VALUES ('MODULE_CUSTOMER_PORTAL', '');
INSERT INTO `config` (`name` ,`value`) VALUES ('THEME_DEFAULT', '1');

INSERT INTO `language` (`id` ,`language` ,`label` ,`translation`) VALUES (NULL , 'en_us', 'option_theme', 'Theme');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'id_service_customer', 'Service-Customer Assignment ID');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'service_controls', 'Service Control and Management');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'service_bundle_item', 'Service Bundle Components');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'service_bundle', 'Service Bundle Details');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'service_type', 'Service Type');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'tbl_lnk_delete', 'delete');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'bundle_details', 'Bundle Details');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'description_service', 'Service Description');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'description_bundle', 'Bundle Description'), (NULL, 'en_us', 'name_bundle', 'Bundle Name');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'bundle_services', 'Bundle Services'), (NULL, 'en_us', 'id_service', 'Service');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'bundle_services', 'Bundle Services');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'id_service', 'Service');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'menu_config_company', 'Company Details');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'menu_config_locale', 'Locale');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'menu_config_integration', 'Integration');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'menu_config_app', 'Application');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'menu_config_services', 'Services');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'config_company_details', 'Company Details');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'config_company_contact', 'Company Contact Details');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'config_company_invoices', 'Invoice Configuration');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'config_appearance', 'Application Appearance');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'config_date', 'Date Settings');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'config_currency', 'Currency Configuration');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'config_integration', 'Integration and connectivity options');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'config_defcodes', 'Default Application Configuration');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'config_accounts', 'Accounts Options');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'config_timesheet', 'Timesheet Configuration');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'config_auditlocking', 'Audit Locking Configuration');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'config_contributions', 'Contributions');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'config_security', 'Security Configuration');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'config_misc', 'Miscellaneous Options');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'config_dangerous', 'Dangerous/System Options');


CREATE TABLE IF NOT EXISTS `cdr_rate_tables` (
  `id` int(11) NOT NULL auto_increment,
  `id_vendor` int(11) NOT NULL,
  `rate_table_name` varchar(255) NOT NULL,
  `rate_table_description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `cdr_rate_tables_overrides` (
  `id` int(11) NOT NULL auto_increment,
  `option_type` varchar(20) NOT NULL,
  `option_type_id` int(11) NOT NULL,
  `rate_prefix` varchar(20) NOT NULL,
  `rate_description` varchar(255) NOT NULL,
  `rate_price_sale` decimal(11,2) NOT NULL,
  `rate_price_extraunits` decimal(11,2) NOT NULL,
  `rate_included_units` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `cdr_rate_tables_values` (
  `id` int(11) NOT NULL auto_increment,
  `id_rate_table` int(11) NOT NULL,
  `rate_prefix` varchar(20) NOT NULL,
  `rate_description` varchar(255) NOT NULL,
  `rate_price_sale` decimal(11,2) NOT NULL,
  `rate_price_cost` decimal(11,2) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


ALTER TABLE `customers` ADD `portal_login_time` BIGINT( 20 ) NOT NULL AFTER `portal_salt`;
ALTER TABLE `customers` ADD `portal_login_ipaddress` VARCHAR( 15 ) NOT NULL AFTER `portal_login_time`;


INSERT INTO `config` (`name`, `value`) VALUES ('AUTH_METHOD', 'sql');
INSERT INTO `config` (`name`, `value`) VALUES ('APP_WKHTMLTOPDF', '/opt/wkhtmltopdf/bin/wkhtmltopdf');

INSERT INTO `service_types` (`id`, `name`, `description`) VALUES ('7', 'phone_services', 'Call billing for services such as VoIP.');

ALTER TABLE `services` ADD `id_rate_table` INT NOT NULL AFTER `typeid` ;
ALTER TABLE `services_customers` ADD `bundleid_component` INT NOT NULL AFTER `bundleid` ;


CREATE TABLE `service_groups` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`group_name` VARCHAR( 255 ) NOT NULL ,
`group_description` VARCHAR( 255 ) NOT NULL
) ENGINE = InnoDB;


ALTER TABLE `products_taxes`
  DROP `manual_amount`,
  DROP `manual_option`,
  DROP `description`;


INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'tbl_lnk_adjust_override', 'Adjust Override');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'tbl_lnk_override', 'Override Rate');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'tbl_lnk_delete_override', 'Delete Override');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'id_rate_table', 'Rate Table');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'filter_service_type', 'Service Type Filter');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'menu_service_cdr_rates', 'Manage CDR Pricing Rates');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'tbl_lnk_product_details', 'Product Details');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'product_tax', 'Product Tax Options');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'rate_table_name', 'Rate Table Name');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'rate_table_description', 'Description');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'tbl_lnk_items', 'Items');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'filter_name_vendor', 'Vendor Filter');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'rate_table_view', 'Rate Table Details');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'id_vendor', 'Vendor');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'rate_prefix', 'Rate Prefix');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'rate_description', 'Description');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'rate_price_sale', 'Sale Price');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'rate_price_cost', 'Cost Price');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'tbl_lnk_item_edit', 'Edit Rate');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'tbl_lnk_item_delete', 'Delete Rate');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'rate_table_delete', 'Delete Rate Table');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'rate_table_add', 'Create Rate Table');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'create_rate_table', 'Create Rate Table');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'rate_override', 'Rate Override');


--
-- Changes from 2.0.0_alpha_1 to 2.0.0_alpha_2
--


INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES(NULL, 'en_us', 'menu_service_cdr_rates', 'CDR Rate Tables');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES(NULL, 'en_us', 'menu_service_cdr_rates_view', 'View Rate Tables');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES(NULL, 'en_us', 'menu_service_cdr_rates_add', 'Add Rate Table');

UPDATE `service_types` SET `name` = 'phone_trunk', `description` = 'Trunk phone service with multiple DDIs and phones.' WHERE `service_types`.`id` =7;

INSERT INTO `service_types` (`id`, `name`, `description`) VALUES ('8', 'phone_single', 'A single individual phone line/service.');
INSERT INTO `service_types` (`id`, `name`, `description`) VALUES ('9', 'phone_tollfree', 'Toll free phone line - has both inbound and outbound call charges applied.');

INSERT INTO `service_groups` (`id`, `group_name`, `group_description`) VALUES ('1', 'General Services', '');

ALTER TABLE `services` ADD `id_service_group` INT NOT NULL AFTER `id_rate_table`; 


INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES(NULL, 'en_us', 'menu_services_groups', 'Manage Service Groups');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES(NULL, 'en_us', 'menu_services_groups_view', 'View Service Groups');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES(NULL, 'en_us', 'menu_services_groups_add', 'Add Service Group');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES(NULL, 'en_us', 'group_name', 'Group Name');

INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES(NULL, 'en_us', 'group_description', 'Group Description');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES(NULL, 'en_us', 'service_group_view', 'Group Details');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES(NULL, 'en_us', 'service_group_members', 'Group Members');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES(NULL, 'en_us', 'id_service_group', 'Service Group');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES(NULL, 'en_us', 'filter_id_service_group', 'Service Group Filter');

INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES(NULL, 'en_us', 'service_group_delete', 'Delete Service Group');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES(NULL, 'en_us', 'service_group_add', 'Add Service Group');


ALTER TABLE `cdr_rate_tables` ADD `id_usage_mode` INT NOT NULL AFTER `id_vendor`;

CREATE TABLE `cdr_rate_usage_modes` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`name` VARCHAR( 255 ) NOT NULL ,
`description` VARCHAR( 255 ) NOT NULL
) ENGINE = InnoDB;

INSERT INTO `cdr_rate_usage_modes` (`id`, `name`, `description`) VALUES(1, 'per_minute', 'All calls charged on a per-minute basis, rounded up to nearest whole minute.');
INSERT INTO `cdr_rate_usage_modes` (`id`, `name`, `description`) VALUES(2, 'per_second', 'All calls charged on a per-second basis.');
INSERT INTO `cdr_rate_usage_modes` (`id`, `name`, `description`) VALUES(3, 'first_min_then_per_second', 'Calls charged for minimum of one minute and then per second afterwards.');

INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES(NULL, 'en_us', 'id_usage_mode', 'Usage Mode');

ALTER TABLE `services` ADD `active` BOOL NOT NULL AFTER `name_service` ;

UPDATE `services` SET active='1', id_service_group='1';

CREATE TABLE `services_customers_ddi` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`id_service_customer` INT NOT NULL ,
`ddi_start` INT NOT NULL ,
`ddi_finish` INT NOT NULL ,
`description` VARCHAR( 255 ) NOT NULL
) ENGINE = InnoDB;



--
-- Changes from 2.0.0_alpha_2 to 2.0.0_alpha_3
--


ALTER TABLE `services` ADD `discount` FLOAT NOT NULL AFTER `price_extraunits` ;

ALTER TABLE `services_customers_ddi` CHANGE `ddi_start` `ddi_start` BIGINT( 20 ) NOT NULL;
ALTER TABLE `services_customers_ddi` CHANGE `ddi_finish` `ddi_finish` BIGINT( 20 ) NOT NULL ;

CREATE TABLE IF NOT EXISTS `services_customers_ipv4` (
  `id` int(11) NOT NULL auto_increment,
  `id_service_customer` int(11) NOT NULL,
  `ipv4_address` varchar(15) NOT NULL,
  `ipv4_cidr` int(2) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'group_products', 'Products');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'group_discount', 'Discounts');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'group_time', 'Contracting Hours');
INSERT INTO `language` (`id`, `language`, `label`, `translation`) VALUES (NULL, 'en_us', 'group_other', 'Other');

INSERT INTO `permissions` (`id`, `value`, `description`) VALUES (NULL, 'customers_credit', 'Permits user to add and make credit transactions to a customer');


CREATE TABLE IF NOT EXISTS `account_credit` (
  `id` int(11) NOT NULL auto_increment,
  `locked` int(11) NOT NULL,
  `id_organisation` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `id_custom` int(11) NOT NULL,
  `type` char(6) NOT NULL,
  `code_credit` varchar(255) NOT NULL,
  `date_trans` bigint(20) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

ALTER TABLE `account_credit` ADD `description` VARCHAR( 255 ) NOT NULL AFTER `amount` ;




--
-- Import Clean Menu
--


TRUNCATE TABLE `menu`;

INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(1, 210, 'Customers', 'View Customers', 'customers/customers.php', 3);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(2, 220, 'Customers', 'Add Customer', 'customers/add.php', 4);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(4, 1, 'top', 'Overview', 'home.php', 0);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(5, 200, 'top', 'Customers', 'customers/customers.php', 3);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(6, 300, 'top', 'Vendors/Suppliers', 'vendors/vendors.php', 5);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(7, 400, 'top', 'Human Resources', 'hr/staff.php', 7);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(12, 211, 'View Customers', '', 'customers/view.php', 0);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(13, 100, 'top', 'Accounts', 'accounts/accounts.php', 0);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(15, 700, 'top', 'Time Keeping', 'timekeeping/timekeeping.php', 17);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(16, 800, 'top', 'Support Tickets', 'support/support.php', 9);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(17, 310, 'Vendors/Suppliers', 'View Vendors', 'vendors/vendors.php', 5);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(18, 320, 'Vendors/Suppliers', 'Add Vendor', 'vendors/add.php', 6);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(19, 311, 'View Vendors', '', 'vendors/view.php', 5);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(21, 410, 'Human Resources', 'View Staff', 'hr/staff.php', 7);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(22, 420, 'Human Resources', 'Add Staff', 'hr/staff-add.php', 8);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(23, 411, 'View Staff', '', 'hr/staff-view.php', 7);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(24, 810, 'Support Tickets', 'View Tickets', 'support/support.php', 9);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(25, 820, 'Support Tickets', 'Add Ticket', 'support/add.php', 10);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(26, 510, 'top', 'Products', 'products/products.php', 11);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(27, 511, 'Products', 'View Products', 'products/products.php', 11);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(28, 512, 'Products', 'Add Product', 'products/add.php', 12);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(30, 514, 'Products', '', 'products/products.php', 11);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(31, 520, 'top', 'Services', 'services/services.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(32, 521, 'Services', '', 'services/services.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(33, 522, 'Services', 'View Services', 'services/services.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(34, 523, 'View Services', '', 'services/view.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(35, 524, 'Services', 'Add Service', 'services/add.php', 14);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(36, 513, 'View Products', '', 'products/view.php', 11);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(37, 530, 'top', 'Projects', 'projects/projects.php', 15);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(38, 531, 'Projects', '', 'projects/projects.php', 15);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(39, 533, 'View Projects', '', 'projects/view.php', 15);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(40, 534, 'Projects', 'Add Project', 'projects/add.php', 16);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(41, 532, 'Projects', 'View Projects', 'projects/projects.php', 15);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(42, 701, 'Time Keeping', '', 'timekeeping/timekeeping.php', 17);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(43, 710, 'Time Keeping', 'Time Registration', 'timekeeping/timereg.php', 17);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(44, 720, 'Time Keeping', 'Unbilled Time', 'timekeeping/unbilled.php', 32);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(46, 535, 'View Projects', '', 'projects/phases.php', 15);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(47, 536, 'View Projects', '', 'projects/timebooked.php', 15);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(48, 900, 'top', 'Admin', 'admin/admin.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(49, 910, 'Admin', 'User Management', 'user/users.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(51, 930, 'Admin', 'Brute-Force Blacklist', 'admin/blacklist.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(52, 901, 'Admin', '', 'admin/admin.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(53, 911, 'User Management', '', 'user/users.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(54, 912, 'User Management', 'View Users', 'user/users.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(55, 913, 'User Management', 'Add User', 'user/user-add.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(56, 914, 'View Users', '', 'user/user-view.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(57, 915, 'View Users', '', 'user/user-permissions.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(58, 916, 'View Users', '', 'user/user-staffaccess.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(60, 811, 'View Tickets', '', 'support/view.php', 9);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(61, 213, 'View Customers', '', 'customers/journal.php', 3);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(62, 214, 'View Customers', '', 'customers/journal-edit.php', 3);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(63, 812, 'View Tickets', '', 'support/journal.php', 9);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(64, 812, 'View Tickets', '', 'support/journal-edit.php', 9);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(65, 312, 'View Vendors', '', 'vendors/journal.php', 5);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(66, 313, 'View Vendors', '', 'vendors/journal-edit.php', 5);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(67, 412, 'View Staff', '', 'hr/staff-journal.php', 7);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(68, 413, 'View Staff', '', 'hr/staff-journal-edit.php', 7);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(69, 917, 'View Users', '', 'user/user-journal.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(70, 918, 'View Users', '', 'user/user-journal-edit.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(71, 537, 'View Projects', '', 'projects/journal.php', 15);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(72, 538, 'View Projects', '', 'projects/journal-edit.php', 15);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(73, 514, 'View Products', '', 'products/journal.php', 11);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(74, 514, 'View Products', '', 'products/journal-edit.php', 11);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(75, 101, 'Accounts', '', 'accounts/accounts.php', 0);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(76, 110, 'Accounts', 'Chart of Accounts', 'accounts/charts/charts.php', 18);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(77, 111, 'Chart of Accounts', 'View Accounts', 'accounts/charts/charts.php', 18);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(78, 112, 'Chart of Accounts', 'Add Account', 'accounts/charts/add.php', 19);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(79, 113, 'View Accounts', '', 'accounts/charts/view.php', 18);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(80, 916, 'View Users', '', 'user/user-staffaccess-edit.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(81, 120, 'Accounts', 'Accounts Receivables', 'accounts/ar/ar.php', 20);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(84, 121, 'Accounts Receivables', 'View Invoices', 'accounts/ar/ar.php', 20);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(85, 140, 'Accounts', 'Taxes', 'accounts/taxes/taxes.php', 22);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(86, 141, 'Taxes', 'View Taxes', 'accounts/taxes/taxes.php', 22);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(87, 142, 'View Taxes', '', 'accounts/taxes/view.php', 22);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(88, 143, 'Taxes', 'Add Taxes', 'accounts/taxes/add.php', 23);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(89, 124, 'View Invoices', '', 'accounts/ar/invoice-view.php', 20);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(90, 124, 'View Invoices', '', 'accounts/ar/journal-edit.php', 20);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(91, 124, 'View Invoices', '', 'accounts/ar/journal.php', 20);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(92, 113, 'View Accounts', '', 'accounts/charts/ledger.php', 18);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(93, 124, 'View Invoices', '', 'accounts/ar/invoice-payments.php', 20);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(94, 124, 'View Invoices', '', 'accounts/ar/invoice-items.php', 20);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(96, 142, 'View Taxes', '', 'accounts/taxes/ledger.php', 22);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(97, 142, 'View Taxes', '', 'accounts/taxes/tax_collected.php', 22);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(98, 142, 'View Taxes', '', 'accounts/taxes/tax_paid.php', 22);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(99, 130, 'Accounts', 'Accounts Payable', 'accounts/ap/ap.php', 24);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(100, 131, 'Accounts Payable', 'View AP Invoices', 'accounts/ap/ap.php', 24);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(101, 132, 'Accounts Payable', 'Add AP Invoice', 'accounts/ap/invoice-add.php', 25);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(102, 134, 'View AP Invoices', '', 'accounts/ap/invoice-delete.php', 25);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(103, 134, 'View AP Invoices', '', 'accounts/ap/invoice-view.php', 24);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(104, 134, 'View AP Invoices', '', 'accounts/ap/journal-edit.php', 24);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(105, 134, 'View AP Invoices', '', 'accounts/ap/journal.php', 24);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(106, 134, 'View AP Invoices', '', 'accounts/ap/invoice-payments.php', 24);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(107, 134, 'View AP Invoices', '', 'accounts/ap/invoice-items.php', 24);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(108, 536, 'View Projects', '', 'projects/timebilled.php', 15);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(109, 536, 'View Projects', '', 'projects/timebilled-edit.php', 15);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(110, 536, 'View Projects', '', 'projects/timebilled-delete.php', 15);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(111, 535, 'View Projects', '', 'projects/phase-edit.php', 15);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(112, 535, 'View Projects', '', 'projects/phase-delete.php', 15);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(113, 711, 'Time Registration', '', 'timekeeping/timereg-day.php', 17);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(114, 535, 'View Projects', '', 'projects/delete.php', 15);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(115, 514, 'View Products', '', 'products/delete.php', 11);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(116, 214, 'View Customers', '', 'customers/delete.php', 3);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(117, 313, 'View Vendors', '', 'vendors/delete.php', 5);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(118, 413, 'View Staff', '', 'hr/staff-delete.php', 7);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(119, 811, 'View Tickets', '', 'support/delete.php', 9);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(120, 142, 'View Taxes', '', 'accounts/taxes/delete.php', 22);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(121, 918, 'View Users', '', 'user/user-delete.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(122, 115, 'Accounts', 'General Ledger', 'accounts/gl/gl.php', 26);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(123, 116, 'General Ledger', 'View GL Transactions', 'accounts/gl/gl.php', 26);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(124, 117, 'General Ledger', 'Add GL Transaction', 'accounts/gl/add.php', 27);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(126, 124, 'View Invoices', '', 'accounts/ar/invoice-items-edit.php', 21);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(127, 124, 'View Invoices', '', 'accounts/ar/invoice-payments-edit.php', 21);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(128, 134, 'View AP Invoices', '', 'accounts/ap/invoice-payments-edit.php', 25);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(129, 134, 'View AP Invoices', '', 'accounts/ap/invoice-items-edit.php', 25);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(130, 117, 'View GL Transactions', '', 'accounts/gl/view.php', 26);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(131, 117, 'View GL Transactions', '', 'accounts/gl/delete.php', 27);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(132, 150, 'Accounts', 'Quotes', 'accounts/quotes/quotes.php', 28);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(133, 151, 'Quotes', 'View Quotes', 'accounts/quotes/quotes.php', 28);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(134, 152, 'Quotes', 'Add Quote', 'accounts/quotes/quotes-add.php', 29);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(135, 152, 'View Quotes', '', 'accounts/quotes/quotes-delete.php', 29);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(136, 154, 'View Quotes', '', 'accounts/quotes/quotes-view.php', 28);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(137, 154, 'View Quotes', '', 'accounts/quotes/journal-edit.php', 28);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(138, 154, 'View Quotes', '', 'accounts/quotes/journal.php', 28);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(139, 154, 'View Quotes', '', 'accounts/quotes/quotes-items.php', 28);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(140, 154, 'View Quotes', '', 'accounts/quotes/quotes-items-edit.php', 29);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(141, 152, 'View Quotes', '', 'accounts/quotes/quotes-convert.php', 29);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(142, 916, 'View Users', '', 'user/user-staffaccess-add.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(143, 523, 'View Services', '', 'services/plan.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(144, 523, 'View Services', '', 'services/journal.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(145, 523, 'View Services', '', 'services/journal-edit.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(146, 523, 'View Services', '', 'services/delete.php', 14);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(147, 211, 'View Customers', '', 'customers/invoices.php', 3);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(148, 211, 'View Customers', '', 'customers/services.php', 3);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(149, 211, 'View Customers', '', 'customers/service-edit.php', 4);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(150, 211, 'View Customers', '', 'customers/service-delete.php', 4);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(151, 311, 'View Vendors', '', 'vendors/invoices.php', 5);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(152, 211, 'View Customers', '', 'customers/service-history.php', 4);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(153, 711, 'Time Registration', '', 'timekeeping/timereg-day-edit.php', 17);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(154, 113, 'View Accounts', '', 'accounts/charts/delete.php', 19);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(155, 124, 'View Invoices', '', 'accounts/ar/invoice-export.php', 20);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(156, 154, 'View Quotes', '', 'accounts/quotes/quotes-export.php', 28);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(157, 180, 'Accounts', 'Reports', 'accounts/reports/reports.php', 30);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(158, 181, 'Reports', 'Trial Balance', 'accounts/reports/trialbalance.php', 30);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(159, 181, 'Reports', '', 'accounts/reports/reports.php', 30);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(160, 182, 'Reports', 'Income Statement', 'accounts/reports/incomestatement.php', 30);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(161, 183, 'Reports', 'Balance Sheet', 'accounts/reports/balancesheet.php', 30);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(162, 905, 'Admin', 'Configuration', 'admin/config.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(163, 940, 'Admin', 'Audit Locking', 'admin/auditlock.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(164, 411, 'View Staff', '', 'hr/staff-timebooked.php', 7);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(167, 122, 'Accounts Receivables', 'Add Invoice', 'accounts/ar/invoice-add.php', 21);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(168, 122, 'View Invoices', '', 'accounts/ar/invoice-delete.php', 21);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(169, 950, 'Admin', 'Database Backup', 'admin/db_backup.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(170, 908, 'Admin', 'template_selection', 'admin/templates.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(171, 906, 'Configuration', 'menu_config_company', 'admin/config_company.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(173, 906, 'Configuration', 'menu_config_integration', 'admin/config_integration.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(174, 906, 'Configuration', 'menu_config_services', 'admin/config_services.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(175, 906, 'Configuration', 'menu_config_app', 'admin/config_application.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(176, 906, 'Configuration', 'menu_config_locale', 'admin/config_locale.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(177, 906, 'Configuration', '', 'admin/config.php', 2);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(178, 211, 'View Customers', '', 'customers/portal.php', 3);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(179, 525, 'Services', 'menu_service_cdr_rates', 'services/cdr-rates.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(180, 526, 'menu_service_cdr_rates', 'menu_service_cdr_rates_view', 'services/cdr-rates.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(181, 526, 'menu_service_cdr_rates', 'menu_service_cdr_rates_add', 'services/cdr-rates-add.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(182, 527, 'menu_service_cdr_rates_view', '', 'services/cdr-rates-view.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(183, 527, 'menu_service_cdr_rates_view', '', 'services/cdr-rates-items.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(184, 527, 'menu_service_cdr_rates_view', '', 'services/cdr-rates-delete.php', 14);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(185, 523, 'View Services', '', 'services/bundles.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(186, 523, 'View Services', '', 'services/bundles-service-add.php', 14);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(187, 523, 'View Services', '', 'services/bundles-service-edit.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(188, 527, 'menu_service_cdr_rates_view', '', 'services/cdr-rates-items-edit.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(189, 523, 'View Services', '', 'services/cdr-override.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(190, 523, 'View Services', '', 'services/cdr-override-edit.php', 14);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(191, 190, 'Accounts', 'Import', 'accounts/import/bankstatement.php', 35);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(192, 191, 'Import', 'Bank Statement', 'accounts/import/bankstatement.php', 35);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(193, 192, 'Bank Statement', '', 'accounts/import/bankstatement-assign.php', 35);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(194, 193, 'Bank Statement', '', 'accounts/import/bankstatement-csv.php', 35);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(195, 211, 'View Customers', '', 'customers/service-cdr-override.php', 3);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(196, 211, 'View Customers', '', 'customers/service-cdr-override-edit.php', 4);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(197, 528, 'Services', 'menu_services_groups', 'services/groups.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(198, 529, 'menu_services_groups', 'menu_services_groups_view', 'services/groups.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(199, 530, 'menu_services_groups_view', '', 'services/groups-view.php', 13);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(200, 530, 'menu_services_groups_view', '', 'services/groups-delete.php', 14);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(201, 530, 'menu_services_groups', 'menu_services_groups_add', 'services/groups-add.php', 14);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(202, 211, 'View Customers', '', 'customers/service-ddi.php', 3);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(203, 211, 'View Customers', '', 'customers/service-ddi-edit.php', 4);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(204, 211, 'View Customers', '', 'customers/service-ipv4.php', 3);
INSERT INTO `menu` (`id`, `priority`, `parent`, `topic`, `link`, `permid`) VALUES(205, 211, 'View Customers', '', 'customers/service-ipv4-edit.php', 4);




--
-- Set Schema Version
--

UPDATE `config` SET `value` = '20100422' WHERE name='SCHEMA_VERSION' LIMIT 1;



