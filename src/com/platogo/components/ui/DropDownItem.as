package com.platogo.components.ui {	import flash.text.TextField;		/**	 * @author sirflo	 */	public class DropDownItem extends CustomSimpleButton 	{		public var textField : TextField;		public var data : *;		public function DropDownItem( label : String = null, data : * = null )		{			this.label = label;			this.data = data;		}				public function set label( value : String ) : void		{			textField.text = value ? value : "";		}		public function get label() : String		{			return textField.text;		}	}}