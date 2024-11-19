SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------

-- Table structure for table `admintb`
CREATE TABLE `admintb` (
  `username` VARCHAR(50) NOT NULL PRIMARY KEY,
  `password` VARCHAR(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `admintb`
INSERT INTO `admintb` (`username`, `password`) VALUES
('admin', 'admin123');

-- --------------------------------------------------------

-- Table structure for table `appointmenttb`
CREATE TABLE `appointmenttb` (
  `pid` INT(11) NOT NULL,
  `ID` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `fname` VARCHAR(20) NOT NULL,
  `lname` VARCHAR(20) NOT NULL,
  `gender` VARCHAR(10) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `contact` VARCHAR(10) NOT NULL,
  `doctor` VARCHAR(30) NOT NULL,
  `docFees` INT(5) NOT NULL,
  `appdate` DATE NOT NULL,
  `apptime` TIME NOT NULL,
  `userStatus` INT(5) NOT NULL DEFAULT 1,
  `doctorStatus` INT(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `appointmenttb`
INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `apptime`, `userStatus`, `doctorStatus`) VALUES
(4, 1, 'Abhinav', 'Shimpi', 'Male', 'abhinavshimpi2005@gmail.com', '9370580164', 'Ganesh', 550, '2024-02-14', '10:00:00', 1, 0),
(11, 4, 'Shraddha', 'Kapoor', 'Female', 'shraddha@gmail.com', '9768946252', 'ashok', 500, '2024-02-29', '20:00:00', 1, 1),
(2, 8, 'Alia', 'Bhatt', 'Female', 'alia@gmail.com', '8976897689', 'Ganesh', 550, '2020-03-21', '10:00:00', 1, 1);

-- --------------------------------------------------------

-- Table structure for table `contact`
CREATE TABLE IF NOT EXISTS `contact` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(30) NOT NULL,
  `email` TEXT NOT NULL,
  `contact` VARCHAR(15) NOT NULL,
  `message` VARCHAR(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `contact`
INSERT INTO `contact` (`name`, `email`, `contact`, `message`) VALUES
('Anu', 'anu@gmail.com', '7896677554', 'Hey Admin'),
('Viki', 'viki@gmail.com', '9899778865', 'Good Job, Pal'),
('Ananya', 'ananya@gmail.com', '9997888879', 'How can I reach you?'),
('Aakash', 'aakash@gmail.com', '8788979967', 'Love your site'),
('Mani', 'mani@gmail.com', '8977768978', 'Want some coffee?'),
('Karthick', 'karthi@gmail.com', '9898989898', 'Good service'),
('Abbis', 'abbis@gmail.com', '8979776868', 'Love your service'),
('Asiq', 'asiq@gmail.com', '9087897564', 'Love your service. Thank you!'),
('Jane', 'jane@gmail.com', '7869869757', 'I love your service!');

-- --------------------------------------------------------

-- Table structure for table `doctb`
CREATE TABLE IF NOT EXISTS `doctb` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `spec` VARCHAR(50) NOT NULL,
  `docFees` INT(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `doctb`
INSERT INTO `doctb` (`username`, `password`, `email`, `spec`, `docFees`) VALUES
('ashok', 'ashok123', 'ashok@gmail.com', 'General', 500),
('arun', 'arun123', 'arun@gmail.com', 'Cardiologist', 600),
('Dinesh', 'dinesh123', 'dinesh@gmail.com', 'General', 700),
('Ganesh', 'ganesh123', 'ganesh@gmail.com', 'Pediatrician', 550),
('Kumar', 'kumar123', 'kumar@gmail.com', 'Pediatrician', 800),
('Amit', 'amit123', 'amit@gmail.com', 'Cardiologist', 1000),
('Abbis', 'abbis123', 'abbis@gmail.com', 'Neurologist', 1500),
('Tiwary', 'tiwary123', 'tiwary@gmail.com', 'Pediatrician', 450);

-- --------------------------------------------------------

-- Table structure for table `patreg`
CREATE TABLE IF NOT EXISTS `patreg` (
  `pid` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `fname` VARCHAR(20) NOT NULL,
  `lname` VARCHAR(20) NOT NULL,
  `gender` VARCHAR(10) NOT NULL,
  `email` VARCHAR(50) NOT NULL UNIQUE,
  `contact` VARCHAR(20) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `cpassword` VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `patreg`
INSERT INTO `patreg` (`pid`, `fname`, `lname`, `gender`, `email`, `contact`, `password`, `cpassword`) VALUES
(1, 'Ram', 'Kumar', 'Male', 'ram@gmail.com', '9876543210', 'ram123', 'ram123'),
(2, 'Alia', 'Bhatt', 'Female', 'alia@gmail.com', '8976897689', 'alia123', 'alia123'),
(3, 'Shahrukh', 'khan', 'Male', 'shahrukh@gmail.com', '8976898463', 'shahrukh123', 'shahrukh123');

-- --------------------------------------------------------

-- Table structure for table `prestb`
CREATE TABLE IF NOT EXISTS `prestb` (
  `pres_id` INT AUTO_INCREMENT PRIMARY KEY,
  `doctor` VARCHAR(50) NOT NULL,
  `pid` INT(11) NOT NULL,
  `ID` INT(11) NOT NULL,
  `fname` VARCHAR(50) NOT NULL,
  `lname` VARCHAR(50) NOT NULL,
  `appdate` DATE NOT NULL,
  `apptime` TIME NOT NULL,
  `disease` VARCHAR(250) NOT NULL,
  `allergy` VARCHAR(250) NOT NULL,
  `prescription` VARCHAR(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `prestb`
INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `apptime`, `disease`, `allergy`, `prescription`) VALUES
('Dinesh', 4, 11, 'Kishan', 'Lal', '2020-03-27', '15:00:00', 'Cough', 'Nothing', 'Just take a teaspoon of Benadryl every night');

-- --------------------------------------------------------

-- Trigger to Log Changes in Patient Table
CREATE TABLE IF NOT EXISTS `patreg_log` (
  `log_id` INT AUTO_INCREMENT PRIMARY KEY,
  `pid` INT,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `changes_made` TEXT
);

DELIMITER //

CREATE TRIGGER after_update_patreg
AFTER UPDATE ON patreg
FOR EACH ROW
BEGIN
  DECLARE changes TEXT;
  SET changes = CONCAT('Updated patient ID ', OLD.pid, ' - Name: ', OLD.fname, ' ', OLD.lname, ' changed to ', NEW.fname, ' ', NEW.lname);
  INSERT INTO patreg_log (pid, changes_made) VALUES (OLD.pid, changes);
END;
//

-- --------------------------------------------------------

-- Cursor-based Stored Procedure
DELIMITER //

CREATE PROCEDURE ProcessAppointmentsCursor()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE app_id INT;
    DECLARE app_pid INT;
    DECLARE app_name VARCHAR(40);
    DECLARE app_doctor VARCHAR(30);
    DECLARE app_date DATE;
    DECLARE app_time TIME;

    -- Declare cursor to iterate through appointments
    DECLARE cur CURSOR FOR 
        SELECT ID, pid, CONCAT(fname, ' ', lname), doctor, appdate, apptime 
        FROM appointmenttb;

    -- Declare handler for cursor completion
    DECLARE CONTINUE HANDLER FOR NOT
