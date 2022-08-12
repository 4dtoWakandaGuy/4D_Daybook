//%attributes = {}
If (False:C215)
	//Project Method Name:      User_inAddPreference
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 20:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_UserTabPage;0)
	//ARRAY TEXT(DB_at_USERTAB;0)
	C_LONGINT:C283($_l_SizeofArray; $2; $_l_PageNumber; $_l_SizeofArray; $2)
	C_TEXT:C284($_t_UserTabSTR; $1; $_t_oldMethodName; $_t_UserTabSTR; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_inAddPreference")

$_t_UserTabSTR:=$1
$_l_PageNumber:=$2


$_l_SizeofArray:=Size of array:C274(DB_at_USERTAB)+1
INSERT IN ARRAY:C227(DB_at_USERTAB; $_l_SizeofArray; 1)
INSERT IN ARRAY:C227(DB_al_UserTabPage; $_l_SizeofArray; 1)

DB_at_USERTAB{$_l_SizeofArray}:=$_t_UserTabSTR
DB_al_UserTabPage{$_l_SizeofArray}:=$_l_PageNumber

ERR_MethodTrackerReturn("User_inAddPreference"; $_t_oldMethodName)
