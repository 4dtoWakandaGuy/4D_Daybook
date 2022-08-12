//%attributes = {}
If (False:C215)
	//Project Method Name:      FurthFldD_InLPß
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 09:13
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY POINTER(CUS_aptr_LBSetup;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; vMod3)
	C_LONGINT:C283(LB_SetMode)
	C_TEXT:C284($_t_HandlerCharacter1; $_t_oldMethodName; $1; vButtDisFF)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFldD_InLPß")
//FurthFldD_InLPß - takes over Before & After phases
//see InButt_LPß for description of param

$_t_HandlerCharacter1:=Substring:C12($1; 1; 1)
Case of 
	: (($_t_HandlerCharacter1="B") | ($_t_HandlerCharacter1="N"))  //use this bit if don't use Before2 method `($_t_HandlerCharacter1="N")
		<>DB_at_TableNames:=Find in array:C230(<>DB_al_TableNums; 2)
		QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3=<>DB_at_TableNames)
		ORDER BY:C49([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Sort_Order:4; >)
		DB_bo_RecordModified:=False:C215
		vMod3:=False:C215
		vButtDisFF:="I D  OSSFSSSRCADT"
		Input_Buttons(->[CUSTOM_FIELD_DEFINITiONS:99]; ->vButtDisFF)
	: (($_t_HandlerCharacter1="A") | ($_t_HandlerCharacter1="F"))  //remove the |($_t_HandlerCharacter1="F")) if the InButt Call reads "R:..."
		DB_SaveRecord(->[CUSTOM_FIELD_DEFINITiONS:99])
		ACCEPT:C269
	: ($_t_HandlerCharacter1="C")
		If ((DB_bo_RecordModified) | (vMod3))
			Gen_Confirm("Are you sure you want to Cancel all Field Definition and/or Value changes?"; "Keep them"; "Cancel")
			If (OK=0)
				CANCEL:C270
			End if 
		Else 
			CANCEL:C270
		End if 
End case 

Case of 
	: (($_t_HandlerCharacter1="B") | ($_t_HandlerCharacter1="N") | ($_t_HandlerCharacter1="S") | ($_t_HandlerCharacter1="P"))
		
		If (Size of array:C274(CUS_aptr_LBSetup)=0)
			LBi_ArrDefFill(->CUS_aptr_LBSetup; ->GEN_lb_ItemsArea; ->[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; ->[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; "400001104"; ""; 3; "Field Defs"; "Field Def")
		Else 
			OK:=1
			Case of 
				: ($_t_HandlerCharacter1="B")  //this Else bit only on the first page
					LBi_Prefs11(->CUS_aptr_LBSetup)  //reset the unique fields or page-turning won't work
				: ($_t_HandlerCharacter1="P")
					//    ALSetScroll0s (»COM_aPtr_CoFurthers;»QUAL_aptr_Information)
					//set scrolls of other areas to 0.  Use ALSetScroll0 if only 1 other
			End case 
		End if 
		LBi_LoadSetup(->CUS_aptr_LBSetup; $_t_HandlerCharacter1)
		If ((($_t_HandlerCharacter1="B") | ($_t_HandlerCharacter1="S")) & (Records in selection:C76([CUSTOM_FIELD_DEFINITiONS:99])>0))
			
			//AL_SetScroll (eALContI;1;1)` NG 26/7/06 TODO
		End if 
		
	: ((($_t_HandlerCharacter1="A") & (OK=1)) | ((($_t_HandlerCharacter1="C") | ($_t_HandlerCharacter1="D")) & (OK=0)))  //check the procs return these OKs
		LBi_pRefs4upd(->CUS_aptr_LBSetup)
		
End case 
If ((($_t_HandlerCharacter1="A") & (OK=1)) | ($_t_HandlerCharacter1="F") | ($_t_HandlerCharacter1="T"))
	LBi_Prefs4Sort(->CUS_aptr_LBSetup)  //only for those with dragging & sort order flds
End if 
LB_SetMode:=1
LBi_EditListLay(->CUS_aptr_LBSetup; ->LB_SetMode)
ERR_MethodTrackerReturn("FurthFldD_InLPß"; $_t_oldMethodName)