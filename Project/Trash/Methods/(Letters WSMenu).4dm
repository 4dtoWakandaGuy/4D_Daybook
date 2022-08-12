//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters WSMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 10:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vBefore2; vBefore2I; vMod2; vMod3)
	C_LONGINT:C283($_l_menuItemNumber; $_l_menuNumber; $_l_menuNumberH; $_l_menuNumberV; rDiary; Write)
	C_TEXT:C284($_t_MenuName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters WSMenu")
//Letters_SWMenu - 4D Write Silver
//NG this appeaRS to be all wrng
If (Menu selected:C152#0)
	$_l_menuNumber:=Menu selected:C152\65536
	$_l_menuItemNumber:=Menu selected:C152%65536
	$_t_MenuName:=Get menu title:C430($_l_menuNumber\65536)
	Case of 
			
		: ($_t_MenuName="File")  //File
			Case of 
				: ($_l_menuItemNumber=1)
					ZLetters_SWNew
				: ($_l_menuItemNumber=2)
					Letters_SWOpen2
				: ($_l_menuItemNumber=3)
					Close_Process
				: ($_l_menuItemNumber=5)
					Letters_SWSave
				: ($_l_menuItemNumber=6)
					Letters_SWSaveA
				: ($_l_menuItemNumber=8)
					// WR O DO COMMAND (Write;108;0)
					WR EXECUTE COMMAND:P12000:113(Write; 108)
				: ($_l_menuItemNumber=9)
					Letters_SWInfo
				: ($_l_menuItemNumber=10)
					// WR EXECUTE COMMAND (104)
					WR O DO COMMAND:P12000:25(Write; 213; 0)
				: ($_l_menuItemNumber=12)
					WR EXECUTE COMMAND:P12000:113(Write; 110)
					WR O DO COMMAND:P12000:25(Write; 110; 0)
				: ($_l_menuItemNumber=13)
					If (rDiary=1)
						Diary_Print2
					Else 
						//WR EXECUTE COMMAND (Write;110)
						WR O DO COMMAND:P12000:25(Write; 111; 0)
					End if 
				: ($_l_menuItemNumber=14)
					If (rDiary=1)
						Gen_Confirm("Do you want to Merge with the current Diary details or to choose new Contacts?"; "Current"; "New")
						If (OK=1)
							Diary_Print2
						Else 
							Letters_SWMerge
						End if 
					Else 
						Letters_SWMerge
					End if 
				: ($_l_menuItemNumber=15)
					Letters_SWMerSp
					DB_SetMenuBar(""; 94)
				: ($_l_menuItemNumber=17)
					//WR EXECUTE COMMAND (Write;110)
					WR O DO COMMAND:P12000:25(Write; 114; 0)
			End case 
			
		: ($_t_MenuName="Find")  //Find
			WR EXECUTE COMMAND:P12000:113(Write; 500+$_l_menuItemNumber)
			//WR O DO COMMAND (Write;500+$_l_menuItemNumber;0)
			
		: ($_t_MenuName="Format")  //Format
			Case of 
				: ($_l_menuItemNumber=1)
					//  WR EXECUTE COMMAND (Write;208)
					WR O DO COMMAND:P12000:25(Write; 418; 0)
				: ($_l_menuItemNumber=3)
					WR EXECUTE COMMAND:P12000:113(Write; 210)
					// WR O DO COMMAND (Write;210;0)
					If (vMod2)
						
						SET_MENU ITEM(2050; 3; "Hide Invisibles")
						vMod2:=False:C215
					Else 
						SET_MENU ITEM(2050; 3; "Show Invisibles")
						vMod2:=True:C214
					End if 
				: ($_l_menuItemNumber=4)
					WR EXECUTE COMMAND:P12000:113(Write; 211)
					// WR O DO COMMAND (Write;211;0)
					If (vMod3)
						SET_MENU ITEM(2050; 4; "Hide Pictures")
						vMod3:=False:C215
					Else 
						SET_MENU ITEM(2050; 4; "Show Pictures")
						vMod3:=True:C214
					End if 
				: ($_l_menuItemNumber=5)
					WR EXECUTE COMMAND:P12000:113(Write; 605)
					// WR O DO COMMAND (Write;605;0)
					If (vBefore2)
						SET_MENU ITEM(2050; 5; "Hide Ruler")
						vBefore2:=False:C215
					Else 
						SET_MENU ITEM(2050; 5; "Show Ruler")
						vBefore2:=True:C214
					End if 
				: ($_l_menuItemNumber=6)
					WR O DO COMMAND:P12000:25(Write; 606; 0)
					If (vBefore2I)
						SET_MENU ITEM(2050; 6; "Hide Margins")
						vBefore2I:=False:C215
					Else 
						SET_MENU ITEM(2050; 6; "Show Margins")
						vBefore2I:=True:C214
					End if 
				: ($_l_menuItemNumber=8)
					WR O DO COMMAND:P12000:25(Write; 610; 0)
				: ($_l_menuItemNumber=9)
					WR O DO COMMAND:P12000:25(Write; 611; 0)
			End case 
			
		: ($_t_MenuName="Insert")  //Insert
			Case of 
				: ($_l_menuItemNumber=1)
					WR O DO COMMAND:P12000:25(Write; 608; 0)
				: ($_l_menuItemNumber=2)
					WR O DO COMMAND:P12000:25(Write; 219; 0)
				: ($_l_menuItemNumber=3)
					WR O DO COMMAND:P12000:25(Write; 706; 0)
				: ($_l_menuItemNumber=4)
					WR O DO COMMAND:P12000:25(Write; 704; 0)
				: ($_l_menuItemNumber=5)
					WR O DO COMMAND:P12000:25(Write; 705; 0)
				: ($_l_menuItemNumber=7)
					WR INSERT EXPRESSION:P12000:24(Write; "vLetterDate")
				: ($_l_menuItemNumber=8)
					WR INSERT EXPRESSION:P12000:24(Write; "vOurRef")
				: ($_l_menuItemNumber=9)
					WR INSERT EXPRESSION:P12000:24(Write; "vDetails")
				: ($_l_menuItemNumber=10)
					WR INSERT EXPRESSION:P12000:24(Write; "vSalutation")
				: ($_l_menuItemNumber=11)
					WR INSERT EXPRESSION:P12000:24(Write; "vFrom")
				: ($_l_menuItemNumber=13)
					WR O DO COMMAND:P12000:25(Write; 701; 0)
				: ($_l_menuItemNumber=14)
					WR O DO COMMAND:P12000:25(Write; 703; 0)
				: ($_l_menuItemNumber=15)
					WR O DO COMMAND:P12000:25(Write; 711; 0)
				: ($_l_menuItemNumber=17)
					Letters_GPDi
					
					CREATE SET:C116([DOCUMENTS:7]; "Master")
			End case 
			
	End case 
End if 
ERR_MethodTrackerReturn("Letters WSMenu"; $_t_oldMethodName)