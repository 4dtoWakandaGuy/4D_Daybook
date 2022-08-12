//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      FurthFldD_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	C_LONGINT:C283($_l_Clash)
	C_TEXT:C284($_t_FurtherDefCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFldD_InLPB")
If ([CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1="")
	
	Repeat 
		$_t_FurtherDefCode:=String:C10(AA_GetNextIDinMethod(->[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; Sequence number:C244([CUSTOM_FIELD_DEFINITiONS:99])-1))
		SET QUERY DESTINATION:C396(3; $_l_Clash)
		QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1=$_t_FurtherDefCode)
		SET QUERY DESTINATION:C396(0)
	Until ($_l_Clash=0)
	
	[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1:=$_t_FurtherDefCode
	
End if 
If ([CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3=0)
	[CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3:=<>DB_al_TableNums{<>DB_at_TableNames}
Else 
	<>DB_at_TableNames:=Find in array:C230(<>DB_al_TableNums; [CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3)
	
End if 
ERR_MethodTrackerReturn("FurthFldD_InLPB"; $_t_oldMethodName)