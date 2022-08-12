//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_TransferOrderComments
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/11/2012 18:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(COM_al_DocIncludes;0)
	//ARRAY LONGINT(COM_AL_FormIDs;0)
	//ARRAY LONGINT(COM_al_TabIds;0)
	//ARRAY LONGINT(COM_al_TabIncludes;0;0)
	//ARRAY TEXT(COM_at_TabNames;0)
	C_LONGINT:C283($_l_ActionID; $_l_CommentsTabRow)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_TransferOrderComments")
//TRACE

SD2_CheckDefaultAction("COM")
QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1="COM")
$_l_ActionID:=[ACTIONS:13]xID:12

ARRAY TEXT:C222(COM_at_TabNames; 0)
ARRAY LONGINT:C221(COM_al_TabIds; 0)
ARRAY LONGINT:C221(COM_AL_FormIDs; 0)
ARRAY LONGINT:C221(COM_al_TabIncludes; 0; 0)
ARRAY LONGINT:C221(COM_al_DocIncludes; 0)
SD2_LoadTabSetting(True:C214; Table:C252(->[ORDERS:24]); ->COM_at_TabNames; ->COM_al_TabIncludes; ->COM_al_DocIncludes; ->COM_al_TabIds; ->COM_Al_FormIDs)
$_l_CommentsTabRow:=Find in array:C230(COM_at_TabNames; "Comments")
If ($_l_CommentsTabRow<0)
	APPEND TO ARRAY:C911(COM_at_TabNames; "Comments")
	INSERT IN ARRAY:C227(COM_al_TabIncludes; Size of array:C274(COM_al_TabIncludes)+1; 1)
	APPEND TO ARRAY:C911(COM_al_TabIncludes{Size of array:C274(COM_al_TabIncludes)}; $_l_ActionID)
	APPEND TO ARRAY:C911(COM_Al_FormIDs; 1)
	APPEND TO ARRAY:C911(COM_al_DocIncludes; 0)
	
End if 
SD2_LoadTabSetting(False:C215)
READ WRITE:C146([ORDERS:24])
ALL RECORDS:C47([ORDERS:24])
QUERY:C277([ORDERS:24]; [ORDERS:24]Comments_2:40#"")

APPLY TO SELECTION:C70([ORDERS:24]; ORD_CommentstoDiary(->[ORDERS:24]Comments_2:40))





ERR_MethodTrackerReturn("DB_TransferOrderComments"; $_t_oldMethodName)
ERR_MethodTrackerReturn("DB_TransferOrderComments"; $_t_oldMethodName)