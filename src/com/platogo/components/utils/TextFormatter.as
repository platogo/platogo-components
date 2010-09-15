/*
  Copyright (c) 2009 Platogo Interactive Entertainment GmbH

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
*/
package com.platogo.components.utils
{
	public class TextFormatter
	{
	// ============================================================================================
	
		private static const THOUSANDS_SEPERATOR : String = ",";

		private static const LESS_THAN_A_MINUTE : Number = 60000;
		private static const LESS_THAN_AN_HOUR : Number = 3600000;
		private static const LESS_THAN_A_DAY : Number = 86400000;
		private static const LESS_THAN_A_WEEK : Number = 604800000;
		private static const LESS_THAN_A_MONTH : Number = 2592000000;
		private static const LESS_THAN_A_YEAR : Number = 31536000000;
 
	// ============================================================================================
		
		public static function formatNumber( value : int ) : String
		{
			var result : String = value.toString();
			
			var thousandsCount : int;
			for ( var i:int=result.length-1; i>0; --i )
			{
				thousandsCount = ( thousandsCount + 1 ) % 3;
				
				if ( thousandsCount == 0 )
				{
					result = result.slice( 0, i ) + TextFormatter.THOUSANDS_SEPERATOR + result.slice( i );
				}
			}
			
			return result;
		}
		
		public static function formatTime( value : Number ) : String
		{
			var seconds : Number = Math.floor( value / 1000 );
			var minutes : Number = Math.floor( seconds / 60 );
			var hours : Number = Math.floor( minutes / 60 );

			seconds %= 60;
			minutes %= 60;
			
			if ( hours > 0 )
			{
				return sprintf( "%d:%02d:%02d", hours, minutes, seconds );
			}
			else
			{
				return sprintf( "%02d:%02d", minutes, seconds );
			}
		}
		
		public static function formatDate( value : Date ) : String
		{
			var amount : int;
			var timePassed : Number = ( new Date() ).getTime() - value.getTime();
			
			var result : String;
  
			if ( timePassed < TextFormatter.LESS_THAN_A_MINUTE )
			{
				result = "a few seconds";
			}
			else if ( timePassed <= TextFormatter.LESS_THAN_AN_HOUR )
			{
				amount = timePassed / TextFormatter.LESS_THAN_A_MINUTE;
				result = amount +" minute";
			}
			else if ( timePassed <= TextFormatter.LESS_THAN_A_DAY )
			{
				amount = timePassed / TextFormatter.LESS_THAN_AN_HOUR;
				result = amount +" hour";
			}
			else if ( timePassed <= TextFormatter.LESS_THAN_A_WEEK )
			{
				amount = timePassed / TextFormatter.LESS_THAN_A_DAY;
				result = amount +" day";
			}
			else if ( timePassed <= TextFormatter.LESS_THAN_A_MONTH )
			{
				amount = timePassed / TextFormatter.LESS_THAN_A_WEEK;
				result = amount +" week";
			}
			else if ( timePassed <= TextFormatter.LESS_THAN_A_YEAR )
			{
				amount = timePassed / TextFormatter.LESS_THAN_A_MONTH;
				result = amount +" month";
			}
			else
			{
				amount = timePassed / TextFormatter.LESS_THAN_A_YEAR;
				result = amount +" year";
			}
			
			if ( amount > 1 )
			{
				result += "s";
			}
			
			return result;
		}
	}
}