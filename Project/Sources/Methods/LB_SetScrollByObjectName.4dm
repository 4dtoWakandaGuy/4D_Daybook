//%attributes = {}

If (False:C215)
	//Database Method Name:      LB_SetScrollByObjectName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  29/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_HorizontalScrollPos; $_l_HorizontalSrollbar; $_l_Parameters; $_l_VerticalScrollPos; $_l_VerticalSrollbar; $2; $3)
	C_TEXT:C284($_t_LBObjectName; $_t_OldMethodName; $1)
End if 

//Code Starts Here
$_t_OldMethodName:=ERR_MethodTracker("LB_SetScroll")
//the method will mimic the behaviour of AL_SetScroll

$_t_LBObjectName:=$1
$_l_HorizontalScrollPos:=$2
If (Count parameters:C259>=3)
	$_l_VerticalScrollPos:=$3
End if 
$_l_Parameters:=Count parameters:C259
//Values for $2 and $_l_VerticalScrollPos
//>0 scroll position  scroll position-note you can only set the vertical bar
//-1=Switch(hide if shown show if hidden)
//-3=hide
//-2show
$_l_VerticalSrollbar:=LISTBOX Get property:C917(*; $_t_LBObjectName; 4)
$_l_HorizontalSrollbar:=LISTBOX Get property:C917(*; $_t_LBObjectName; 2)

