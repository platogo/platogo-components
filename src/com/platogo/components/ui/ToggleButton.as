﻿/*  Copyright (c) 2009 Platogo Interactive Entertainment GmbH  Permission is hereby granted, free of charge, to any person obtaining a copy  of this software and associated documentation files (the "Software"), to deal  in the Software without restriction, including without limitation the rights  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  copies of the Software, and to permit persons to whom the Software is  furnished to do so, subject to the following conditions:  The above copyright notice and this permission notice shall be included in  all copies or substantial portions of the Software.  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN  THE SOFTWARE.*/package com.platogo.components.ui{	import com.platogo.components.core.IDisposable;			import flash.display.MovieClip;	import flash.events.MouseEvent;		/**	 * 	 */	public class ToggleButton extends MovieClip implements IDisposable	{	// ============================================================================================				private static const NOT_SELECTED_FRAME : uint = 1;		private static const SELECTED_FRAME : uint = 2;	// ============================================================================================			/**		 * 		 */		public function ToggleButton()		{			addEventListener( MouseEvent.CLICK, clickListener, false, 0, true );			selected = false;		}				public function dispose() : void		{			removeEventListener( MouseEvent.CLICK, clickListener );		}			// ============================================================================================			/**		 *		 */		private function clickListener( event : MouseEvent ) : void		{			selected = !selected;		}		// ============================================================================================			public function get selected() : Boolean		{			return ( currentFrame == ToggleButton.SELECTED_FRAME );		}		public function set selected( value : Boolean ) : void		{			gotoAndStop( value ? ToggleButton.SELECTED_FRAME : ToggleButton.NOT_SELECTED_FRAME );		}	}}