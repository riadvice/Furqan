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
    import com.alkiteb.furqan.controller.CopySuraTextCommand;
    import com.alkiteb.furqan.controller.GetSuraByNameCommand;
    import com.alkiteb.furqan.controller.GetSuraByNumberCommand;
    import com.alkiteb.furqan.controller.ShowAboutWindowCommand;
    import com.alkiteb.furqan.controller.ShowPrintWindowCommand;
    import com.alkiteb.furqan.events.ActionEvent;
    import com.alkiteb.furqan.events.GetSuraEvent;
    import com.alkiteb.furqan.view.components.NavigationView;
    import com.alkiteb.qurani.Quran;
    import com.alkiteb.qurani.Sura;

    import mx.collections.ArrayCollection;

    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.mediator.Mediator;

    public class NavigationMediator extends Mediator
    {
        public static const NAME : String = "NavigationMediator";

        public var selectedSuraNumber : int = 1;
        public var selectedSuraName : String;

        public function NavigationMediator( viewComponent : Object = null )
        {
            super(NAME, viewComponent);

            facade.registerCommand(NotificationCatalog.GET_SURA_BY_NUMBER, GetSuraByNumberCommand);
            facade.registerCommand(NotificationCatalog.GET_SURA_BY_NAME, GetSuraByNameCommand);

            facade.registerCommand(NotificationCatalog.SHOW_PRINT_WINDOW, ShowPrintWindowCommand);
            facade.registerCommand(NotificationCatalog.SHOW_ABOUT_WINDOW, ShowAboutWindowCommand);


            // Select sura actions
            getView().addEventListener(GetSuraEvent.NEXT_SURA, onNextSura);
            getView().addEventListener(GetSuraEvent.PREVIOUS_SURA, onPreviousSura);
            getView().addEventListener(GetSuraEvent.SURA_BY_NAME, onSuraByName);

            // Action menu events
            getView().addEventListener(ActionEvent.COPY_SURA, onCopySura);
            getView().addEventListener(ActionEvent.PRINT_SURA, onPrintSura);
            getView().addEventListener(ActionEvent.ABOUT, onAbout);

            initView();
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
                    selectedSuraNumber = (notification.getBody() as Sura).orderInMushaf;
                    selectedSuraName = (notification.getBody() as Sura).name;
                    updateButtonsStates();
                    updateSelectedSuraName();
                    break;

                case NotificationCatalog.SUWAR_NAMES_LOADED:
                    getView().suwarNamesList.dataProvider = new ArrayCollection(notification.getBody() as Array);
                    break;
            }
        }

        override public function listNotificationInterests() : Array
        {
            return [NotificationCatalog.SURA_LOADED, NotificationCatalog.SUWAR_NAMES_LOADED];
        }

        //--------------------------------------------------------------------------
        //
        //  View actions
        //
        //--------------------------------------------------------------------------

        private function initView() : void
        {
            enablePreviousButton(false);
            enableNextButton(true);
        }

        private function enablePreviousButton( value : Boolean ) : void
        {
            getView().previousButtonEnabled = value;
        }

        private function enableNextButton( value : Boolean ) : void
        {
            getView().nextButtonEnabled = value;
        }

        private function updateButtonsStates() : void
        {
            if (selectedSuraNumber != 1 && selectedSuraNumber != Quran.getSuwarCount())
            {
                enablePreviousButton(true);
                enableNextButton(true);
            }
            else if (selectedSuraNumber == 1)
            {
                enablePreviousButton(false);
                enableNextButton(true);
            }
            else
            {
                enablePreviousButton(true);
                enableNextButton(false);
            }
        }

        private function updateSelectedSuraName() : void
        {
            getView().removeEventListener(GetSuraEvent.SURA_BY_NAME, onSuraByName);

            getView().suwarNamesList.selectedItem = selectedSuraName;

            getView().addEventListener(GetSuraEvent.SURA_BY_NAME, onSuraByName);
        }

        //--------------------------------------------------------------------------
        //
        //  Event handling
        //
        //--------------------------------------------------------------------------

        private function onPreviousSura( event : GetSuraEvent ) : void
        {
            sendNotification(NotificationCatalog.GET_SURA_BY_NUMBER, selectedSuraNumber - 1);
        }

        private function onNextSura( event : GetSuraEvent ) : void
        {
            sendNotification(NotificationCatalog.GET_SURA_BY_NUMBER, selectedSuraNumber + 1);
        }

        private function onSuraByName( event : GetSuraEvent ) : void
        {
            sendNotification(NotificationCatalog.GET_SURA_BY_NAME, getView().suwarNamesList.selectedItem);
        }

        private function onCopySura( event : ActionEvent ) : void
        {
            sendNotification(NotificationCatalog.COPY_SURA_TEXT);
        }

        private function onPrintSura( event : ActionEvent ) : void
        {

        }

        private function onAbout( event : ActionEvent ) : void
        {

        }

        //--------------------------------------------------------------------------
        //
        //  Shortcuts
        //
        //--------------------------------------------------------------------------

        private function getView() : NavigationView
        {
            return viewComponent as NavigationView;
        }
    }
}
