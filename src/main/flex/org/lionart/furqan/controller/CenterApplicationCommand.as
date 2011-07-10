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
    import flash.system.Capabilities;
    
    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.command.SimpleCommand;

    public class CenterApplicationCommand extends SimpleCommand
    {
        override public function execute( notification : INotification ) : void
        {
            var app : Furqan = notification.getBody() as Furqan;
            app.nativeWindow.x = (Capabilities.screenResolutionX - app.nativeWindow.width) / 2;
            app.nativeWindow.y = (Capabilities.screenResolutionY - app.nativeWindow.height) / 2;
        }
    }
}
