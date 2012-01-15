/*
   Copyright (C) 2011 Ghazi Triki <ghazi.nocturne@gmail.com>

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
package com.alkiteb.furqan.conf
{

    public final class NotificationCatalog
    {
        public static const STARTUP : String = "startup";
        public static const SUWAR_NAMES_LOADED : String = "suwarNamesLoaded";

        // Navigation actions
        public static const GET_SURA_BY_NUMBER : String = "getSuraByNumber";
		public static const GET_SURA_BY_NAME : String = "getSuraByName";
        
        // Header actions
        public static const CLOSE_APPLICATION : String = "closeApplication";
        public static const MINIMIZE_APPLICATION : String = "minimizeApplication";

        // Navigation results
        public static const SURA_LOADED : String = "suraLoaded";
        
        // Actions
        public static const COPY_SURA_TEXT : String = "copySuraText";
        public static const SHOW_PRINT_WINDOW : String = "showPrintWindow";
        public static const SHOW_ABOUT_WINDOW : String = "showAboutWindow";

    }
}