Case of 
	: ($_l_Parameters<3)  //ONLY THE HORIZONTAL
		
		Case of 
			: ($_l_HorizontalScrollPos>=0)
				OBJECT SET SCROLL POSITION:C906(*; $_t_LBObjectName; $_l_HorizontalScrollPos)
			: ($_l_HorizontalScrollPos=-2)  //SHOW  HORIZONTAL
				
				OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; True:C214; ($_l_VerticalSrollbar=1))
			: ($_l_HorizontalScrollPos=-1)  //SWITCH 03/07/06 PB
				
				OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; ($_l_HorizontalSrollbar=0); ($_l_VerticalSrollbar=1))
			: ($_l_HorizontalScrollPos=-3)  //HIDE HORIZONAL
				
				OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; False:C215; ($_l_VerticalSrollbar=1))
				
		End case 
	: ($_l_Parameters>=3)
		Case of 
				//: ($3=-1)  `SHOW
			: ($_l_VerticalScrollPos=-2)  //SHOW Vertical
				
				//$_l_VerticalSrollbar:=Get listbox information(*;$_t_LBObjectName;4)
				//$_l_HorizontalSrollbar:=Get listbox information(*;$_t_LBObjectName;2)
				If ($_l_HorizontalScrollPos#0)
					Case of 
							//: ($_l_HorizontalScrollPos=-1)
						: ($_l_HorizontalScrollPos=-2)  //show horizontal
							
							OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; True:C214; True:C214)
							//: ($_l_HorizontalScrollPos=-2)
						: ($_l_HorizontalScrollPos=-1)  // swap horizontal(will be 0 if hidden
							
							OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; ($_l_HorizontalSrollbar=0); True:C214)
						: ($_l_HorizontalScrollPos=-3)  //Hide horizontal
							
							OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; False:C215; True:C214)
							
						Else 
							//do nothing with horizontal(leave as is) and do nothing with vertical(leave as is)
							OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; ($_l_HorizontalSrollbar=1); True:C214)
							//$_l_HorizontalScrollPos is a positive so want the (vertical)scroll bar position
							OBJECT SET SCROLL POSITION:C906(*; $_t_LBObjectName; $_l_HorizontalScrollPos)
					End case 
				Else 
					//do nothing with the horizontal and do nothing with the vertical
					//SET SCROLLBAR VISIBLE(*;$_t_LBObjectName;($_l_HorizontalSrollbar=1);($_l_VerticalSrollbar=1))
					OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; ($_l_HorizontalSrollbar=1); True:C214)
				End if 
				//: ($_l_VerticalScrollPos=-2)  `SWITCH
			: ($_l_VerticalScrollPos=-1)  //SWITCH vertical
				
				//$_l_VerticalSrollbar:=Get listbox information(*;$_t_LBObjectName;4)
				//$_l_HorizontalSrollbar:=Get listbox information(*;$_t_LBObjectName;2)
				If ($2#0)
					Case of 
							//: ($2=-1)
						: ($_l_HorizontalScrollPos=-2)  //show horizontal
							
							OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; True:C214; ($_l_VerticalSrollbar=0))
							//: ($_l_HorizontalScrollPos=-2)
						: ($_l_HorizontalScrollPos=-1)  // swap horizontal(will be 0 if hidden
							
							OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; ($_l_HorizontalSrollbar=0); ($_l_VerticalSrollbar=0))
						: ($_l_HorizontalScrollPos=-3)  //Hide horizontal
							
							OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; False:C215; ($_l_VerticalSrollbar=0))
							
						Else 
							//do nothing with horizontal(leave as is) and switch vertical
							OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; ($_l_HorizontalSrollbar=1); ($_l_VerticalSrollbar=1))
							//$_l_HorizontalScrollPos is a positive so want the (vertical)scroll bar position
							OBJECT SET SCROLL POSITION:C906(*; $_t_LBObjectName; $_l_HorizontalScrollPos)
					End case 
				Else 
					//do nothing with the horizontal and do nothing switch vertical
					OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; ($_l_HorizontalSrollbar=1); ($_l_VerticalSrollbar=0))
					
				End if 
				
			: ($_l_VerticalScrollPos=-3)  //HIDE vertical
				
				//$_l_VerticalSrollbar:=Get listbox information(*;$_t_LBObjectName;4)
				//$_l_HorizontalSrollbar:=Get listbox information(*;$_t_LBObjectName;2)
				//$_l_VerticalSrollbar:=Get listbox information(*;$_t_LBObjectName;4)
				//$_l_HorizontalSrollbar:=Get listbox information(*;$_t_LBObjectName;2)
				
				
				
				If ($_l_HorizontalScrollPos#0)
					Case of 
							//: ($_l_HorizontalScrollPos=-1)
						: ($_l_HorizontalScrollPos=-2)  //show horizontal
							
							OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; True:C214; False:C215)
							OBJECT SET SCROLL POSITION:C906(*; $_t_LBObjectName; 0)
							//: ($_l_HorizontalScrollPos=-2)
						: ($_l_HorizontalScrollPos=-1)  // swap horizontal(will be 0 if hidden
							
							OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; ($_l_HorizontalSrollbar=0); False:C215)
							If ($_l_HorizontalSrollbar=0)
								OBJECT SET SCROLL POSITION:C906(*; $_t_LBObjectName; 0; 0)
								
								
							Else 
								OBJECT SET SCROLL POSITION:C906(*; $_t_LBObjectName; 0)
							End if 
						: ($_l_HorizontalScrollPos=-3)  //Hide horizontal
							
							OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; False:C215; False:C215)
							
							OBJECT SET SCROLL POSITION:C906(*; $_t_LBObjectName; 0; 0)
							
							
						Else 
							//do nothing with horizontal(leave as is) and switch vertical
							OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; ($_l_HorizontalSrollbar=1); False:C215)
							//$_l_HorizontalScrollPos is a positive so want the (vertical)scroll bar position
							OBJECT SET SCROLL POSITION:C906(*; $_t_LBObjectName; $_l_HorizontalScrollPos)
					End case 
				Else 
					If ($_l_HorizontalSrollbar=0)
						OBJECT SET SCROLL POSITION:C906(*; $_t_LBObjectName; 0; 0)
						
						
					Else 
						OBJECT SET SCROLL POSITION:C906(*; $_t_LBObjectName; 0)
					End if 
					
					
					//do nothing with the horizontal and do nothing switch vertical
					OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; ($_l_HorizontalSrollbar=1); False:C215)
					
				End if 
				
			: ($_l_VerticalScrollPos>=0)  //SHOW Vertical
				
				Case of 
					: ($_l_HorizontalScrollPos>=0)
						OBJECT SET SCROLL POSITION:C906(*; $_t_LBObjectName; $_l_HorizontalScrollPos)
					: ($_l_HorizontalScrollPos=-2)  //SHOW  HORIZONTAL
						
						OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; True:C214; ($_l_VerticalSrollbar=1))
					: ($_l_HorizontalScrollPos=-1)  //SWITCH 03/07/06 PB
						
						OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; ($_l_HorizontalSrollbar=0); ($_l_VerticalSrollbar=1))
					: ($_l_HorizontalScrollPos=-3)  //HIDE HORIZONAL
						
						OBJECT SET SCROLLBAR:C843(*; $_t_LBObjectName; False:C215; ($_l_VerticalSrollbar=1))
						
				End case 
		End case 
End case 
ERR_MethodTrackerReturn("LB_SetScroll"; $_t_OldMethodName)