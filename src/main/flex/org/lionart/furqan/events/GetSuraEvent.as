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
package org.lionart.furqan.events
{
    import flash.events.Event;

    public class GetSuraEvent extends Event
    {
        public static const NEXT_SURA : String = "nextSura";
        public static const PREVIOUS_SURA : String = "previousSura";

        public function GetSuraEvent( type : String, bubbles : Boolean = false, cancelable : Boolean = false )
        {
            super(type, bubbles, cancelable);
        }

        override public function clone() : Event
        {
            return new GetSuraEvent(type, bubbles, cancelable);
        }
    }
}
