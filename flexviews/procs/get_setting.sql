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

DROP FUNCTION IF EXISTS flexviews.`get_setting`;;

CREATE  FUNCTION flexviews.`get_setting`( v_setting_key TEXT) RETURNS TEXT CHARACTER SET UTF8
    READS SQL DATA
BEGIN  
DECLARE v_setting TEXT character set utf8;

SELECT setting_value
  INTO v_setting
  FROM flexviews.mview_settings
 WHERE setting_key = v_setting_key ;

RETURN v_setting;
END ;;

DELIMITER ;

