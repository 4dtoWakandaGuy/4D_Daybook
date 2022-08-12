//%attributes = {}
If (False:C215)
	//Project Method Name:      AAjunk_8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/10/2012 12:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(MareaName)
	//ARRAY LONGINT(<>FS_al_FormSortFieldNum;0)
	C_REAL:C285(mref)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AAjunk_8")

FSettings_loadPreferences("AO")
MareaName:="00105 Mailing Contacts"

mref:=21
<>FS_al_FormSortFieldNum{Mref}:=1
FSetting_savePreferences
ERR_MethodTrackerReturn("AAjunk_8"; $_t_oldMethodName)