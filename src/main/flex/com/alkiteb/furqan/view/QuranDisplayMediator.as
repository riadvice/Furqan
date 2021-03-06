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
package com.alkiteb.furqan.view
{
    import com.alkiteb.furqan.conf.NotificationCatalog;
    import com.alkiteb.furqan.controller.CopySuraTextCommand;
    import com.alkiteb.furqan.uicontrol.SuraHeader;
    import com.alkiteb.furqan.view.components.QuranDisplayView;
    import com.alkiteb.qurani.Aya;
    import com.alkiteb.qurani.Sura;

    import mx.resources.ResourceManager;

    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.mediator.Mediator;

    public class QuranDisplayMediator extends Mediator
    {
        public static const NAME : String = "QuranMediator";

        public function QuranDisplayMediator( viewComponent : Object = null )
        {
            super(NAME, viewComponent);

            facade.registerCommand(NotificationCatalog.COPY_SURA_TEXT, CopySuraTextCommand);
        }

        //--------------------------------------------------------------------------
        //
        //  Notification handling
        //
        //--------------------------------------------------------------------------

        override public function handleNotification( notification : INotification ) : void
        {
            switch (notification.getName())
            {
                case NotificationCatalog.SURA_LOADED:
                    showSura(notification.getBody() as Sura);
                    updateHeader(notification.getBody() as Sura);
                    break;
            }
        }

        override public function listNotificationInterests() : Array
        {
            return [NotificationCatalog.SURA_LOADED];
        }

        //--------------------------------------------------------------------------
        //
        //  View actions
        //
        //--------------------------------------------------------------------------

        public function showSura( sura : Sura ) : void
        {
            if (sura.basmalah)
            {
                getView().bamalahLabel.text = sura.basmalah.othmani;
                getView().bamalahLabel.includeInLayout = getView().bamalahLabel.visible = true;
            }
            else
            {
                getView().bamalahLabel.includeInLayout = getView().bamalahLabel.visible = false;
            }

            getView().quranContent.text = Aya(sura.ayat[0]).othmani;
            for (var i : int = 1; i < sura.ayat.length; i++)
            {
                getView().quranContent.text += " " + Aya(sura.ayat[i]).othmani;
            }
            getView().textScroller.viewport.verticalScrollPosition = 0;

        }

        public function updateHeader( sura : Sura ) : void
        {
            var header : SuraHeader = getView().suraHeader;
            header.suraLength.text = sura.ayat.length.toString();
            header.suraOrder.text = sura.orderInMushaf.toString();
            header.suraName.text = ResourceManager.getInstance().getString('furqan', 'sura') + " " + sura.name;
        }

        //--------------------------------------------------------------------------
        //
        //  Shortcuts
        //
        //--------------------------------------------------------------------------

        private function getView() : QuranDisplayView
        {
            return viewComponent as QuranDisplayView;
        }
    }
}
