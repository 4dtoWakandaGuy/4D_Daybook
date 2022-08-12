//%attributes = {}
If (False:C215)
	//Project Method Name:      Acc_BalRepPS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ShowPS; vMod3)
	C_LONGINT:C283($_l_OK; i; s1; vPage)
	C_TEXT:C284($_t_oldMethodName; $1; vFld; vPPage; vRec)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Acc_BalRepPS")
vRec:=Char:C90(13)
vFld:=Char:C90(9)
vMod3:=False:C215
If (Count parameters:C259>=1)
	Open_Pro_Window($1+": Command-. to Cancel")
	If (s1=1)
		$_bo_ShowPS:=False:C215
		If ($1="@12 Periods")
			//Gen_Confirm ("Do you want to print at 8 Point, showing figures to 99 million"
			//"+"or at 6 Point, showing figures †20:06:00†
			//here we can just check if there are figures >99billion!!!!!!!!!!!!!!!!!!!
			//the above statement is rubbish, there is no form method on  some of
			//the printed forms
			//so the font size will not change for balance sheet
			
			
			If (OK=0)
				vMod3:=True:C214
			End if 
			//Gen_Alert ("Please choose Print Settings of 100% Landscape")
			$_l_OK:=PRINT_SetSIZE("A4"; "L"; $1)
			$_bo_ShowPS:=False:C215
			If ($_l_OK>=0)  //Either the print setting was not displayed in PRINT_Setsize OR the settings were OK'd
				If ($_l_OK=1)  //if COntinue=0 the print settings were displayed in Print_SetSize
					$_bo_ShowPS:=True:C214
				End if 
			End if 
			//PAGE SETUP([HEADINGS];"All_Hdr12")
		Else 
			$_l_OK:=PRINT_SetSIZE("A4"; "P"; $1)
			$_bo_ShowPS:=False:C215
			If ($_l_OK>=0)  //Either the print setting was not displayed in PRINT_Setsize OR the settings were OK'd
				If ($_l_OK=1)  //if COntinue=0 the print settings were displayed in Print_SetSize
					$_bo_ShowPS:=True:C214
				End if 
			End if 
			
		End if 
		If ($_bo_ShowPS)
			PRINT SETTINGS:C106
		End if 
	Else 
		Gen_Confirm("Please name the file that will store the "+$1+" Report")
		If (OK=1)
			SET CHANNEL:C77(12; "")
		End if 
	End if 
End if 

vPage:=1
vPPage:="Page "+String:C10(vPage)
i:=9
ERR_MethodTrackerReturn("Acc_BalRepPS"; $_t_oldMethodName)
