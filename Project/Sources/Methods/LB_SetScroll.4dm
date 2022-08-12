//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_SetScroll
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2009 22:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_HorizontalSrollbar; $_l_VerticalSrollbar; $2; $3)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_SetScroll")
//the method will mimic the behaviour of AL_SetScroll



//Values for $2 and $3
//>0 scroll position  scroll position-note you can only set the vertical bar
//-1=Switch(hide if shown show if hidden)
//-3=hide
//-2show
$_l_VerticalSrollbar:=LISTBOX Get property:C917($1->; 4)
$_l_HorizontalSrollbar:=LISTBOX Get property:C917($1->; 2)

Case of 
	: (Count parameters:C259<3)  //ONLY THE HORIZONTAL
		
		Case of 
			: ($2>=0)
				OBJECT SET SCROLL POSITION:C906($1->; $2)
			: ($2=-2)  //SHOW  HORIZONTAL
				
				OBJECT SET SCROLLBAR:C843($1->; True:C214; ($_l_VerticalSrollbar=1))
			: ($2=-1)  //SWITCH 03/07/06 PB
				
				OBJECT SET SCROLLBAR:C843($1->; ($_l_HorizontalSrollbar=0); ($_l_VerticalSrollbar=1))
			: ($2=-3)  //HIDE HORIZONAL
				
				OBJECT SET SCROLLBAR:C843($1->; False:C215; ($_l_VerticalSrollbar=1))
				
		End case 
	: (Count parameters:C259=3)
		Case of 
				//: ($3=-1)  `SHOW
			: ($3=-2)  //SHOW Vertical
				
				//$_l_VerticalSrollbar:=Get listbox information($1->;4)
				//$_l_HorizontalSrollbar:=Get listbox information($1->;2)
				If ($2#0)
					Case of 
							//: ($2=-1)
						: ($2=-2)  //show horizontal
							
							OBJECT SET SCROLLBAR:C843($1->; True:C214; True:C214)
							//: ($2=-2)
						: ($2=-1)  // swap horizontal(will be 0 if hidden
							
							OBJECT SET SCROLLBAR:C843($1->; ($_l_HorizontalSrollbar=0); True:C214)
						: ($2=-3)  //Hide horizontal
							
							OBJECT SET SCROLLBAR:C843($1->; False:C215; True:C214)
							
						Else 
							//do nothing with horizontal(leave as is) and do nothing with vertical(leave as is)
							OBJECT SET SCROLLBAR:C843($1->; ($_l_HorizontalSrollbar=1); True:C214)
							//$2 is a positive so want the (vertical)scroll bar position
							OBJECT SET SCROLL POSITION:C906($1->; $2)
					End case 
				Else 
					//do nothing with the horizontal and do nothing with the vertical
					//SET SCROLLBAR VISIBLE($1->;($_l_HorizontalSrollbar=1);($_l_VerticalSrollbar=1))
					OBJECT SET SCROLLBAR:C843($1->; ($_l_HorizontalSrollbar=1); True:C214)
				End if 
				//: ($3=-2)  `SWITCH
			: ($3=-1)  //SWITCH vertical
				
				//$_l_VerticalSrollbar:=Get listbox information($1->;4)
				//$_l_HorizontalSrollbar:=Get listbox information($1->;2)
				If ($2#0)
					Case of 
							//: ($2=-1)
						: ($2=-2)  //show horizontal
							
							OBJECT SET SCROLLBAR:C843($1->; True:C214; ($_l_VerticalSrollbar=0))
							//: ($2=-2)
						: ($2=-1)  // swap horizontal(will be 0 if hidden
							
							OBJECT SET SCROLLBAR:C843($1->; ($_l_HorizontalSrollbar=0); ($_l_VerticalSrollbar=0))
						: ($2=-3)  //Hide horizontal
							
							OBJECT SET SCROLLBAR:C843($1->; False:C215; ($_l_VerticalSrollbar=0))
							
						Else 
							//do nothing with horizontal(leave as is) and switch vertical
							OBJECT SET SCROLLBAR:C843($1->; ($_l_HorizontalSrollbar=1); ($_l_VerticalSrollbar=1))
							//$2 is a positive so want the (vertical)scroll bar position
							OBJECT SET SCROLL POSITION:C906($1->; $2)
					End case 
				Else 
					//do nothing with the horizontal and do nothing switch vertical
					OBJECT SET SCROLLBAR:C843($1->; ($_l_HorizontalSrollbar=1); ($_l_VerticalSrollbar=0))
					
				End if 
				
			: ($3=-3)  //HIDE vertical
				
				//$_l_VerticalSrollbar:=Get listbox information($1->;4)
				//$_l_HorizontalSrollbar:=Get listbox information($1->;2)
				//$_l_VerticalSrollbar:=Get listbox information($1->;4)
				//$_l_HorizontalSrollbar:=Get listbox information($1->;2)
				
				
				
				If ($2#0)
					Case of 
							//: ($2=-1)
						: ($2=-2)  //show horizontal
							
							OBJECT SET SCROLLBAR:C843($1->; True:C214; False:C215)
							OBJECT SET SCROLL POSITION:C906($1->; 0)
							//: ($2=-2)
						: ($2=-1)  // swap horizontal(will be 0 if hidden
							
							OBJECT SET SCROLLBAR:C843($1->; ($_l_HorizontalSrollbar=0); False:C215)
							If ($_l_HorizontalSrollbar=0)
								OBJECT SET SCROLL POSITION:C906($1->; 0; 0)
								
								
							Else 
								OBJECT SET SCROLL POSITION:C906($1->; 0)
							End if 
						: ($2=-3)  //Hide horizontal
							
							OBJECT SET SCROLLBAR:C843($1->; False:C215; False:C215)
							
							OBJECT SET SCROLL POSITION:C906($1->; 0; 0)
							
							
						Else 
							//do nothing with horizontal(leave as is) and switch vertical
							OBJECT SET SCROLLBAR:C843($1->; ($_l_HorizontalSrollbar=1); False:C215)
							//$2 is a positive so want the (vertical)scroll bar position
							OBJECT SET SCROLL POSITION:C906($1->; $2)
					End case 
				Else 
					If ($_l_HorizontalSrollbar=0)
						OBJECT SET SCROLL POSITION:C906($1->; 0; 0)
						
						
					Else 
						OBJECT SET SCROLL POSITION:C906($1->; 0)
					End if 
					
					
					//do nothing with the horizontal and do nothing switch vertical
					OBJECT SET SCROLLBAR:C843($1->; ($_l_HorizontalSrollbar=1); False:C215)
					
				End if 
				
			: ($3>=0)  //SHOW Vertical
				
				Case of 
					: ($2>=0)
						OBJECT SET SCROLL POSITION:C906($1->; $2)
					: ($2=-2)  //SHOW  HORIZONTAL
						
						OBJECT SET SCROLLBAR:C843($1->; True:C214; ($_l_VerticalSrollbar=1))
					: ($2=-1)  //SWITCH 03/07/06 PB
						
						OBJECT SET SCROLLBAR:C843($1->; ($_l_HorizontalSrollbar=0); ($_l_VerticalSrollbar=1))
					: ($2=-3)  //HIDE HORIZONAL
						
						OBJECT SET SCROLLBAR:C843($1->; False:C215; ($_l_VerticalSrollbar=1))
						
				End case 
		End case 
End case 
ERR_MethodTrackerReturn("LB_SetScroll"; $_t_oldMethodName)