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
    import org.lionart.furqan.view.components.QuranDisplayView;
    import org.puremvc.as3.patterns.mediator.Mediator;

    public class QuranDisplayMediator extends Mediator
    {
        public static const NAME : String = "QuranMediator";
        
        public function QuranDisplayMediator( viewComponent : Object = null )
        {
            super(NAME, viewComponent);
        }
        
        private function getView() : QuranDisplayView
        {
            return viewComponent as QuranDisplayView;
        }
    }
}
