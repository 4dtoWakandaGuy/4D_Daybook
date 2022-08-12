If (False:C215)
	//Table Form Method Name: [USER]Gen_PopUpChoice
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(GEN_at_LongPopUp;0)
	C_BOOLEAN:C305(POP_bo_ShowLongString; DB_bo_NoLoad; Gen_bo_Create; GEN_Bo_ShowCreate)
	C_LONGINT:C283($_l_AddToScreen; $_l_event; $_l_Index; $_l_MaxLength; $_l_PopUpLength; BCancel; BCreate; Bsave; WS_l_DefaultValue)
	C_TEXT:C284($_t_oldMethodName; DB_t_WindowTitle; GEN_t_CancelText; GEN_t_OKText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].Gen_PopUpChoice"; Form event code:C388)
$_l_event:=Form event code:C388
//Modified NG March 2004 to allow buttons to have text set

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "Gen_PopUpChoice")
		
		
		If (GEN_t_CancelText#"")
			OBJECT SET TITLE:C194(BCancel; GEN_t_CancelText)
			GEN_t_CancelText:=""
		End if 
		
		If (GEN_t_OKText#"")
			OBJECT SET TITLE:C194(Bsave; GEN_t_OKText)
			GEN_t_OKText:=""
		End if 
		
		
		If (GEN_Bo_ShowCreate)
			OBJECT SET VISIBLE:C603(BCreate; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(BCreate; False:C215)
		End if 
		If (DB_t_WindowTitle#"")
			SET WINDOW TITLE:C213(DB_t_WindowTitle)
		End if 
		
		If (WS_l_DefaultValue>0)
			GEN_at_DropDownMenu:=WS_l_DefaultValue
			If (POP_bo_ShowLongString)  //added 22/08/08 -kmw
				If (Size of array:C274(GEN_at_LongPopUp)>=WS_l_DefaultValue)  //added 22/08/08 -kmw
					GEN_at_LongPopUp:=WS_l_DefaultValue  //added 22/08/08 -kmw
				End if   //added 22/08/08 -kmw
			End if   //added 22/08/08 -kmw
		Else 
			GEN_at_DropDownMenu:=0
			GEN_at_LongPopUp:=0  //added 22/08/08 -kmw
		End if 
		If (POP_bo_ShowLongString)
			OBJECT SET VISIBLE:C603(GEN_at_DropDownMenu; False:C215)
			$_l_MaxLength:=1
			For ($_l_Index; 1; Size of array:C274(GEN_at_LongPopUp))
				If (Length:C16(GEN_at_LongPopUp{$_l_Index})>$_l_MaxLength)
					$_l_MaxLength:=Length:C16(GEN_at_LongPopUp{$_l_Index})
				End if 
			End for 
		Else 
			OBJECT SET VISIBLE:C603(GEN_at_LongPopUp; False:C215)
			
			$_l_MaxLength:=1
			For ($_l_Index; 1; Size of array:C274(GEN_at_DropDownMenu))
				If (Length:C16(GEN_at_DropDownMenu{$_l_Index})>$_l_MaxLength)
					$_l_MaxLength:=Length:C16(GEN_at_DropDownMenu{$_l_Index})
				End if 
			End for 
		End if 
		$_l_PopUpLength:=$_l_MaxLength*7
		$_l_AddToScreen:=0
		If ($_l_PopUpLength>199)
			$_l_AddToScreen:=$_l_PopUpLength-199
		End if 
		
		WS_l_DefaultValue:=0
		WS_AutoscreenSize(3; 111; 320+$_l_AddToScreen)
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:Gen_PopUpChoice"; $_t_oldMethodName)
