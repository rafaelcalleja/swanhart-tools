DELIMITER ;;
/*  Flexviews for MySQL 
    Copyright 2008 Justin Swanhart

    FlexViews is free software: you can redistribute it and/or modify
    it under the terms of the Lesser GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FlexViews is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with FlexViews in the file COPYING, and the Lesser extension to
    the GPL (the LGPL) in COPYING.LESSER.
    If not, see <http://www.gnu.org/licenses/>.
*/

DROP PROCEDURE IF EXISTS flexviews.`signal`;;

CREATE  PROCEDURE flexviews.`signal`( 
  IN in_errortext TINYTEXT CHARACTER SET UTF8
)
   CONTAINS SQL
   COMMENT 'To be removed; use fv_raise() instead'
BEGIN
   /*!50404
        SIGNAL SQLSTATE '45000' SET
          CLASS_ORIGIN = 'FlexViews',
          MESSAGE_TEXT = in_errortext;
    */
   SET @sql=CONCAT('UPDATE flexviews.mview SET `ERROR: ',
            in_errortext,
            '` = `', in_errortext, '`');
   PREPARE fv_signal_stmt FROM @sql;
   EXECUTE fv_signal_stmt;
   DEALLOCATE PREPARE fv_signal_stmt;
END;
;;

DELIMITER ;
