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
package com.alkiteb.furqan.view
{
    import com.alkiteb.furqan.conf.NotificationCatalog;
    import com.alkiteb.furqan.controller.CloseApplicationCommand;
    import com.alkiteb.furqan.controller.MinimizeApplicationCommand;
    import com.alkiteb.furqan.events.ApplicationEvent;
    import com.alkiteb.furqan.view.components.HeaderView;

    import org.puremvc.as3.patterns.mediator.Mediator;

    public class HeaderMediator extends Mediator
    {
        public static const NAME : String = "HeaderMediator";

        public function HeaderMediator( viewComponent : Object = null )
        {
            super(NAME, viewComponent);

            facade.registerCommand(NotificationCatalog.CLOSE_APPLICATION, CloseApplicationCommand);
            facade.registerCommand(NotificationCatalog.MINIMIZE_APPLICATION, MinimizeApplicationCommand);

            getView().addEventListener(ApplicationEvent.CLOSE_APPLICATION, onCloseApplication);
            getView().addEventListener(ApplicationEvent.MINIMIZE_APPLICATION, onMinimizeApplication);
        }

        //--------------------------------------------------------------------------
        //
        //  Event handlers
        //
        //--------------------------------------------------------------------------

        private function onMinimizeApplication( event : ApplicationEvent ) : void
        {
            sendNotification(NotificationCatalog.MINIMIZE_APPLICATION, event)
        }

        private function onCloseApplication( event : ApplicationEvent ) : void
        {
            sendNotification(NotificationCatalog.CLOSE_APPLICATION, event)
        }

        //--------------------------------------------------------------------------
        //
        //  Shortcuts
        //
        //--------------------------------------------------------------------------

        private function getView() : HeaderView
        {
            return viewComponent as HeaderView;
        }
    }
}
