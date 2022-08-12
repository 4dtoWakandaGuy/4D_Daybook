//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI_SortCalc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2010 15:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY INTEGER:C220($_ai_SortOrder; 0)
	C_LONGINT:C283($_l_CountRecords; $_l_Index; $_l_RecordNumber; vALLevels)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SortCalc")
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
$_l_RecordNumber:=Record number:C243([ORDER_ITEMS:25])
If (DB_t_CurrentFormUsage3="Job@")
	If (Length:C16(DB_t_CurrentFormUsage3)=4)
		JobStages_InLOI(Substring:C12(DB_t_CurrentFormUsage3; 4; 1))
	Else 
		Jobs_InLPOI
	End if 
Else 
	Orders_InLPOI
End if 
$_l_CountRecords:=Records in selection:C76([ORDER_ITEMS:25])
ARRAY INTEGER:C220($_ai_SortOrder; $_l_CountRecords)
For ($_l_Index; 1; $_l_CountRecords)
	$_ai_SortOrder{$_l_Index}:=$_l_Index
End for 
ARRAY TO SELECTION:C261($_ai_SortOrder; [ORDER_ITEMS:25]Sort_Order:26)
If (DB_t_CurrentFormUsage3="Job@")
	[JOBS:26]Sort_No:22:=$_l_CountRecords
Else 
	[ORDERS:24]Sort_Number:27:=$_l_CountRecords
	If (vALLevels>0)
		Orders_InLPß("S1")
		//If (vALUsed)  `temporary
		GOTO RECORD:C242([ORDER_ITEMS:25]; $_l_RecordNumber)
		
	End if 
	//End if
End if 
ERR_MethodTrackerReturn("OrderI_SortCalc"; $_t_oldMethodName)
