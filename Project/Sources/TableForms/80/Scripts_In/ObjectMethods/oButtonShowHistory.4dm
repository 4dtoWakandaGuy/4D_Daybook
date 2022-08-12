If (False:C215)
	//object Name: [SCRIPTS]Scripts_in.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2012 09:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(MAC_LB_Modificatons;0)
	//ARRAY DATE(SMC_ad_LastModifiedDates;0)
	//ARRAY TEXT(SMC_at_LastEditedPersons;0)
	//ARRAY TEXT(SMC_at_LastModifiedTexts;0)
	C_LONGINT:C283($_l_offset; MAC_l_BUT1; MAC_l_BUT2; MAC_l_BUT3; SMC_l_OwnerID)
	C_TEXT:C284($_t_oldMethodName; oMAC_COL1; oMAC_COL2; oMAC_COL3; oMAC_HED1; oMAC_HED2; oMAC_HED3; SMC_t_OwnerNAME)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].Scripts_in.Variable8"; Form event code:C388)
ARRAY TEXT:C222(SMC_at_LastEditedPersons; 0)
ARRAY DATE:C224(SMC_ad_LastModifiedDates; 0)
ARRAY TEXT:C222(SMC_at_LastModifiedTexts; 0)
$_l_offset:=0
BLOB TO VARIABLE:C533([SCRIPTS:80]Modified_Info:14; SMC_l_OwnerID; $_l_offset)
If (BLOB size:C605([SCRIPTS:80]Modified_Info:14)>$_l_offset)
	BLOB TO VARIABLE:C533([SCRIPTS:80]Modified_Info:14; SMC_at_LastEditedPersons; $_l_offset)
	If (BLOB size:C605([SCRIPTS:80]Modified_Info:14)>$_l_offset)
		BLOB TO VARIABLE:C533([SCRIPTS:80]Modified_Info:14; SMC_ad_LastModifiedDates; $_l_offset)
		If (BLOB size:C605([SCRIPTS:80]Modified_Info:14)>$_l_offset)
			BLOB TO VARIABLE:C533([SCRIPTS:80]Modified_Info:14; SMC_at_LastModifiedTexts; $_l_offset)
		End if 
	End if 
End if 
READ ONLY:C145([PERSONNEL:11])
If (SMC_l_OwnerID>0)
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=SMC_l_OwnerID)
	SMC_t_OwnerNAME:=[PERSONNEL:11]Name:2
Else 
	SMC_t_OwnerNAME:=""
End if 

LB_SetupListbox(->MAC_LB_Modificatons; "oMAC_"; "MAC_L"; 1; ->SMC_ad_LastModifiedDates; ->SMC_at_LastEditedPersons; ->SMC_at_LastModifiedTexts)

LB_SetColumnHeaders(->MAC_LB_Modificatons; "MAC_L"; 1; "Date"; "Person"; "Text")
LB_SetColumnWidths(->MAC_LB_Modificatons; "oMacros"; 1; 81; 191; 0)  // dont need to worry about the invisible ones
LB_StyleSettings(->MAC_LB_Modificatons; "Black"; 9; "Macros"; ->[PREFERENCES:116])
LB_SetEnterable(->MAC_LB_Modificatons; False:C215; 0; "")
LB_SetColours(->MAC_LB_Modificatons; Black:K11:16; Grey:K11:15; Light grey:K11:13)  // stripey - white font black/grey stipes

LB_SetScroll(->MAC_LB_Modificatons; -1; 0)
LB_StyleSettings(->MAC_LB_Modificatons; "Black"; 9; "results"; ->[PREFERENCES:116])


FORM GOTO PAGE:C247(2)
ERR_MethodTrackerReturn("OBJ [SCRIPTS].Scripts_in.Variable8"; $_t_oldMethodName)
