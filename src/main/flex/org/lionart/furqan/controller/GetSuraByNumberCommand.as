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
package org.lionart.furqan.controller
{
    import org.lionart.furqan.conf.NotificationCatalog;
    import org.lionart.furqan.model.QuranProxy;
    import org.lionart.qurani.Sura;
    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.command.SimpleCommand;

    public class GetSuraByNumberCommand extends SimpleCommand
    {
        override public function execute( notification : INotification ) : void
        {
            var suraNumber : int
            if (notification.getBody() is int)
            {
                suraNumber = parseInt(notification.getBody().toString());
            }
            else
            {
                suraNumber = 1;
            }
            var sura : Sura = QuranProxy(facade.retrieveProxy(QuranProxy.NAME)).getSuraByNumber(suraNumber);
            facade.sendNotification(NotificationCatalog.SURA_LOADED, sura);
        }
    }
}
