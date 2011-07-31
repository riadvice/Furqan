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

    public final class EmbeddedAssets
    {
        [Embed(source = "/../resources/themes/standard/assets/full-margin.png")]
        public static const PAPER_BACKGROUND : Class;

        [Embed(source = "/../resources/themes/standard/assets/sura-title.png")]
        public static const SURA_TITLE : Class;

        // ICONS
        [Embed(source = "/../resources/themes/standard/assets/cross.png")]
        public static const CROSS : Class;
    }
}
