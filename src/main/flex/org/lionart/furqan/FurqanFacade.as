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
package org.lionart.furqan
{
    import org.puremvc.as3.patterns.facade.Facade;

    public class FurqanFacade extends Facade
    {
        public static const STARTUP : String = "startup";
        
        /**
         * Returns a singleton of AirganizerFacade
         */
        public static function getInstance() : FurqanFacade
        {
            if ( instance == null )
            {
                instance = new FurqanFacade();
            }
            return instance as FurqanFacade;
        }
        
        /**
         * Saves commands against the Controller
         */
        override protected function initializeController() : void
        {
            super.initializeController();
            /*registerCommand(STARTUP, StartupCommand);
            registerCommand(LOAD_CONFIGURATION, LoadConfigurationCommand);*/
        }
        
        /**
         * Starts PureMVC environement
         */
        public function startup( app : Furqan ) : void
        {
            sendNotification(STARTUP,app);
        }
    }
}
