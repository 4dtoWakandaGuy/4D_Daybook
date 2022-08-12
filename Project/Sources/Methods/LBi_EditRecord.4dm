//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_EditRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($4)
	C_LONGINT:C283($_l_CountRecords; $1; $5; $6; $7; $8)
	C_POINTER:C301($_Ptr_Table; $3; vFieldPtr; vFilePtr)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_EditRecord")

//NG 20/7/06 This method is a replacementt for ALeditRecord
$_t_oldMethodName:=ERR_MethodTracker("LBi_EditRecord")
//EditRecord

//edit  record for a company

//vFilePtr - file to edit or add to
//$1 - Primary key for file
//$2 - layout to use
//$3 - file to use
//$4 - new window true
//$5 - window width
//$6 - window height
//$7 - window position
//$8 - window type



READ WRITE:C146($3->)
//vFieldptr:=GetFieldPtr($3;"Id")
QUERY:C277($3->; vFieldPtr->=$1)
FORM SET INPUT:C55($3->; $2)
$_l_CountRecords:=Records in selection:C76($3->)

If ($_l_CountRecords<2) & ($4)
	//OpenWindow($5;$6;$7;$8;"";"CloseLayout")
End if 

Case of 
	: ($_l_CountRecords=1)  //one record
		$_Ptr_Table:=vFilePtr
		vFilePtr:=$3
		MODIFY RECORD:C57($3->; *)
		vFilePtr:=$_Ptr_Table
		
	: ($_l_CountRecords>1)  //more than record - panic!!
		Gen_Alert("Procedure - EditRecord")
		
	: ($_l_CountRecords=0)  // no record therefore add one
		$_Ptr_Table:=vFilePtr
		vFilePtr:=$3
		ADD RECORD:C56($3->; *)
		vFilePtr:=$_Ptr_Table
End case 

If ($_l_CountRecords<2) & ($4)
	CLOSE WINDOW:C154
	WS_KeepFocus
	
End if 

READ ONLY:C145($3->)
ERR_MethodTrackerReturn("LBi_EditRecord"; $_t_oldMethodName)