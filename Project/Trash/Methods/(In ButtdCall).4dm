//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      In ButtdCall
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_DropOut)
	C_LONGINT:C283(<>SCPT_l_PaletteWIndow; <>WS_Search_Message; $_l_MonitorCall; $_l_PressedButton; DB_l_ButtonClickedFunction; SM_l_MonitorCall; vNo; vNo2)
	C_POINTER:C301($_Ptr_Table; $1)
	C_TEXT:C284($_t_ClickedFunction; $_t_CurrentFormUsage; $_t_oldMethodName; $_t_oldMethodName2; DB_t_ButtonClickedFunction; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SM_t_UseSetName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("In ButtdCall")

//In ButtdCall
If (Current process:C322=Frontmost process:C327(*))
	$_l_PressedButton:=DB_l_ButtonClickedFunction
	DB_l_ButtonClickedFunction:=0
	
	
	
	
	
	Case of 
		: (SM_l_MonitorCall>0)
			If (Count parameters:C259>=1)
				$_Ptr_Table:=$1
			Else 
				$_Ptr_Table:=->[COMPANIES:2]
				
			End if 
			SHOW WINDOW:C435  // NG MARCH 2004
			//call is from the set manager
			$_l_MonitorCall:=SM_l_MonitorCall
			SM_l_MonitorCall:=0
			Case of 
				: ($_l_MonitorCall=2)  //here we are passed a set
					If (Records in set:C195("Userset")>0)
						USE SET:C118("UserSet")
					End if 
					CREATE SET:C116($1->; "TempSet"+String:C10(Table:C252($_Ptr_Table)))
					INTERSECTION:C121(SM_t_UseSetName; "TempSet"+String:C10(Table:C252($_Ptr_Table)); "TempSet"+String:C10(Table:C252($_Ptr_Table)))
					USE SET:C118("TempSet"+String:C10(Table:C252($_Ptr_Table)))
					CLEAR SET:C117("TempSet"+String:C10(Table:C252($_Ptr_Table)))
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					$_bo_DropOut:=True:C214
					Master2($1)
					
				: ($_l_MonitorCall=3)  //here we are passed a set to unite
					If (Records in set:C195("Userset")>0)
						USE SET:C118("UserSet")
					End if 
					CREATE SET:C116($1->; "TempSet"+String:C10(Table:C252($_Ptr_Table)))
					UNION:C120(SM_t_UseSetName; "TempSet"+String:C10(Table:C252($_Ptr_Table)); "TempSet"+String:C10(Table:C252($_Ptr_Table)))
					USE SET:C118("TempSet"+String:C10(Table:C252($_Ptr_Table)))
					CLEAR SET:C117("TempSet"+String:C10(Table:C252($_Ptr_Table)))
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					$_bo_DropOut:=True:C214
					Master2($1)
				: ($_l_MonitorCall=4)  //here we are passed a set to unite
					If (Records in set:C195("Userset")>0)
						USE SET:C118("UserSet")
					End if 
					CREATE SET:C116($1->; "TempSet"+String:C10(Table:C252($_Ptr_Table)))
					DIFFERENCE:C122(SM_t_UseSetName; "TempSet"+String:C10(Table:C252($_Ptr_Table)); "TempSet"+String:C10(Table:C252($_Ptr_Table)))
					USE SET:C118("TempSet"+String:C10(Table:C252($_Ptr_Table)))
					CLEAR SET:C117("TempSet"+String:C10(Table:C252($_Ptr_Table)))
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					$_bo_DropOut:=True:C214
					Master2($1)
				: ($_l_MonitorCall=5)  //here we are passed a set to unite
					If (Records in set:C195("Userset")>0)
						USE SET:C118("UserSet")
					End if 
					CREATE SET:C116($1->; "TempSet"+String:C10(Table:C252($_Ptr_Table)))
					DIFFERENCE:C122("TempSet"+String:C10(Table:C252($_Ptr_Table)); SM_t_UseSetName; "TempSet"+String:C10(Table:C252($_Ptr_Table)))
					USE SET:C118("TempSet"+String:C10(Table:C252($_Ptr_Table)))
					CLEAR SET:C117("TempSet"+String:C10(Table:C252($_Ptr_Table)))
					CREATE SET:C116($1->; "Master")
					
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					<>WS_Search_Message:=1
					POST OUTSIDE CALL:C329(Current process:C322)
				: ($_l_MonitorCall=6)
					//load a set from disk
					LOAD SET:C185($_Ptr_Table->; "TempSet"; "")
					If (Records in set:C195("Userset")>0)
						USE SET:C118("UserSet")
						vNo:=Records in selection:C76($1->)
						vNo2:=0
						
					End if 
					USE SET:C118("TempSet")
					CLEAR SET:C117("TempSet")
					//no need to call the set manager back
				: ($_l_MonitorCall=8)
					//save the current selection as a set on disk
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					CREATE SET:C116($1->; "TempSet")
					SAVE SET:C184("TempSet"; "")
					CLEAR SET:C117("TempSet")
					
				: ($_l_MonitorCall=7)
					//list passed from list manager
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					USE SET:C118("<>SaveSet"+String:C10(Table:C252($_Ptr_Table)))
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					CLEAR SET:C117("<>SaveSet"+String:C10(Table:C252($_Ptr_Table)))
					$_bo_DropOut:=True:C214
					Master2($1)
					CLEAR SEMAPHORE:C144("$SetInuse")
					//no need to call the set manager back
			End case 
		: ($_l_PressedButton=DB_GetButtonFunction("Close"))
			CANCEL:C270
		: ($_l_PressedButton=DB_GetButtonFunction("OK"))
			ACCEPT:C269
		: ($_l_PressedButton=DB_GetButtonFunction("Cancel"))
			CANCEL:C270
		: ($_l_PressedButton=DB_GetButtonFunction("Diary"))
			If (Count parameters:C259>0)
				FurthFld_MC($1)
			End if 
		: ($_l_PressedButton=DB_GetButtonFunction("M:"))
			$_t_ClickedFunction:=DB_t_ButtonClickedFunction
			DB_t_ButtonClickedFunction:=""
			If ($_t_ClickedFunction#"")
				If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
					If ($_t_ClickedFunction="F:@")  //So F key functions dont think they are called from the palette
						Macro(Substring:C12($_t_ClickedFunction; 3; 15))
					Else 
						Macro(Substring:C12($_t_ClickedFunction; 3; 15); ""; ""; <>SCPT_l_PaletteWIndow)  //Play a Macro -
					End if 
				End if 
			End if 
			
		: ($_l_PressedButton=DB_GetButtonFunction("-1"))
			$_t_ClickedFunction:=DB_t_ButtonClickedFunction
			DB_t_ButtonClickedFunction:=""
			If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
				
				If (Num:C11(Substring:C12($_t_ClickedFunction; 3; 2))>0)  //If its a Menu item method
					$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
					DB_t_CurrentFormUsage:="-1"+Substring:C12($_t_ClickedFunction; 3; 2)
					$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+Substring:C12($_t_ClickedFunction; 5; 15))
					
					EXECUTE FORMULA:C63(Substring:C12($_t_ClickedFunction; 5; 15))
					DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
				Else 
					$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+Substring:C12($_t_ClickedFunction; 3; 15))
					
					EXECUTE FORMULA:C63(Substring:C12($_t_ClickedFunction; 3; 15))  //Execute a Layout menu item - called by Record_Play
				End if 
			End if 
	End case 
End if 
If ($_l_PressedButton#DB_GetButtonFunction("OK")) & ($_l_PressedButton#DB_GetButtonFunction("Cancel"))
	
	If (Count parameters:C259>=1)
		Out_SetManger($1)
	Else 
		Out_SetManger
	End if 
End if 
If ($_bo_DropOut)
	<>WS_Search_Message:=1
	POST OUTSIDE CALL:C329(Current process:C322)
End if 
ERR_MethodTrackerReturn("In ButtdCall"; $_t_oldMethodName)