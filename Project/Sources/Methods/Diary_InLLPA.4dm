//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InLLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/12/2009 14:59`Method: Diary_InLLPA
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; $_bo_Sequence; $3)
	C_LONGINT:C283($1; Csave; write)
	C_TEXT:C284($_t_DiaryResultCode; $_t_DiaryResultCodeOLD; $_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InLLPA")
//See also Diary_InLPA..the difference is that this one is SUPPOSED to be used where a document may be attached..
//However this one has been used from SD_SaveRecord..
[DOCUMENTS:7]Write_:5:=WR Area to picture:P12000:139(write; 1; 1)
$_bo_Sequence:=False:C215
If (Count parameters:C259=3)
	cSave:=$1  //CSave is used in Diary_PrintS
	$_t_DiaryResultCode:=$2
	$_bo_Sequence:=$3
Else 
	$_t_DiaryResultCode:=$_t_DiaryResultCodeOLD
End if 
If (cSave=0)
	cSave:=1
End if 
Diary_PersPrior
If ([DIARY:12]Document_Code:15#"")
	$_bo_Continue:=Diary_PrintS
End if 

If ((DB_GetModuleSettingByNUM(Module_Sequences))>1) & (Not:C34($_bo_Sequence))
	If (([DIARY:12]Action_Code:9#"") & ([DIARY:12]Result_Code:11#"") & ($_t_DiaryResultCode#[DIARY:12]Result_Code:11) & (Records in table:C83([WORKFLOW_CONTROL:51])>0))
		If (Count parameters:C259>=3)
			Diary_InLPASeq("LPA"; True:C214)
			
		Else 
			Diary_InLPASeq("LPA")
		End if 
		
		OK:=1
	End if 
End if 
ERR_MethodTrackerReturn("Diary_InLLPA"; $_t_oldMethodName)