//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Macro Import
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_FieldType; $_l_Index; $_l_Number; $_l_Process; $_l_Progress; $_l_TableNumber; $_l_TableNumber1; $3; vNo)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_FieldNUM; $_t_Filename; $_t_oldMethodName; $4; $Version)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro Import")
//Macro Import


ON ERR CALL:C155("Remote_Err")
SET CHANNEL:C77(10; Gen_DocName($4))
$_l_TableNumber1:=Table:C252($1)
RECEIVE VARIABLE:C81($_l_TableNumber)
OK:=1
While ((OK=1) & (($_l_TableNumber#$_l_TableNumber1) | ($_l_TableNumber=0) | ($_l_TableNumber>Get last table number:C254)))
	Gen_Confirm("Please show me a valid Macros import file called '"+Gen_DocName($4)+"'")
	If (OK=1)
		SET CHANNEL:C77(10; "")
		If (OK=1)
			RECEIVE VARIABLE:C81($_l_TableNumber)
			OK:=1
		End if 
	End if 
End while 
ON ERR CALL:C155("")

If (OK=1)
	$_t_Filename:=Uppers2(Lowercase:C14(Table name:C256($_l_TableNumber)))
	CREATE EMPTY SET:C140($1->; "Import")
	GET FIELD PROPERTIES:C258($2; $_l_FieldType)
	RECEIVE VARIABLE:C81($Version)
	$_l_Index:=Position:C15("/"; $Version)  //remove the no of records
	If ($_l_Index>0)
		vNo:=Num:C11(Substring:C12($Version; $_l_Index+1; 35))
		$Version:=Substring:C12($Version; 1; $_l_Index-1)
	Else 
		vNo:=0
	End if 
	//  If ($Version#◊VersionNo)
	//  Gen_Confirm ("This data was exported from version "
	//+$Version+" of Daybook, whereas you are "
	//currently using Version "+◊VersionNo+".  If the data stored has changed,"
	// the results will be unpredictable.";"Cancel";"Continue")
	//    If (OK=1)
	//     OK:=0
	//   Else
	//   OK:=1
	//   End if
	//  End if
	If (vNo>0)
		$_l_Progress:=Progress2_Start("Importing ...")
	Else 
		$_l_Progress:=0
	End if 
	If ($_l_Progress=0)
		$_l_Process:=Current process:C322
	Else 
		$_l_Process:=$_l_Progress
	End if 
	$_l_Index:=1
	While ((OK=1) & (<>SYS_l_CancelProcess#$_l_Process))
		If (vNo>0)
			Progress2_Call($_l_Progress; "Importing "+$_t_Filename+": "+String:C10($_l_Index)+" of "+String:C10(vNo); $_l_Index; vNo)
		End if 
		RECEIVE VARIABLE:C81($_t_FieldNUM)
		If (OK=1)
			If (($_l_FieldType=1) | ($_l_FieldType=8) | ($_l_FieldType=9) | ($_l_FieldType=11))
				$_l_Number:=Num:C11($_t_FieldNUM)
				QUERY:C277($1->; $2->=$_l_Number)
			Else 
				QUERY:C277($1->; $2->=$_t_FieldNUM)
			End if 
			If (Records in selection:C76($1->)>0)
				If ($3=1)
					DELETE SELECTION:C66($1->)
					CREATE RECORD:C68($1->)
					RECEIVE RECORD:C79($1->)
					
					
					DB_SaveRecord($1)
				Else 
					RECEIVE RECORD:C79($1->)
				End if 
			Else 
				CREATE RECORD:C68($1->)
				RECEIVE RECORD:C79($1->)
				DB_SaveRecord($1)
			End if 
			ADD TO SET:C119($1->; "Import")
		End if 
		$_l_Index:=$_l_Index+1
	End while 
	
	If (vNo>0)
		Progress2_Call($_l_Progress; "")
	End if 
	
	SET CHANNEL:C77(11)
	OK:=1
End if 
ERR_MethodTrackerReturn("Macro Import"; $_t_oldMethodName)
