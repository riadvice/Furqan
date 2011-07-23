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
    import mx.managers.ToolTipManager;
    
    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.command.SimpleCommand;
    
    import spark.effects.Fade;

    public class ConfigureApplicationCommand extends SimpleCommand
    {
        override public function execute( notification : INotification ) : void
        {
            ToolTipManager.showDelay = 0;
            ToolTipManager.hideDelay = 3000;
            
            var fadeIn : Fade = new Fade();
            fadeIn.alphaFrom = 0;
            fadeIn.alphaTo = 1;
            fadeIn.duration = 300;
            ToolTipManager.showEffect = fadeIn;
            
            var fadeOut : Fade = new Fade();
            fadeOut.alphaFrom = 1;
            fadeOut.alphaTo = 0;
            fadeOut.duration = 300;
            ToolTipManager.hideEffect = fadeOut;
            
            //CursorManager.setCursor( EmbeddedAssets.CURSOR, CursorManagerPriority.LOW );
        }
    }
}
