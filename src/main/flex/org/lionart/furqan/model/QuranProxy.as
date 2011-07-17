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
package org.lionart.furqan.model
{
    import org.lionart.qurani.Quran;
    import org.lionart.qurani.Sura;
    import org.puremvc.as3.interfaces.IProxy;
    import org.puremvc.as3.patterns.proxy.Proxy;

    public class QuranProxy extends Proxy implements IProxy
    {
        public static const NAME : String = "QuranProxy";

        private var quran : Quran;

        public function QuranProxy( data : Object = null )
        {
            super(NAME, data);
            quran = new Quran();
        }

        public function getSuraByNumber( suraNumber : int ) : Sura
        {
            return quran.getSura(suraNumber);
        }
    }
}
