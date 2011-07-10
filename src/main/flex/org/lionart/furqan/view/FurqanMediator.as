/*
   Copyright (C) 2011 Ghazi Triki  <ghazi.nocturne@gmail.com>

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
package org.lionart.furqan.view
{
    import org.puremvc.as3.patterns.mediator.Mediator;

    public class FurqanMediator extends Mediator
    {
        public static const NAME : String = "FurqanMediator";
        
        public function FurqanMediator( app : Furqan )
        {
            super(NAME, app);
        }
        
        private function get airganizer() : Furqan
        {
            return viewComponent as Furqan;
        }
    }
}
